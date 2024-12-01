# sui-cli使用指南

💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove

🧑‍💻作者：gracecampo
## sui cli 介绍
Sui CLI 命令提供与 Sui 网络交互的终端命令入口。典型用途包括发布 Move 智能合约、获取对象信息、执行事务或管理地址。
### 检查sui cli 安装及版本
使用sui cli 之前,必须检查是否已经安装成功，可以在终端窗口输入一下命令
> sui --version

如果未安装，可参考之前文章：[如何安装sui](https://learnblockchain.cn/article/9860)

### 查看sui cli 支持的命令列表
>  sui client


```text
Usage: sui client [OPTIONS] [COMMAND]

Commands:
active-address              Default address used for commands when none specified
active-env                  Default environment used for commands when none specified
addresses                   Obtain the Addresses managed by the client
balance                     List the coin balance of an address
call                        Call Move function
chain-identifier            Query the chain identifier from the rpc endpoint
dynamic-field               Query a dynamic field by its address
envs                        List all Sui environments
execute-signed-tx           Execute a Signed Transaction. This is useful when the user prefers to sign elsewhere and use this command to execute
execute-combined-signed-tx  Execute a combined serialized SenderSignedData string
faucet                      Request gas coin from faucet. By default, it will use the active address and the active network
gas                         Obtain all gas objects owned by the address. An address' alias can be used instead of the address
merge-coin                  Merge two coin objects into one coin
new-address                 Generate new address and keypair with keypair scheme flag {ed25519 | secp256k1 | secp256r1} with optional derivation path, default to m/44'/784'/0'/0'/0' for ed25519 or m/54'/784'/0'/0/0 for        
secp256k1 or m/74'/784'/0'/0/0 for secp256r1. Word length can be { word12 | word15 | word18 | word21 | word24} default to word12 if not specified
new-env                     Add new Sui environment
object                      Get object info
objects                     Obtain all objects owned by the address. It also accepts an address by its alias
pay                         Pay coins to recipients following specified amounts, with input coins. Length of recipients must be the same as that of amounts
pay-all-sui                 Pay all residual SUI coins to the recipient with input coins, after deducting the gas cost. The input coins also include the coin for gas payment, so no extra gas coin is required
pay-sui                     Pay SUI coins to recipients following following specified amounts, with input coins. Length of recipients must be the same as that of amounts. The input coins also include the coin for gas
payment, so no extra gas coin is required
ptb                         Run a PTB from the provided args
publish                     Publish Move modules
split-coin                  Split a coin object into multiple coins
switch                      Switch active address and network(e.g., devnet, local rpc server)
tx-block                    Get the effects of executing the given transaction block
transfer                    Transfer object
transfer-sui                Transfer SUI, and pay gas with the same SUI coin object. If amount is specified, only the amount is transferred; otherwise the entire object is transferred
upgrade                     Upgrade Move modules
verify-bytecode-meter       Run the bytecode verifier on the package
verify-source               Verify local Move packages against on-chain packages, and optionally their dependencies
profile-transaction         Profile the gas usage of a transaction. Unless an output filepath is not specified, outputs a file `gas_profile_{tx_digest}_{unix_timestamp}.json` which can be opened in a flamegraph tool such      
as speedscope
replay-transaction          Replay a given transaction to view transaction effects. Set environment variable MOVE_VM_STEP=1 to debug
replay-batch                Replay transactions listed in a file
replay-checkpoint           Replay all transactions in a range of checkpoints
help                        Print this message or the help of the given subcommand(s)

Options:
--client.config <CONFIG>  Sets the file storing the state of our user accounts (an empty one will be created if missing)
--json                    Return command outputs in json format
-y, --yes
-h, --help                    Print help

```
### 地址管理
地址相关命令
```text
sui client addresses  --查看地址列表
sui client active-address   --查看当前地址
sui client new-address ed25519  --创建地址
sui client new-address ed25519 MY_ALIAS --自定义地址别名
sui client switch --address ADDRESS   --切换地址,也支持别名切换
```
查看地址列表
> sui client addresses
```text
╭─────────────────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias               │ address                                                            │ active address │
├─────────────────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ quizzical-corundum  │ 0x6a7e12ee188658b7fb62d00b897143808e6a54e6185843dedb54eb70e70e3efe │ *              │
│ vigilant-quartz     │ 0xb76dbc0cab651095651eb550a522d450ab2a1c267ddc5ea70a263fe5b51a6013 │                │
│ pensive-chrysoberyl │ 0xc33c26e95d20423c2a4a9179ae59e845712f01682ac6bcbccf39f0f8542e6cdd │                │
╰─────────────────────┴────────────────────────────────────────────────────────────────────┴────────────────╯
```
>  sui client active-address   --查看当前地址
```text
0x6a7e12ee188658b7fb62d00b897143808e6a54e6185843dedb54eb70e70e3efe
```
> sui client new-address ed25519
```text
╭────────────────────────────────────────────────────────────────────────────────────────────╮
│ Created new keypair and saved it to keystore.                                              │
├────────────────┬───────────────────────────────────────────────────────────────────────────┤
│ alias          │ elastic-topaz                                                             │
│ address        │ 0x9ae8ca9263455c1a1d9243ebc5986496bb315b1c3343f1100851e218e7575348        │
│ keyScheme      │ ed25519                                                                   │
│ recoveryPhrase │ ready west frame ability drop valve quick snake bargain render ghost know │
╰────────────────┴───────────────────────────────────────────────────────────────────────────╯
```
> sui client new-address ed25519 MY_ALIAS
```text
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Created new keypair and saved it to keystore.                                                   │
├────────────────┬────────────────────────────────────────────────────────────────────────────────┤
│ alias          │ alice                                                                          │
│ address        │ 0x7307b3e2f4082027d8b59abeced019d3910346b50369af62e8b938573ec517ef             │
│ keyScheme      │ ed25519                                                                        │
│ recoveryPhrase │ version write opinion reject title isolate guard beef glare short they citizen │
╰────────────────┴────────────────────────────────────────────────────────────────────────────────╯
```
> sui client switch --address ADDRESS
```text
Active address switched to 0x7307b3e2f4082027d8b59abeced019d3910346b50369af62e8b938573ec517ef
```
### 测试代币获取
获取测试代币命令
```text
sui client faucet  --通过水龙头获取测试代币
sui client faucet --address ADDRESS  --指定地址通过水龙头获取测试代币
sui client faucet --url CUSTOM_FAUCET_URL ----指定水龙头URL地址获取测试代币
sui client gas                            ----获取当前地址测试代币余额
sui client gas ADDRESS                    ----获取指定地址测试代币余额
sui client objects                        ----获取地址的拥有对象                     
```
> sui client faucet
```text
Request successful. It can take up to 1 minute to get the coin. Run sui client gas to check your gas coins.
```
>sui client faucet --address ADDRESS
```text
Request successful. It can take up to 1 minute to get the coin. Run sui client gas to check your gas coins.
```
> sui client gas
```text
╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0xd46fd2a39983be3d9d9769c768c49ef2a16e8b36c20c28aa0634bf0d588ef7d1 │ 1000000000         │ 1.00             │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯
```
>sui client gas ADDRESS
```text
╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0x0677e401bae703cddbc0332d7098e9ac78e353984ca118f1705dbc97a67a9871 │ 1000000000         │ 1.00             │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯
```
### 环境管理
环境相关命令
```shell
sui client active-env  --获取当前的环境地址
sui client envs        --获取环境地址列表
sui client new-env --rpc URL --alias ALIAS  --添加自定义地址
sui client switch --env ENV_ALIAS  --切换当前环境
```
> sui client active-env
>> testnet

>sui client envs
```text
╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ testnet │ https://fullnode.testnet.sui.io:443 │ *      │
│ mainnet │ https://fullnode.mainnet.sui.io:443 │        │
│ devnet  │ https://fullnode.devnet.sui.io:443  │        │
╰─────────┴─────────────────────────────────────┴────────╯
```
> sui client new-env --rpc URL --alias ALIAS
```text
Added new Sui env [devnet] to config.
``` 
> sui client switch --env ENV_ALIAS
```text
Active environment switched to [mainnet]
```
创建、构建和测试 Move 项目
```text
sui move new PROJECT_NAME	在给定文件夹中创建新的 Move 项目
sui move build	在当前目录中构建 Move 项目
sui move build --path PATH	从给定路径构建 Move 项目
sui move test	在当前目录中测试 Move 项目
```
>sui move new PROJECT_NAME

创建完成,会在当前目录创建一个项目脚手架，通过RustRover打开

>sui move build
```text
PS F:\project\move-project\task3> sui move build
UPDATING GIT DEPENDENCY https://gitee.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3
```
>sui move build --path PATH
```text
PS F:\project\move-project> sui move build --path .\task4\
UPDATING GIT DEPENDENCY https://gitee.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task4
```
>sui move test
```text
PS F:\project\move-project\task3> sui move test
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3
Running Move unit tests
Test result: OK. Total tests: 0; passed: 0; failed: 0
```
### 执行事务
```text
sui client publish  --发布模块
sui client call --package PACKAGE --module MODULE --function FUNCTION	--调用 Move 包
sui client merge-coin --primary-coin COIN_ID --coin-to-merge COIN_ID	--合并两个硬币
sui client split-coin --coin-id COIN_ID --amounts 1000	--将硬币拆分为两个硬币：一个具有 1000 MIST，其余的
sui client pay-sui --input-coins COIN_ID --recipients ADDRESS --amounts 100000000  --将 0.1 SUI 转入地址，并使用相同的币种支付 gas
sui client transfer-sui --sui-coin-object-id COIN_ID --to ADDRESS	--将 SUI 对象转移到一个地址，并使用相同的币种进行 gas
```