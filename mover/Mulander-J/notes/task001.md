# 完成第一个合约上链
- 上链网络: 测试网(testnet)

## 需求
- 完成Sui钱包安装
- 完成Sui CLI安装
- 完成获取测试网络SUI学习
- 完成Sui浏览器学习
- 提交`Hello Move`合约发布`package id`

## 任务指南

### Sui CLI

Install

```bash
# 已安装Rust
➜  rustc -V
rustc 1.73.0 (cc66ad468 2023-10-03)
# 下载依赖
➜  sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
# Install Sui binaries from source
# 安装mainnet版本 branch
➜  cargo install --locked --git https://github.com/MystenLabs/sui.git --branch mainnet sui
# 安装testnet版本 testnet branch
➜  cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
# 构建会比较慢，耐心等待
Compiling ...
Building[===>]
# 检验 binaries 是否安装成功
➜  sui --version
sui 1.17.3-ebcb58ff2

➜  ~ sui -h
A Byzantine fault tolerant chain with low-latency finality and high throughput

Usage: sui <COMMAND>

Commands:
  start             Start sui network
  network
  genesis           Bootstrap and initialize a new sui network
  genesis-ceremony
  keytool           Sui keystore tool
  console           Start Sui interactive console
  client            Client for interacting with the Sui network
  validator         A tool for validators and validator candidates
  move              Tool to build and test Move applications
  fire-drill        Tool for Fire Drill
  help              Print this message or the help of the given subcommand(s)

Options:
  -h, --help     Print help
  -V, --version  Print version
```

Client Env

```bash
# 首次设置环境会先新建地址，后续可以手动删除sui_config目录
➜  ~ sui client envs
Config file ["/home/user/.sui/sui_config/client.yaml"] doesnt exist, do you want to connect to a Sui Full node server [y/N]?y
Sui Full node server URL (Defaults to Sui Devnet if not specified) :
Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2: for secp256r1):
➜  2
Generated new keypair and alias for address with scheme "secp256r1" [awesome-garnet: 0x************************************************************b5c4]
Secret Recovery Phrase : [horse year ***** ***** ***** ***** ***** ***** ***** ***** antenna project]
╭────────┬────────────────────────────────────┬────────╮
│ alias  │ url                                │ active │
├────────┼────────────────────────────────────┼────────┤
│ devnet │ https://fullnode.devnet.sui.io:443 │ *      │
╰────────┴────────────────────────────────────┴────────╯
# 添加新环境
➜  ~ sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
Added new Sui env [testnet] to config.
➜  ~ sui client envs
╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ devnet  │ https://fullnode.devnet.sui.io:443  │ *      │
│ testnet │ https://fullnode.testnet.sui.io:443 │        │
╰─────────┴─────────────────────────────────────┴────────╯
# 切换环境
➜  ~ sui client switch --env testnet
Active environment switched to [testnet]
# 查看环境
➜  ~ sui client envs
╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ devnet  │ https://fullnode.devnet.sui.io:443  │        │
│ testnet │ https://fullnode.testnet.sui.io:443 │ *      │
╰─────────┴─────────────────────────────────────┴────────╯
# 清空client环境
➜  rm -rf ~/.sui/sui_config
```

Wallet Address

```bash
# list addresses
➜  ~ sui client addresses
╭────────────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias          │ address                                                            │ active address │
├────────────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ gallant-jet    │ 0x28a6d59ed8974ce37c2c04dffc19d5b04f7c3b9cf8c44116e1acb7d77d609287 │ *              │
│ awesome-garnet │ 0x98461f0106831e508c0e6bc6fd7bea4bfbf2929ff3c21079ad1f15dd3f66b5c4 │                │
╰────────────────┴────────────────────────────────────────────────────────────────────┴────────────────╯
# new address
➜  ~ sui client new-address ed25519
╭───────────────────────────────────────────────────────────────────────────────────────╮
│ Created new keypair and saved it to keystore.                                         │
├────────────────┬──────────────────────────────────────────────────────────────────────┤
│ alias          │ practical-avanturine                                                 │
│ address        │ 0x57a9bb31f7198bd3f1e07182c1a10f4484f6fc7bc6bd4a52ca8ee1254ff5f6b6   │
│ keyScheme      │ ed25519                                                              │
│ recoveryPhrase │ rare flavor tent **** **** **** **** **** **** **** luggage mass     │
╰────────────────┴──────────────────────────────────────────────────────────────────────╯
# switch address
➜  ~ sui client switch --address 0x57a9bb31f7198bd3f1e07182c1a10f4484f6fc7bc6bd4a52ca8ee1254ff5f6b6
Active address switched to 0x57a9bb31f7198bd3f1e07182c1a10f4484f6fc7bc6bd4a52ca8ee1254ff5f6b6
# check active address
➜  ~ sui client active-address
0x57a9bb31f7198bd3f1e07182c1a10f4484f6fc7bc6bd4a52ca8ee1254ff5f6b6
# list address with details
➜  ~ sui keytool list
╭────────────────────────────────────────────────────────────────────────────────────────────╮
│ ╭─────────────────┬──────────────────────────────────────────────────────────────────────╮ │
│ │ alias           │  gallant-jet                                                         │ │
│ │ suiAddress      │  0x28a6d59ed8974ce37c2c04dffc19d5b04f7c3b9cf8c44116e1acb7d77d609287  │ │
│ │ publicBase64Key │  AHou1Ok1FXP6HQqgslljr7d+WpKNFGs9K03BfdmejZvK                        │ │
│ │ keyScheme       │  ed25519                                                             │ │
│ │ flag            │  0                                                                   │ │
│ │ peerId          │  7a2ed4e9351573fa1d0aa0b25963afb77e5a928d146b3d2b4dc17dd99e8d9bca    │ │
│ ╰─────────────────┴──────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────┬──────────────────────────────────────────────────────────────────────╮ │
│ │ alias           │  practical-avanturine                                                │ │
│ │ suiAddress      │  0x57a9bb31f7198bd3f1e07182c1a10f4484f6fc7bc6bd4a52ca8ee1254ff5f6b6  │ │
│ │ publicBase64Key │  ACGVuc++N+POIwJBwwhlE9Bko1aoALhmm9QOWPj9peKf                        │ │
│ │ keyScheme       │  ed25519                                                             │ │
│ │ flag            │  0                                                                   │ │
│ │ peerId          │  2195b9cfbe37e3ce230241c3086513d064a356a800b8669bd40e58f8fda5e29f    │ │
│ ╰─────────────────┴──────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────┬──────────────────────────────────────────────────────────────────────╮ │
│ │ alias           │  awesome-garnet                                                      │ │
│ │ suiAddress      │  0x98461f0106831e508c0e6bc6fd7bea4bfbf2929ff3c21079ad1f15dd3f66b5c4  │ │
│ │ publicBase64Key │  AgPl4ZXr6bc/m4aVI6fFCoft1nFWL0bq3/vmNnujgM0tZA==                    │ │
│ │ keyScheme       │  secp256r1                                                           │ │
│ │ flag            │  2                                                                   │ │
│ │ peerId          │                                                                      │ │
│ ╰─────────────────┴──────────────────────────────────────────────────────────────────────╯ │
╰────────────────────────────────────────────────────────────────────────────────────────────╯
# check aliases
➜  ~ cat ~/.sui/sui_config/sui.aliases
[
  {
    "alias": "gallant-jet",
    "public_key_base64": "AHou1Ok1FXP6HQqgslljr7d+WpKNFGs9K03BfdmejZvK"
  },
  {
    "alias": "ecstatic-chrysoberyl",
    "public_key_base64": "ACGVuc++N+POIwJBwwhlE9Bko1aoALhmm9QOWPj9peKf"
  },
  {
    "alias": "awesome-garnet",
    "public_key_base64": "AgPl4ZXr6bc/m4aVI6fFCoft1nFWL0bq3/vmNnujgM0tZA=="
  }
]
# check keystore
➜  ~ cat ~/.sui/sui_config/sui.keystore
[
  "APD5LH5J1cn/xGGXTlVP7Dx************",
  "ACfa9ORj0SusKoUAZ************9yFHpMc8ek",
  "Ak1mQfw1I************CDDvMn5P39mc1ED"
]
# convert private key from base64 to hex
➜  ~ sui keytool convert ACfa9OR************HpMc8ek
╭─────┬────────────────────────────────────────────────────────────────────╮
│ hex │  27daf4e463d************************4acfbf72147a4c73c7a4  │
╰─────┴────────────────────────────────────────────────────────────────────╯
# import existed address by private key
➜  ~ sui keytool import 0x27daf4e463************b364acfbf72147a4c73c7a4 ed25519
# remove address
➜  ~ vim ~/.sui/sui_config/sui.aliases
➜  ~ vim ~/.sui/sui_config/sui.keystore
```

Transfer

```bash
# 查看地址列表，以及当前激活地址的token列表
➜  ~ sui client addresses;sui client gas
╭─────────────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias           │ address                                                            │ active address │
├─────────────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ modest-euclase  │ 0x2086d432968cdec966d3120b67e615dffb224200c517705faff55d7cd0ab573f │                │
│ hopeful-felspar │ 0x516aab6cbf100f17a482bd88db1836a85ec7713530cc13058f74a1ab4aff9265 │ *              │
╰─────────────────┴────────────────────────────────────────────────────────────────────┴────────────────╯
[warn] Client/Server api version mismatch, client api version : 1.17.3, server api version : 1.18.0
No gas coins are owned by this address
# 调用水龙头
➜  ~ curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "<YOUR_ADDRESS>"
    }
}'
# 或使用 sui-cli 水龙头
➜  ~ sui client gas
[warn] Client/Server api version mismatch, client api version : 1.18.1, server api version : 1.19.0
╭────────────────────────────────────────────────────────────────────┬────────────╮
│ gasCoinId                                                          │ gasBalance │
├────────────────────────────────────────────────────────────────────┼────────────┤
│ 0x8f2e5*****************************************************30ef69 │ 978408852  │
╰────────────────────────────────────────────────────────────────────┴────────────╯
➜  ~ sui client faucet --address 0x9da******8e918
Request successful. It can take up to 1 minute to get the coin. Run sui client gas to check your gas coins.
➜  ~ sui client gas
[warn] Client/Server api version mismatch, client api version : 1.18.1, server api version : 1.19.0
╭────────────────────────────────────────────────────────────────────┬────────────╮
│ gasCoinId                                                          │ gasBalance │
├────────────────────────────────────────────────────────────────────┼────────────┤
│ 0x37076*****************************************************4d736f │ 1000000000 │
│ 0x8f2e5*****************************************************30ef69 │ 978408852  │
╰────────────────────────────────────────────────────────────────────┴────────────╯
➜  ~
# 切换地址2，并查询token列表
➜  ~ sui client switch --address 0x2086d432968cdec966d3120b67e615dffb224200c517705faff55d7cd0ab573f;sui client gas
Active address switched to 0x2086d432968cdec966d3120b67e615dffb224200c517705faff55d7cd0ab573f
[warn] Client/Server api version mismatch, client api version : 1.17.3, server api version : 1.18.0
╭────────────────────────────────────────────────────────────────────┬────────────╮
│ gasCoinId                                                          │ gasBalance │
├────────────────────────────────────────────────────────────────────┼────────────┤
│ 0xc22854ab7f26655a939b3a9728b837cde221119ed2cc0f917e76b9a6ab38de30 │ 2000000000 │
╰────────────────────────────────────────────────────────────────────┴────────────╯
# 用地址2给地址1转账
➜  ~ sui client pay-sui --input-coins 0xc22854ab7f26655a939b3a9728b837cde221119ed2cc0f917e76b9a6ab38de30 --recipients 0x516aab6cbf100f17a482bd88db1836a85ec7713530cc13058f74a1ab4aff9265 --amounts 500000000 --gas-budget 10000000
```

### Hello Move

> Deployer Account: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918

```bash
# create new project
sui move new hello_move
# build test
sui move build
# publish contract
➜  hello_move git:(main) ✗ sui client publish 
UPDATING GIT DEPENDENCY https://gitee.com/mystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
Successfully verified dependencies on-chain against source.
Transaction Digest: GA1ig9mzgoGUMjExnm8AQd4MMTv982aqYqqZvgdosNJv
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                   │
│ Gas Owner: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x037f52536d3da7808c0c476439390395d6cc38c7f145cba7a3583d73c50b003b                                    │
│  │ Version: 892598                                                                                           │
│  │ Digest: 8DhEmue54JVvNYCpBZ1ZhHQradrsuDzWfEzdji5KmyKC                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918" │ │
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
│    cvoTf7oF7rlnp3HVu3vQNoAmBbUCTGzkek8CWsnluJ7nmm89ZdXZ23ie5bmI9ir3kkopmXT5f61P/JZfT9IoAA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GA1ig9mzgoGUMjExnm8AQd4MMTv982aqYqqZvgdosNJv                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 335                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x32d582512f243b3cc53cdfa6af7a1355cdf64dd20bb945b34a065100cfeabf2b                         │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )  │
│  │ Version: 892599                                                                                │
│  │ Digest: DayosaGoY7ErCWTX5jyrAub4Zhd5H1VHxaovdQgQVUvr                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb5707436b655d45f2fcac9cc7bc974ad0327ea41befd02dc6d40cec844b773ab                         │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )  │
│  │ Version: 892599                                                                                │
│  │ Digest: BQUyzrr1BxQ9SzWHw48wL49LNL3rkwnVyBrz2ngWLZ8k                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xcc197de5a3c441256e1acf74f0bff34b25f032f106083d54375df6f657f39d4f                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 9s5NtHNSCiCSZkpDiP758X2uustvsdoZBrTJrrPcbJqZ                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x037f52536d3da7808c0c476439390395d6cc38c7f145cba7a3583d73c50b003b                         │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )  │
│  │ Version: 892599                                                                                │
│  │ Digest: 7pADkDi3vuwrfBrpowc1tUVpxPeBqb9oqVVE9yCkBY4j                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x037f52536d3da7808c0c476439390395d6cc38c7f145cba7a3583d73c50b003b                         │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )  │
│  │ Version: 892599                                                                                │
│  │ Digest: 7pADkDi3vuwrfBrpowc1tUVpxPeBqb9oqVVE9yCkBY4j                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8770400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    7tTfkkYMvNvyxnVvoUhzy9DWmjVFUXUie5ZhaoJW92P3                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x32d582512f243b3cc53cdfa6af7a1355cdf64dd20bb945b34a065100cfeabf2b                  │
│  │ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                    │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 892599                                                                               │
│  │ Digest: DayosaGoY7ErCWTX5jyrAub4Zhd5H1VHxaovdQgQVUvr                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0xb5707436b655d45f2fcac9cc7bc974ad0327ea41befd02dc6d40cec844b773ab                  │
│  │ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                    │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 ) │
│  │ ObjectType: 0xcc197de5a3c441256e1acf74f0bff34b25f032f106083d54375df6f657f39d4f::hello::Hello  │
│  │ Version: 892599                                                                               │
│  │ Digest: BQUyzrr1BxQ9SzWHw48wL49LNL3rkwnVyBrz2ngWLZ8k                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x037f52536d3da7808c0c476439390395d6cc38c7f145cba7a3583d73c50b003b                  │
│  │ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                    │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 892599                                                                               │
│  │ Digest: 7pADkDi3vuwrfBrpowc1tUVpxPeBqb9oqVVE9yCkBY4j                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xcc197de5a3c441256e1acf74f0bff34b25f032f106083d54375df6f657f39d4f                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 9s5NtHNSCiCSZkpDiP758X2uustvsdoZBrTJrrPcbJqZ                                          │
│  │ Modules: hello                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8792280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```