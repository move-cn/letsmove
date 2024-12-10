import os
import json
import subprocess
import re
from pathlib import Path

class SuiGameAutomation:
    def __init__(self):
        self.base_path = "/Volumes/extdisk/project/sui/letsmove/mover/yueliao11/code"
        self.state_file = Path(self.base_path) / "automation_state.json"
        self.package_ids = {}
        self.object_ids = {}
        self.completed_steps = set()
        self.load_state()
        
    def save_state(self):
        """保存当前执行状态到文件"""
        state = {
            'package_ids': self.package_ids,
            'object_ids': self.object_ids,
            'completed_steps': list(self.completed_steps)
        }
        with open(self.state_file, 'w') as f:
            json.dump(state, f, indent=2)
        print(f"\n状态已保存到: {self.state_file}")

    def load_state(self):
        """从文件加载执行状态"""
        if self.state_file.exists():
            try:
                with open(self.state_file, 'r') as f:
                    state = json.load(f)
                self.package_ids = state.get('package_ids', {})
                self.object_ids = state.get('object_ids', {})
                self.completed_steps = set(state.get('completed_steps', []))
                print(f"\n已加载之前的执行状态:")
                print(f"已完成步骤: {self.completed_steps}")
                print(f"Package IDs: {json.dumps(self.package_ids, indent=2)}")
                print(f"Object IDs: {json.dumps(self.object_ids, indent=2)}")
            except Exception as e:
                print(f"\n加载状态文件失败: {e}")
                self.reset_state()
        else:
            print("\n未找到状态文件，将从头开始执行")
            self.reset_state()

    def reset_state(self):
        """重置所有状态"""
        self.package_ids = {}
        self.object_ids = {}
        self.completed_steps = set()
        if self.state_file.exists():
            self.state_file.unlink()
        print("\n状态已重置")

    def step_completed(self, step_name):
        """检查步骤是否已完成"""
        return step_name in self.completed_steps

    def mark_step_completed(self, step_name):
        """标记步骤为已完成并保存状态"""
        self.completed_steps.add(step_name)
        self.save_state()

    def run_command(self, command, cwd=None):
        print(f"\n执行命令: {command}")
        if cwd is None:
            cwd = self.base_path
        
        result = subprocess.run(
            command,
            shell=True,
            cwd=cwd,
            capture_output=True,
            text=True
        )
        
        print(f"输出:\n{result.stdout}")
        if result.stderr:
            print(f"错误:\n{result.stderr}")
            
        return result.stdout

    def extract_package_id(self, output):
        """提取 Package ID，处理更多的输出格式"""
        # 尝试多种可能的匹配模式
        patterns = [
            r'Successfully published package with ID: (\b0x[a-fA-F0-9]{64}\b)',
            r'Created new package with ID: (\b0x[a-fA-F0-9]{64}\b)',
            r'Package ID: (\b0x[a-fA-F0-9]{64}\b)',
            r'Created Objects:.*?\n.*?(\b0x[a-fA-F0-9]{64}\b)'
        ]
        
        for pattern in patterns:
            matches = re.findall(pattern, output, re.DOTALL)
            if matches:
                return matches[0]
        
        # 如果没有找到匹配，打印完整输出以便调试
        print("\n完整输出内容:")
        print(output)
        return None

    def extract_treasury_cap(self, output):
        matches = re.findall(r'Created Objects:.*?ID: (\b0x[a-fA-F0-9]{64}\b).*?TreasuryCap', output, re.DOTALL)
        if matches:
            return matches[0]
        return None

    def publish_faucetcoin(self):
        if self.step_completed('publish_faucetcoin'):
            print("\n跳过: Faucetcoin合约已发布")
            return

        print("\n发布 Faucetcoin 合约...")
        
        # 先构建项目
        build_command = "sui move build"
        self.run_command(build_command, cwd=f"{self.base_path}/task2/faucetcoin")
        
        # 发布合约
        publish_command = "sui client publish --gas-budget 20000000"
        output = self.run_command(publish_command, cwd=f"{self.base_path}/task2/faucetcoin")
        
        package_id = self.extract_package_id(output)
        if package_id:
            self.package_ids['faucetcoin'] = package_id
            print(f"Faucetcoin Package ID: {package_id}")
        else:
            raise Exception("Failed to extract Faucetcoin Package ID")

        treasury_cap_id = self.extract_treasury_cap(output)
        if treasury_cap_id:
            self.object_ids['treasury_cap'] = treasury_cap_id
            print(f"Treasury Cap ID: {treasury_cap_id}")
            self.mark_step_completed('publish_faucetcoin')
        else:
            raise Exception("Failed to extract Treasury Cap ID")

    def publish_game(self):
        if self.step_completed('publish_game'):
            print("\n跳过: 游戏合约已发布")
            return

        print("\n发布游戏合约...")
        output = self.run_command(
            "sui client publish --gas-budget 20000000",
            cwd=f"{self.base_path}/task4"
        )
        
        package_id = self.extract_package_id(output)
        if package_id:
            self.package_ids['game'] = package_id
            print(f"Game Package ID: {package_id}")
            self.mark_step_completed('publish_game')
        else:
            raise Exception("Failed to extract Game Package ID")

    def mint_coins(self, amount=1000000):
        if self.step_completed('mint_coins'):
            print("\n跳过: 代币已铸造")
            return

        print("\n铸造代币...")
        address = self.get_address()
        command = f"""
        sui client call \
        --package {self.package_ids['faucetcoin']} \
        --module bright_faucet_coin \
        --function mint \
        --args {self.object_ids['treasury_cap']} {amount} {address} \
        --gas-budget 20000000
        """
        output = self.run_command(command)
        
        # 提取铸造的代币ID
        coin_id = re.search(r'Created Objects:.*?ID: (\b0x[a-fA-F0-9]{64}\b)', output, re.DOTALL)
        if coin_id:
            self.object_ids['coin'] = coin_id.group(1)
            print(f"Minted Coin ID: {coin_id.group(1)}")
            self.mark_step_completed('mint_coins')
        else:
            raise Exception("Failed to extract minted coin ID")

    def deposit_to_game(self, amount=1000000):
        if self.step_completed('deposit_to_game'):
            print("\n跳过: 已向游戏池充值")
            return

        print("\n向游戏池充值...")
        command = f"""
        sui client call \
        --package {self.package_ids['game']} \
        --module bright_flip \
        --function deposit \
        --args {self.object_ids['game']} {self.object_ids['coin']} \
        --gas-budget 20000000
        """
        self.run_command(command)
        self.mark_step_completed('deposit_to_game')

    def play_game(self, guess=True, bet_amount=100000):
        if self.step_completed('play_game'):
            print("\n跳过: 已完成游戏")
            return

        print("\n开始游戏...")
        rand_output = self.run_command("sui client create-random")
        rand_matches = re.findall(r'ID: (\b0x[a-fA-F0-9]{64}\b)', rand_output)
        
        if rand_matches:
            rand_id = rand_matches[0]
            print(f"Random Object ID: {rand_id}")
            
            command = f"""
            sui client call \
            --package {self.package_ids['game']} \
            --module bright_flip \
            --function play \
            --args {self.object_ids['game']} {str(guess).lower()} {self.object_ids['coin']} {rand_id} \
            --gas-budget 20000000
            """
            self.run_command(command)
            self.mark_step_completed('play_game')
        else:
            raise Exception("Failed to create random object")

    def withdraw_funds(self, amount=500000):
        if self.step_completed('withdraw_funds'):
            print("\n跳过: 已完成提取资金")
            return

        print("\n管理员提取资金...")
        command = f"""
        sui client call \
        --package {self.package_ids['game']} \
        --module bright_flip \
        --function withdraw \
        --args {self.object_ids['admin_cap']} {self.object_ids['game']} {amount} \
        --gas-budget 20000000
        """
        self.run_command(command)
        self.mark_step_completed('withdraw_funds')

    def get_address(self):
        output = self.run_command("sui client active-address")
        address = output.strip()
        return address

    def run_full_flow(self):
        try:
            print("开始自动化流程...")
            
            print("\n1. 发布 Faucetcoin 合约")
            self.publish_faucetcoin()
            
            print("\n2. 发布游戏合约")
            self.publish_game()
            
            print("\n3. 铸造代币")
            self.mint_coins()
            
            print("\n4. 向游戏池充值")
            self.deposit_to_game()
            
            print("\n5. 进行游戏")
            self.play_game()
            
            print("\n6. 管理员提取资金")
            self.withdraw_funds()
            
            print("\n自动化流程完成!")
            
        except Exception as e:
            print(f"\n错误: {str(e)}")
            print("当前状态:")
            print(f"已完成步骤: {self.completed_steps}")
            print(f"Package IDs: {json.dumps(self.package_ids, indent=2)}")
            print(f"Object IDs: {json.dumps(self.object_ids, indent=2)}")

    def clean_state(self):
        """清理状态文件"""
        self.reset_state()
        print("\n状态已清理")

if __name__ == "__main__":
    import sys
    
    automation = SuiGameAutomation()
    
    if len(sys.argv) > 1 and sys.argv[1] == '--clean':
        automation.clean_state()
    else:
        automation.run_full_flow()
