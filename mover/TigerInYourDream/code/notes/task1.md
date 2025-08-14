
### 学习资源
Builder_DAO的视频课程和move导论的中文版。开始看这个视频或者直接看书就足够了

### ide配置

1. 截止 2024 年 3 月 21 日。配置 sui的 ide建议使用 sui-move-analyzer.  请先安装 rus工具链。然后打开 vscode sui-move-analyzer插件地址。先不要安装插件，先安装 sui-move-analyer本体，然后再安装和配置 vsc插件。注意：move导论中的命令和 sui-move-analyer中的安装命令不一样。都可以，插件中的展示命令和move导论中的命令安装的工具都可以使用（都试过了，应该是 sui-move-analyzer插件说明中命令行安装的版本更新。但是都可以使用）。

2. 注意有 move-analyzer插件，也可以使用。但是不如上面的新。建议使用前者

3. sui-move-analyzer 正确安装的标志是 可以正常的跳转定义，hover func，以及正确识别 symbols。如果没有做到这几项，请考虑升级。此外，直接使用 sui move new xxx 生成的项目。在 toml配置文件中不带正确的 sui address和 verson info.这两个配置项的缺失也影响 sui-move-analyzer的工作。使用 sui-move-analyzer生成的项目配置是比较齐全的。

4. Sui-move-analyzer还存在不起效的问题，请考虑 PATH的配置是否正确。sui-move-analyzer一般经过 cargo install,二进制文件在~/.cargo/bin 目录下

5. Sui-move-analyzer处于早期阶段，比较简陋。偶有问题比较正常，尝试重启解决

	### 代币的获取和发布合约

	1. 视频中展示了 discord获取测试代币的方法 如果如法正常获取

	```
	curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
	--header 'Content-Type: application/json' \
	--data-raw '{
	    "FixedAmountRequest": {
	        "recipient": "0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c"
	    }
	}'
	```

2. 注意上面这段是我的address， 注意替换

3. Publish 

	```
	sui client publish --gas-budget 5000000
	
	最后一项是 gas预算，酌情赋值
	```

4. 截止 2024 年 3 月 21 日，发布合约之后的 out_put和视频教程中的已经不同，以下是实例

	```
	output:
	
	UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
	INCLUDING DEPENDENCY Sui
	INCLUDING DEPENDENCY MoveStdlib
	BUILDING hello_sui
	Successfully verified dependencies on-chain against source.
	Transaction Digest: ZRPURYdM3fNf8UehkF9NybzvYmjC4FSzyMUANuduyTm
	╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
	│ Transaction Data                                                                                             │
	├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
	│ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                   │
	│ Gas Owner: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                │
	│ Gas Budget: 10000000 MIST                                                                                    │
	│ Gas Price: 1000 MIST                                                                                         │
	│ Gas Payment:                                                                                                 │
	│  ┌──                                                                                                         │
	│  │ ID: 0x2461c453d5cb1b6e85c9ee8b6c658b0a7e24fd92fef8f0598e12bf703a356ff1                                    │
	│  │ Version: 33                                                                                               │
	│  │ Digest: Bf6UU6P15QUPq95NWx558HEmjdL8FfudfbtzD3YnZAdp                                                      │
	│  └──                                                                                                         │
	│                                                                                                              │
	│ Transaction Kind: Programmable                                                                               │
	│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
	│ │ Input Objects                                                                                            │ │
	│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
	│ │ 0   Pure Arg: Type: address, Value: "0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c" │ │
	│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
	│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
	│ │ Commands                                                                │                                  │
	│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
	│ │ 0  Publish:                                                             │                                  │
	│ │  ┌                                                                      │                                  │
	│ │  │ Dependencies:                                                        │                                  │
	│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
	│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
	│ │  └                                                                      │                                  │
	│ │                                                                         │                                  │
	│ │ 1  TransferObjects:                                                     │                                  │
	│ │  ┌                                                                      │                                  │
	│ │  │ Arguments:                                                           │                                  │
	│ │  │   Result 0                                                           │                                  │
	│ │  │ Address: Input  0                                                    │                                  │
	│ │  └                                                                      │                                  │
	│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
	│                                                                                                              │
	│ Signatures:                                                                                                  │
	│    pgO8kCObQOnG9h6O6ibpaSjq+XOSR4m5eF4X3f0u6HCztwLc/6nbXX+YeuQ7l3apesJpD8QTiB7qImCuGEz1DA==                  │
	│                                                                                                              │
	╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
	╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
	│ Transaction Effects                                                                               │
	├───────────────────────────────────────────────────────────────────────────────────────────────────┤
	│ Digest: ZRPURYdM3fNf8UehkF9NybzvYmjC4FSzyMUANuduyTm                                               │
	│ Status: Success                                                                                   │
	│ Executed Epoch: 572                                                                               │
	│                                                                                                   │
	│ Created Objects:                                                                                  │
	│  ┌──                                                                                              │
	│  │ ID: 0x006010749185ba5873ddc17c4acebcd00ba31307a3182402d21241aec78b4d92                         │
	│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
	│  │ Version: 34                                                                                    │
	│  │ Digest: 2KUkzDuXRQTfxLzk24WKFrNcjHXNBz826VfpJmTYA6WS                                           │
	│  └──                                                                                              │
	│  ┌──                                                                                              │
	│  │ ID: 0xcc0862e19c3f073de4185e98ca0f480df7d62d8b02e0817c01094c155670f0da                         │
	│  │ Owner: Immutable                                                                               │
	│  │ Version: 1                                                                                     │
	│  │ Digest: 9K5PZPrhRpf82XYsPHSP4euVrmbhcbAPRfbPuyfybTvN                                           │
	│  └──                                                                                              │
	│ Mutated Objects:                                                                                  │
	│  ┌──                                                                                              │
	│  │ ID: 0x2461c453d5cb1b6e85c9ee8b6c658b0a7e24fd92fef8f0598e12bf703a356ff1                         │
	│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
	│  │ Version: 34                                                                                    │
	│  │ Digest: EQeLBuAMUfHECATuvJbRwXTiKe8Y7cPojJCChSH8qkHA                                           │
	│  └──                                                                                              │
	│ Gas Object:                                                                                       │
	│  ┌──                                                                                              │
	│  │ ID: 0x2461c453d5cb1b6e85c9ee8b6c658b0a7e24fd92fef8f0598e12bf703a356ff1                         │
	│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
	│  │ Version: 34                                                                                    │
	│  │ Digest: EQeLBuAMUfHECATuvJbRwXTiKe8Y7cPojJCChSH8qkHA                                           │
	│  └──                                                                                              │
	│ Gas Cost Summary:                                                                                 │
	│    Storage Cost: 7820400 MIST                                                                     │
	│    Computation Cost: 1000000 MIST                                                                 │
	│    Storage Rebate: 978120 MIST                                                                    │
	│    Non-refundable Storage Fee: 9880 MIST                                                          │
	│                                                                                                   │
	│ Transaction Dependencies:                                                                         │
	│    4FRXM7WZVSTnP1HvNLnoXYHL1XvwUwe14yd442h3AjHL                                                   │
	│    5RsXhNyWM1tiwDqMv71sRDs8ztFUsp7EMxd6LgSELdXw                                                   │
	╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
	╭─────────────────────────────╮
	│ No transaction block events │
	╰─────────────────────────────╯
	
	╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
	│ Object Changes                                                                                   │
	├──────────────────────────────────────────────────────────────────────────────────────────────────┤
	│ Created Objects:                                                                                 │
	│  ┌──                                                                                             │
	│  │ ObjectID: 0x006010749185ba5873ddc17c4acebcd00ba31307a3182402d21241aec78b4d92                  │
	│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                    │
	│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c ) │
	│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
	│  │ Version: 34                                                                                   │
	│  │ Digest: 2KUkzDuXRQTfxLzk24WKFrNcjHXNBz826VfpJmTYA6WS                                          │
	│  └──                                                                                             │
	│ Mutated Objects:                                                                                 │
	│  ┌──                                                                                             │
	│  │ ObjectID: 0x2461c453d5cb1b6e85c9ee8b6c658b0a7e24fd92fef8f0598e12bf703a356ff1                  │
	│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                    │
	│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c ) │
	│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
	│  │ Version: 34                                                                                   │
	│  │ Digest: EQeLBuAMUfHECATuvJbRwXTiKe8Y7cPojJCChSH8qkHA                                          │
	│  └──                                                                                             │
	│ Published Objects:                                                                               │
	│  ┌──                                                                                             │
	│  │ PackageID: 0xcc0862e19c3f073de4185e98ca0f480df7d62d8b02e0817c01094c155670f0da                 │
	│  │ Version: 1                                                                                    │
	│  │ Digest: 9K5PZPrhRpf82XYsPHSP4euVrmbhcbAPRfbPuyfybTvN                                          │
	│  │ Modules: hello_world                                                                          │
	│  └──                                                                                             │
	╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
	╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
	│ Balance Changes                                                                                   │
	├───────────────────────────────────────────────────────────────────────────────────────────────────┤
	│  ┌──                                                                                              │
	│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
	│  │ CoinType: 0x2::sui::SUI                                                                        │
	│  │ Amount: -7842280                                                                               │
	│  └──                                                                                              │
	╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
	```

	

