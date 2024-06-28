--- 任务要求 begin---

# 完成两个Coin合约的上链部署

- 上链网络: mainnet

## 需求

- 完成 Coin相关知识的学习
- 完成 `My Coin` 的学习并部署主网
- 完成 `Faucet Coin` 的学习并部署主网
- 提交 `My Coin` 和 `Faucet Coin` 合约发布 `package id`
- 发送 `My Coin`  给地址 `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`
- `Faucet Coin` 需要至少用两个地址mint

# 学习要点

1. 理解Coin协议 创建Coin
2. 理解独享所有权和共享所有权的区别
3. 对共享所有权保持敬畏 因为权限被共享了

public_transfer 独享 mint权限
public_share_object 共享 mint权限

## 任务指南

- `Faucet Coin` 就是任意人都可以mint的Coin
- `My Coin`  只能指定地址mint

--- 任务要求 end---

--- task begin---

# task 任务

### 创建项目

```shell
# 创建项目
sui move new hello_world
```

### 编写代码

- 完成 HuiWang_World_Coin.move 与 HuiWang_World_Faucet_Coin.move 两个文件的代码
- 发布到测试网

```shell
sui client publish 
```

- 执行结果

```shell
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                   │
│ Gas Owner: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                                    │
│  │ Version: 715915                                                                                           │
│  │ Digest: 9jb34xKQHpvjeQFRufgD2T7wsqw9yqkECH7sXw5Nn99Y                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7" │ │
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
│    c7SfuOtqiaKOJp6klvBNaL938e1BGNEYockrO0WRPMcTfjWxoX2NduBDJtv3lDNB1eWMQZrx8EHr9ZfZPI8+Dw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6r1VEpN5kjXnzXejJKgXueBbm9aXw4VN1VQBFKtSij6x                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 409                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0302099070afd1e69fb2711334a0f83f41f0fcb04d8cb328ca5266b610a4e200                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715916                                                                                │
│  │ Digest: 6hhfoZ9QZswrW7rcrDPvZ2VSdmEpNqbgdhiWaSGF8z6p                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x316fe348d1d1d15b069bf4fb7db836a35b4cff2a1d49d2b1a4b19bc6bf03acfc                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 715916                                                                                │
│  │ Digest: 4442xBSXU3Jwsh5efiwdpCYbp728xAPXA2yH2B92G9JR                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 2PtZaS9kQqopvbM5KFE4PBrZ3V99JX45qi4gGAKhANcL                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6c47430aaaa568c8781342bddb240cbe8b97674b2a76872e5d67f2525fcb0107                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715916                                                                                │
│  │ Digest: HER2yiBW2mi6gLK2cp9Gw67JJfX2u61DbF8gzP6ZYGwF                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8ee0efcfee02f6e5ceefbf6a263b1e9f0c9c5288924b4a36866e44cbff6810f3                         │
│  │ Owner: Shared( 715916 )                                                                        │
│  │ Version: 715916                                                                                │
│  │ Digest: HJ8FBFfyGCCFdMh91H7EVL32bmrt2uJFNEwDtuVPuf64                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xdc89f6439ff0e85de624d2ffebfe2db22844d8ece4ff3c84b63af158aacdc352                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 715916                                                                                │
│  │ Digest: CsSdFkVeiy2NKDsKdxDEysGVNDgYny84YyFijYovmc97                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715916                                                                                │
│  │ Digest: 2hET3Ff623tPvjJkRn4hhLTCvCmY5RxCQwv2Rk4Qbgas                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715916                                                                                │
│  │ Digest: 2hET3Ff623tPvjJkRn4hhLTCvCmY5RxCQwv2Rk4Qbgas                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 29290400 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3Hry5CyWQUTNV5nRZTNxoWyfN9zxBEcwsYkXUyTHCrmE                                                   │
│    6c3hAbXwoKqSv8Grf4wv7VAJYpT7UnPxV3zqeRjmN1JY                                                   │
│    G79jGopiLJRbrCLAf5K3cjEibACwgmRVysaNmbhLdwMt                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                    │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                  │
│  ┌──                                                                                                                                                              │
│  │ ObjectID: 0x0302099070afd1e69fb2711334a0f83f41f0fcb04d8cb328ca5266b610a4e200                                                                                   │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                                                                     │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                                                                  │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                                                           │
│  │ Version: 715916                                                                                                                                                │
│  │ Digest: 6hhfoZ9QZswrW7rcrDPvZ2VSdmEpNqbgdhiWaSGF8z6p                                                                                                           │
│  └──                                                                                                                                                              │
│  ┌──                                                                                                                                                              │
│  │ ObjectID: 0x316fe348d1d1d15b069bf4fb7db836a35b4cff2a1d49d2b1a4b19bc6bf03acfc                                                                                   │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                                                                     │
│  │ Owner: Immutable                                                                                                                                               │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721::HuiWang_World_Faucet_Coin::HUIWANG_WORLD_FAUCET_COIN>  │
│  │ Version: 715916                                                                                                                                                │
│  │ Digest: 4442xBSXU3Jwsh5efiwdpCYbp728xAPXA2yH2B92G9JR                                                                                                           │
│  └──                                                                                                                                                              │
│  ┌──                                                                                                                                                              │
│  │ ObjectID: 0x6c47430aaaa568c8781342bddb240cbe8b97674b2a76872e5d67f2525fcb0107                                                                                   │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                                                                     │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                                                                  │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721::HuiWang_World_Faucet_Coin::HUIWANG_WORLD_FAUCET_COIN>   │
│  │ Version: 715916                                                                                                                                                │
│  │ Digest: HER2yiBW2mi6gLK2cp9Gw67JJfX2u61DbF8gzP6ZYGwF                                                                                                           │
│  └──                                                                                                                                                              │
│  ┌──                                                                                                                                                              │
│  │ ObjectID: 0x8ee0efcfee02f6e5ceefbf6a263b1e9f0c9c5288924b4a36866e44cbff6810f3                                                                                   │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                                                                     │
│  │ Owner: Shared( 715916 )                                                                                                                                        │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721::HuiWang_World_Coin::HUIWANG_WORLD_COIN>                 │
│  │ Version: 715916                                                                                                                                                │
│  │ Digest: HJ8FBFfyGCCFdMh91H7EVL32bmrt2uJFNEwDtuVPuf64                                                                                                           │
│  └──                                                                                                                                                              │
│  ┌──                                                                                                                                                              │
│  │ ObjectID: 0xdc89f6439ff0e85de624d2ffebfe2db22844d8ece4ff3c84b63af158aacdc352                                                                                   │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                                                                     │
│  │ Owner: Immutable                                                                                                                                               │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721::HuiWang_World_Coin::HUIWANG_WORLD_COIN>                │
│  │ Version: 715916                                                                                                                                                │
│  │ Digest: CsSdFkVeiy2NKDsKdxDEysGVNDgYny84YyFijYovmc97                                                                                                           │
│  └──                                                                                                                                                              │
│ Mutated Objects:                                                                                                                                                  │
│  ┌──                                                                                                                                                              │
│  │ ObjectID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                                                                                   │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                                                                     │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                                                                  │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                     │
│  │ Version: 715916                                                                                                                                                │
│  │ Digest: 2hET3Ff623tPvjJkRn4hhLTCvCmY5RxCQwv2Rk4Qbgas                                                                                                           │
│  └──                                                                                                                                                              │
│ Published Objects:                                                                                                                                                │
│  ┌──                                                                                                                                                              │
│  │ PackageID: 0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721                                                                                  │
│  │ Version: 1                                                                                                                                                     │
│  │ Digest: 2PtZaS9kQqopvbM5KFE4PBrZ3V99JX45qi4gGAKhANcL                                                                                                           │
│  │ Modules: HuiWang_World_Coin, HuiWang_World_Faucet_Coin                                                                                                         │
│  └──                                                                                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -29312280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

- 修改 publish-at="" 和 hello_world 地址为 PackageID: 0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721
  │
  如:

```toml
publish-at = "0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721"
[addresses]
hello_world = "0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721"
```

- 使用水龙头产生gas

```shell
##### 水龙头（HUIWANG_WORLD_FAUCET_COIN）
# --package  0x2 \ 中的 0x2 为标准库地址
# --module coin \  中的 coin 为官方coin模块
# --function mint_and_transfer \ 中的 mint_and_transfer 为调用方法
#       --type-args 实际为注入泛型 数据来自 "ObjectType: 0x2::coin::TreasuryCap<0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721::HuiWang_World_Faucet_Coin::HUIWANG_WORLD_FAUCET_COIN>"
# --type-args '0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721::HuiWang_World_Faucet_Coin::HUIWANG_WORLD_FAUCET_COIN' \ 
# --args 0x6c47430aaaa568c8781342bddb240cbe8b97674b2a76872e5d67f2525fcb0107 100000000000 0xff71ff2dfa9f5ba0176fb40fdda9d13d738ec97143b46bdfa1addc09e2263b02  
#   args 参数解释 0x6c47430aaaa568c8781342bddb240cbe8b97674b2a76872e5d67f2525fcb0107 为 铸币权限 数据来自 "ObjectID: 0x6c47430aaaa568c8781342bddb240cbe8b97674b2a76872e5d67f2525fcb0107" , 带 TreasuryCap 的objID
#   args 参数解释 100000000000 为 为需要铸造多个币 可随便填，尽量多写点
#   args 参数解释 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 为 钱包地址 铸造的币下发到那个钱包，0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 为我本地测试环境的地址
# 钱包地址不知道的可以使用 `sui client addresses` 获取  
  
 sui client call  \
 --package  0x2 \
 --module coin \
 --function mint_and_transfer \
 --type-args '0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721::HuiWang_World_Faucet_Coin::HUIWANG_WORLD_FAUCET_COIN' \
 --args 0x6c47430aaaa568c8781342bddb240cbe8b97674b2a76872e5d67f2525fcb0107 100000000000 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7

```

- 执行上面shell脚本发现有警告提示不能执行，需要升级版本

```shell
[warn] Client/Server api version mismatch, client api version : 1.27.0, server api version : 1.27.2
```

install-doc 文档中有如何安装或升级，这里不再赘述

- 执行 shell 结果

```shell
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                  │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                                        │
│ Gas Owner: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                                     │
│ Gas Budget: 100000000 MIST                                                                                                        │
│ Gas Price: 1000 MIST                                                                                                              │
│ Gas Payment:                                                                                                                      │
│  ┌──                                                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                                                         │
│  │ Version: 715916                                                                                                                │
│  │ Digest: 2hET3Ff623tPvjJkRn4hhLTCvCmY5RxCQwv2Rk4Qbgas                                                                           │
│  └──                                                                                                                              │
│                                                                                                                                   │
│ Transaction Kind: Programmable                                                                                                    │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮                      │
│ │ Input Objects                                                                                            │                      │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤                      │
│ │ 0   Imm/Owned Object ID: 0x6c47430aaaa568c8781342bddb240cbe8b97674b2a76872e5d67f2525fcb0107              │                      │
│ │ 1   Pure Arg: Type: u64, Value: "100000000000"                                                           │                      │
│ │ 2   Pure Arg: Type: address, Value: "0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7" │                      │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯                      │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                                                      │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                                                  │ │
│ │  ┌                                                                                                                            │ │
│ │  │ Function:  mint_and_transfer                                                                                               │ │
│ │  │ Module:    coin                                                                                                            │ │
│ │  │ Package:   0x0000000000000000000000000000000000000000000000000000000000000002                                              │ │
│ │  │ Type Arguments:                                                                                                            │ │
│ │  │   0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721::HuiWang_World_Faucet_Coin::HUIWANG_WORLD_FAUCET_COIN │ │
│ │  │ Arguments:                                                                                                                 │ │
│ │  │   Input  0                                                                                                                 │ │
│ │  │   Input  1                                                                                                                 │ │
│ │  │   Input  2                                                                                                                 │ │
│ │  └                                                                                                                            │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                                                   │
│ Signatures:                                                                                                                       │
│    DXY8x448UY6iL3ItT9i5fwo4lRHammxo780aG2pFIP/mk9SLiOekmVAUjktaBjBvRmeOvEQuN0PuvXu7jN8HCw==                                       │
│                                                                                                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: gXkQVadtcT9VT3wWMkJd1L1gzZnAyhzvbCDDeuq4Vtm                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 409                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x37a87856b9a4b276470719a0497cfb5d0532d75a04a13502393152cc8bf424c3                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715917                                                                                │
│  │ Digest: 4tt42dWdKTjtaB9cLocGy9bp2dgoHoSSm6er4UrcHmwB                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715917                                                                                │
│  │ Digest: 6W61gcmiCCQcbbesSQEHP1uRny4ao474affSUccbaesR                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6c47430aaaa568c8781342bddb240cbe8b97674b2a76872e5d67f2525fcb0107                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715917                                                                                │
│  │ Digest: ANGUMnjz4x9U9AGKaSdoUafhqdtQ9rjqpx8vA2Fxa5Nx                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715917                                                                                │
│  │ Digest: 6W61gcmiCCQcbbesSQEHP1uRny4ao474affSUccbaesR                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4651200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2979504 MIST                                                                   │
│    Non-refundable Storage Fee: 30096 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3Hry5CyWQUTNV5nRZTNxoWyfN9zxBEcwsYkXUyTHCrmE                                                   │
│    6r1VEpN5kjXnzXejJKgXueBbm9aXw4VN1VQBFKtSij6x                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                 │
│  ┌──                                                                                                                                                             │
│  │ ObjectID: 0x37a87856b9a4b276470719a0497cfb5d0532d75a04a13502393152cc8bf424c3                                                                                  │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                                                                    │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                                                                 │
│  │ ObjectType: 0x2::coin::Coin<0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721::HuiWang_World_Faucet_Coin::HUIWANG_WORLD_FAUCET_COIN>         │
│  │ Version: 715917                                                                                                                                               │
│  │ Digest: 4tt42dWdKTjtaB9cLocGy9bp2dgoHoSSm6er4UrcHmwB                                                                                                          │
│  └──                                                                                                                                                             │
│ Mutated Objects:                                                                                                                                                 │
│  ┌──                                                                                                                                                             │
│  │ ObjectID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                                                                                  │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                                                                    │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                                                                 │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                    │
│  │ Version: 715917                                                                                                                                               │
│  │ Digest: 6W61gcmiCCQcbbesSQEHP1uRny4ao474affSUccbaesR                                                                                                          │
│  └──                                                                                                                                                             │
│  ┌──                                                                                                                                                             │
│  │ ObjectID: 0x6c47430aaaa568c8781342bddb240cbe8b97674b2a76872e5d67f2525fcb0107                                                                                  │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                                                                    │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                                                                 │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721::HuiWang_World_Faucet_Coin::HUIWANG_WORLD_FAUCET_COIN>  │
│  │ Version: 715917                                                                                                                                               │
│  │ Digest: ANGUMnjz4x9U9AGKaSdoUafhqdtQ9rjqpx8vA2Fxa5Nx                                                                                                          │
│  └──                                                                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                                        │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                                   │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                                       │
│  │ CoinType: 0x2::sui::SUI                                                                                                             │
│  │ Amount: -2671696                                                                                                                    │
│  └──                                                                                                                                   │
│  ┌──                                                                                                                                   │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                                       │
│  │ CoinType: 0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721::HuiWang_World_Faucet_Coin::HUIWANG_WORLD_FAUCET_COIN  │
│  │ Amount: 100000000000                                                                                                                │
│  └──                                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

```shell
##### 铸造 COIN（HUIWANG_WORLD_COIN）
 #--args 0x8ee0efcfee02f6e5ceefbf6a263b1e9f0c9c5288924b4a36866e44cbff6810f3 100000000000 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7
 # 铸币权限TreasuryCap的objID/铸币数量/铸出来的币下发到那个钱包
 # --package packageID
 # --module 包名
 # --function 方法名称
 sui client call  \
 --package  0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721 \
 --module HuiWang_World_Coin \
 --function mint \
 --args 0x8ee0efcfee02f6e5ceefbf6a263b1e9f0c9c5288924b4a36866e44cbff6810f3 100000000000 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7

```

- 执行 shell 结果

```shell
Transaction Digest: GZNZBDuSoWrS7sEix79iaam9hDMoNjq8idfZEdkF79wr
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                   │
│ Gas Owner: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                                    │
│  │ Version: 715920                                                                                           │
│  │ Digest: AoJVxkf8uNrVkYCRRap8P5yvpg2GwVLW33V9228423T2                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x8ee0efcfee02f6e5ceefbf6a263b1e9f0c9c5288924b4a36866e44cbff6810f3              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100000000000"                                                           │ │
│ │ 2   Pure Arg: Type: address, Value: "0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    HuiWang_World_Coin                                                 │                         │
│ │  │ Package:   0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    hCPsEO2og6uLktU8Ox9yEwMQRtTwnbj0KmQk02mZSJfmECWwQR1z65ACvDhSCd5bc7ID3iMildkE83nBRHiiAw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GZNZBDuSoWrS7sEix79iaam9hDMoNjq8idfZEdkF79wr                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 410                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x46362edb4ddbe05f0e834cb74cfe6c0ad8be087adfa5a5e562fc42ad73899307                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715921                                                                                │
│  │ Digest: 5LyYnFWjEtXrw3pQTXepBV5yPP2efk4Shuz6NyWQKsQi                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715921                                                                                │
│  │ Digest: dWfoK4NsbnHFfZcMMqdXr7CxFv8kfqEM1VEQRe8yp1v                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8ee0efcfee02f6e5ceefbf6a263b1e9f0c9c5288924b4a36866e44cbff6810f3                         │
│  │ Owner: Shared( 715916 )                                                                        │
│  │ Version: 715921                                                                                │
│  │ Digest: Cr1JoJbskipQ7uU7BqtyvTQ84A8zkvWoHf8xC3MYy1Nb                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x8ee0efcfee02f6e5ceefbf6a263b1e9f0c9c5288924b4a36866e44cbff6810f3                         │
│  │ Version: 715916                                                                                │
│  │ Digest: HJ8FBFfyGCCFdMh91H7EVL32bmrt2uJFNEwDtuVPuf64                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                         │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )  │
│  │ Version: 715921                                                                                │
│  │ Digest: dWfoK4NsbnHFfZcMMqdXr7CxFv8kfqEM1VEQRe8yp1v                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4438400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2874168 MIST                                                                   │
│    Non-refundable Storage Fee: 29032 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6r1VEpN5kjXnzXejJKgXueBbm9aXw4VN1VQBFKtSij6x                                                   │
│    Fs2zTdVLhbYhvymGHrZAQgBTrwVPYeLNDaFR21gr9zBF                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                     │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                   │
│  ┌──                                                                                                                                               │
│  │ ObjectID: 0x46362edb4ddbe05f0e834cb74cfe6c0ad8be087adfa5a5e562fc42ad73899307                                                                    │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                                                      │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                                                   │
│  │ ObjectType: 0x2::coin::Coin<0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721::HuiWang_World_Coin::HUIWANG_WORLD_COIN>         │
│  │ Version: 715921                                                                                                                                 │
│  │ Digest: 5LyYnFWjEtXrw3pQTXepBV5yPP2efk4Shuz6NyWQKsQi                                                                                            │
│  └──                                                                                                                                               │
│ Mutated Objects:                                                                                                                                   │
│  ┌──                                                                                                                                               │
│  │ ObjectID: 0x0e84bff608599d8f3d7cc11b0358bf3e142422b096189f3a2119307e6ca416d9                                                                    │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                                                      │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                                                   │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                      │
│  │ Version: 715921                                                                                                                                 │
│  │ Digest: dWfoK4NsbnHFfZcMMqdXr7CxFv8kfqEM1VEQRe8yp1v                                                                                             │
│  └──                                                                                                                                               │
│  ┌──                                                                                                                                               │
│  │ ObjectID: 0x8ee0efcfee02f6e5ceefbf6a263b1e9f0c9c5288924b4a36866e44cbff6810f3                                                                    │
│  │ Sender: 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7                                                                      │
│  │ Owner: Shared( 715916 )                                                                                                                         │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721::HuiWang_World_Coin::HUIWANG_WORLD_COIN>  │
│  │ Version: 715921                                                                                                                                 │
│  │ Digest: Cr1JoJbskipQ7uU7BqtyvTQ84A8zkvWoHf8xC3MYy1Nb                                                                                            │
│  └──                                                                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                     │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                         │
│  │ CoinType: 0x2::sui::SUI                                                                                               │
│  │ Amount: -2564232                                                                                                      │
│  └──                                                                                                                     │
│  ┌──                                                                                                                     │
│  │ Owner: Account Address ( 0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7 )                         │
│  │ CoinType: 0x39fe998f1a01ea7df4e297e98aff13be5e3ec100d350cbb7f42077bc05e3a721::HuiWang_World_Coin::HUIWANG_WORLD_COIN  │
│  │ Amount: 100000000000                                                                                                  │
│  └──                                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

- 查看铸币结果 https://testnet.suivision.xyz/account/0x23cd103501684d8da2ea03fcdc6af33f35d6d99736a174059e77fa4028e53dd7

--- task end---

# 其他笔记

### 关键字 语法

```sui move
module hello_word::hello_word {
    //mut 关键字,加了mut表示后续可能会对其作出改变
    //如：
    fun a() {
        let mut testNumber: u8 = 1;
        testNumber = 2;
    }

    // has 关键字 用法
    // copy - 被修饰的值可以被复制。
    // drop - 被修饰的值在作用域结束时可以被丢弃。
    // key - 被修饰的值可以作为键值对全局状态进行访问。
    // store - 被修饰的值可以被存储到其他结构体
    public struct Dog has copy, key, store, drop, {}

    // 程序终止
    // abort 0

    // 异常 不满足条件则报错
    // assert!(num > 10, ErrMustGet10);
}
```

### 方法签名

| 方法签名                         | 使用范围             | 返回值 |
|------------------------------|------------------|-----|
| `fun call()`                 | 只能模块内部调用         | 可以有 |
| `public fun call()`          | 全部合约能调用          | 可以有 |
| `public entry fun call()`    | 全部合约Dapp(RPC)能调用 | 无   |
| `entry fun call()`           | 只能Dapp(RPC)调用    | 无   |
| `public(package) fun call()` | 只能指定模块能调用        | 可以有 |

### init 方法定义 与 witness 泛型

```sui move
module hello_world::HuiWang_World_Coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Url, Self};

    /// 定义结构体
    public struct HUIWANG_WORLD_COIN has drop {}

    // init 方法定义只有两种形式 初始化方法 合约在部署的的时候会进行初始化
    // 第一种
    // fun init(ctx: &mut TxContext){}
    // 第二种
    fun init(witness: HUIWANG_WORLD_COIN, ctx: &mut TxContext) {}


    // phantom 表示结构体内可以不强制使用泛型
    public struct Coin<phantom T> has key, store {
        id: UID,
        balance: Balance<T>
    }
}
```

### 方法权限

```text
fun f(consume:T,write:&mut T,read:&T)
T : transfer,delete,write,read
&mut T:write,read
& T: read
```

### 所有权方法

| 方法                     | 生成的方法   | 属性        | 解释                                                                         |
|------------------------|---------|-----------|----------------------------------------------------------------------------|
| `transfer`             | 独享对象    | key       | 把对象所有权到某个地址                                                                |
| `public_transfer`      | 独享对象    | key+store | 把对象所有权到某个地址,带store表示可以存储到其他结构体                                             |
| `freeze_object`        | 共享对象-常量 | key       | 将给定对象转换为可变共享对象(常量)只能读取不能修改                                                 |
| `public_freeze_object` | 共享对象-常量 | key+store | 将给定对象转换为可变共享对象(常量)只能读取不能修改,每个人都可以访问和改变该对象,带store表示可以存储到其他结构体               |
| `share_object`         | 共享对象    | key       | 将给定对象转换为可变共享对象,每个人都可以访问和改变该对象,共享对象没有所有者,因为共享对象每个人可以可以读写                    |
| `public_share_object`  | 共享对象    | key+store | 将给定对象转换为可变共享对象,每个人都可以访问和改变该对象,共享对象没有所有者,因为共享对象每个人可以可以读写,带store表示可以存储到其他结构体 |
