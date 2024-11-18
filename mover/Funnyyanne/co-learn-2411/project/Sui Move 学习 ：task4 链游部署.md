# Sui Move 学习 ：task4 链游部署

> 
> 
> 
> **关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
> 

最近重新学习 Sui 区块链的开发，主要涉及Move 合约编写以及合约部署等方面。在此记录一下学习过程和重要命令。

基础的区块链知识：[[北京大学肖臻老师《区块链技术与应用》公开课](https://www.bilibili.com/video/BV1Vt411X7JF/?p=2&spm_id_from=333.1007.top_right_bar_window_history.content.click)]([https://www.notion.so/f7c389adb85d4a5a9b102aec1cc38b15?pvs=21](https://www.notion.so/f7c389adb85d4a5a9b102aec1cc38b15?pvs=21))

智能合约的用途：[https://www.bilibili.com/video/BV1BMD8Y2EfE/?spm_id_from=333.999.0.0](https://www.bilibili.com/video/BV1BMD8Y2EfE/?spm_id_from=333.999.0.0)

定义资产：定义USD，定义NFT

操作资产：增删改查

权限控制：限制访问，现在转移权限

# 一.基础命令

### 创建钱包

创建新钱包

`sui client new-address ed25519`

查看钱包地址

`sui client addresses`

切换当前使用的地址

`sui client switch --address <YOUR_ADDRESS>`

### 查看当前环境

`sui client  envs`

![Sui%20Move%20%E5%AD%A6%E4%B9%A0%20%EF%BC%9Atask4%20%E9%93%BE%E6%B8%B8%E9%83%A8%E7%BD%B2%201394fdefab2f805da1cec9bfca68bba0/image.png](Sui%20Move%20%E5%AD%A6%E4%B9%A0%20%EF%BC%9Atask4%20%E9%93%BE%E6%B8%B8%E9%83%A8%E7%BD%B2%201394fdefab2f805da1cec9bfca68bba0/image.png)

切换使用环境

`sui client switch --env testnet`

### **Move 合约开发**

```bash
# 创建新项目
sui move new my_project

# 项目结构
my_project/
├── Move.toml      # 项目配置文件
└── sources/       # 合约源码目

```

编译合约

`sui move build`

运行测试

`sui move test`

### [发布包之前，检查字节码是否超过规定值](https://easy.sui-book.com/chapter_5.html#%E5%8F%91%E5%B8%83%E5%8C%85%E4%B9%8B%E5%89%8D%E6%A3%80%E6%9F%A5%E5%AD%97%E8%8A%82%E7%A0%81%E6%98%AF%E5%90%A6%E8%B6%85%E8%BF%87%E8%A7%84%E5%AE%9A%E5%80%BC)

强烈建议在发包之前执行此操作，避免发布失败，消耗不必要的gas

`sui client verify-bytecode-meter`

添加gas 预算 可防止发布失败导致浪费

`sui client publish --gas-budget 100000`

报错记录

![Sui%20Move%20%E5%AD%A6%E4%B9%A0%20%EF%BC%9Atask4%20%E9%93%BE%E6%B8%B8%E9%83%A8%E7%BD%B2%201394fdefab2f805da1cec9bfca68bba0/image%201.png](Sui%20Move%20%E5%AD%A6%E4%B9%A0%20%EF%BC%9Atask4%20%E9%93%BE%E6%B8%B8%E9%83%A8%E7%BD%B2%201394fdefab2f805da1cec9bfca68bba0/image%201.png)

使用强制命令解决了：`sui client publish --gas-budget 100000000 --skip-fetch-latest-git-deps --skip-dependency-verification`

发布合约后记录返回的 package ID

### ⚠️ 注意

**常见问题与解决方案**

1. Gas 不足
- 确保设置足够的 gas-budget
- 从水龙头获取测试代币：sui client faucet （测试环境下）
1. 编译错误
- 检查 Move.toml 依赖配置
- 确保模块名称与文件名匹配
- 检查语法错误

# 二. Sui Move task4 链游部署

详细任务参考：[let‘s move 项目](https://github.com/move-cn/letsmove)

**ERC-20**  规定如何实现代币的协议之一。定义了一组代币在以太坊区块链上必须遵守的规范，提供与代币交换的通用框架，确保了不同程序，钱包之间的互操作性。

**代币**在区块链中表示数字资产，可以在区块链上被转移和交易，具有潜在价值。

**Coin** 在Move中，用户收到Coins 时，这些Coins会存储在用户的对象中（钱包），用户可自由提取对象中的Coins 并使用它们。

**TreasuryCap**

意译是国债资本，这里我理解为拥有代币操作权限的ID。

## **游戏玩法：**

- 玩家投入代币并猜测结果（true/false）
- 检查游戏合约余额是否充足
- 使用随机数生成器生成结果
- 如果猜对：玩家获得双倍奖励
- 如果猜错：玩家损失投入的代币
1. **安全措施：**
    
    AdminCap: 管理员权限凭证
    
    1. 破产保护
        
        ```rust
        if(game_val < coin_value*10) {
            abort EExceedLimit;
        };
        
        ```
        
    2. **余额检查**
        
        ```rust
        if (game_val < coin_value) {
            abort ENotEnough;
        };
        
        ```
        

确保游戏合约始终保持足够的储备金。

## 核心功能

初始化

```rust
fun init(ctx: &mut TxContext){
    // 创建游戏实例并共享
    let game = Game{
        id: object::new(ctx),
        val: zero(),
    };
    share_object(game);

    // 创建管理员权限并转移给部署者
    let admin = AdminCap{
        id: object::new(ctx),
    };
    transfer(admin,sender(ctx));
}

```

存款功能

```rust
public fun deposit(game: &mut Game, in: Coin<FUNNYYANNE_FAUCET_COIN>, _ctx: &mut TxContext)

```

提款功能

```rust
//**只有管理员可以从游戏合约提取代币。**
public fun withdraw(_: &AdminCap, game: &mut Game, out_amt: u64, ctx: &mut TxContext)

```

游戏核心逻辑

```rust
#[allow(lint(self_transfer))]
    public fun play (game: &mut Game, flip_value: bool, in: Coin<FUNNYYANNE_FAUCET_COIN>, rand: &Random,ctx: &mut TxContext){
        let coin_value = coin::value(&in);
        let play_address = sender(ctx);
        let game_val = balance::value(&game.val);

        if (game_val < coin_value) {
            abort ENotEnough;
        };

        // proctect the game from being bankrupted
        if(game_val < coin_value*10) {
            abort EExceedLimit;
        };

        let mut gen = random::new_generator(rand, ctx);
        let mut flag = random::generate_bool(&mut gen);

        if (flip_value == flag) {
            let win_balance = balance::split(&mut game.val, coin_value);
            let win_coin = from_balance(win_balance, ctx);
            public_transfer(win_coin, play_address);
            public_transfer(in, play_address);
        }else {
            let in_balance = into_balance(in);
            balance::join(&mut game.val, in_balance);
        }
    }

```

## **参考资料**

- [Sui 官方文档](https://docs.sui.io/)
- [Move 语言文档](https://move-language.github.io/move/)
- [Sui Examples](https://github.com/MystenLabs/sui/tree/main)