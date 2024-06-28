--- 任务要求 begin---

# 完成NFT的上链部署

- 上链网络: 主网(mainnet)

## 需求

- 完成 NFT相关知识的学习
- 完成可以mint NFT的合约上链
- 给自己地址mint一个NFT
- NFT必须是自己 github 的头像作为图片
- mint 一个 nft 发送到地址: `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`
- 提交mint到自己地址的浏览器查看(Scan)截图

## 任务指南

--- 任务要求 end---

--- task begin---

- 编写合约代码 HUIWANG_WORLD_NFT.move
- 发布合约

```shell
sui client publish 
```

- 执行结果

```shell
Transaction Digest: F59xnVn61s9SJdbupqBmSyjhpuhgTPwYFJWhwu1nozKX
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│ Gas Owner: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 752 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                                    │
│  │ Version: 103342236                                                                                        │
│  │ Digest: DZomESnvHDyYzDKrPAjPCVAYhSKDyZWnkT61BJ2Jm7v3                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896" │ │
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
│    NueHbP7H5w8oyuEaBFxA6aTS1gWfcZ5tL/UOv2kE4kbvlMa5G0HvciPQ2T/sAo2/Jc36ppXLG4zy0vrzPVDjBg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: F59xnVn61s9SJdbupqBmSyjhpuhgTPwYFJWhwu1nozKX                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 439                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0c09dd9c8e250ddda64af01fc7840ce0959c9d12b26c563d87daef181f74682a                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342237                                                                             │
│  │ Digest: 4BpWPU1wGJ42tLch3Bz8KJLKCXry52M9u7HkvsEQbxip                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x86d6ce549ab6c547a37f55b04d255b192924d410c425fe2c65be13e72cec9409                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342237                                                                             │
│  │ Digest: 9z9AEC8ZejsWaMMT7Q7cH4M6Q3MoTi1XuC4SEDcsgNjr                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb20685c739bfe12eff994044e34d7eab91cc04e2d84f8455e03f4d748591bfee                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 6oco8gtx7bYyHzjAfycCxmJw9o1hDh4c8oSp3bBqZX1P                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342237                                                                             │
│  │ Digest: C97Zux7MCQS2A4aNJx9BtWuwi33ntUWanUb6bDTf8kDY                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342237                                                                             │
│  │ Digest: C97Zux7MCQS2A4aNJx9BtWuwi33ntUWanUb6bDTf8kDY                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 11164400 MIST                                                                    │
│    Computation Cost: 752000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    EXNu2hebvcsuTpnh5Higoi4BBiWy6BZ1hKJ4jKYiH2rD                                                   │
│    EY8ZaDkjhyBXX8iu9HXPQWznBp4QUcpAaTuwXSheDVuq                                                   │
│    FZQQfVC428RKpDcuobUQVp45DMM4PwiELT4YH4ivaHZA                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                  │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x0c09dd9c8e250ddda64af01fc7840ce0959c9d12b26c563d87daef181f74682a                                 │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                │
│  │ ObjectType: 0xb20685c739bfe12eff994044e34d7eab91cc04e2d84f8455e03f4d748591bfee::HUIWANG_WORLD_NFT::AdminCap  │
│  │ Version: 103342237                                                                                           │
│  │ Digest: 4BpWPU1wGJ42tLch3Bz8KJLKCXry52M9u7HkvsEQbxip                                                         │
│  └──                                                                                                            │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x86d6ce549ab6c547a37f55b04d255b192924d410c425fe2c65be13e72cec9409                                 │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                         │
│  │ Version: 103342237                                                                                           │
│  │ Digest: 9z9AEC8ZejsWaMMT7Q7cH4M6Q3MoTi1XuC4SEDcsgNjr                                                         │
│  └──                                                                                                            │
│ Mutated Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                                 │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                   │
│  │ Version: 103342237                                                                                           │
│  │ Digest: C97Zux7MCQS2A4aNJx9BtWuwi33ntUWanUb6bDTf8kDY                                                         │
│  └──                                                                                                            │
│ Published Objects:                                                                                              │
│  ┌──                                                                                                            │
│  │ PackageID: 0xb20685c739bfe12eff994044e34d7eab91cc04e2d84f8455e03f4d748591bfee                                │
│  │ Version: 1                                                                                                   │
│  │ Digest: 6oco8gtx7bYyHzjAfycCxmJw9o1hDh4c8oSp3bBqZX1P                                                         │
│  │ Modules: HUIWANG_WORLD_NFT                                                                                   │
│  └──                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -10938280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

- 调用合约

```shell
 sui client call  \
 --package  0xb20685c739bfe12eff994044e34d7eab91cc04e2d84f8455e03f4d748591bfee \
 --module HUIWANG_WORLD_NFT \
 --function mint \
 --args 0x0c09dd9c8e250ddda64af01fc7840ce0959c9d12b26c563d87daef181f74682a "HuiWang-World" "HuiWang-World-NFT" "https://avatars.githubusercontent.com/HuiWang-World"

```

- 执行结果

```shell
Transaction Digest: HcomP6P9Y6bLnc3FBMGc4XifEHm9eZZrYaUdwS9LaQmX
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                       │
│ Gas Owner: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                    │
│ Gas Budget: 100000000 MIST                                                                       │
│ Gas Price: 752 MIST                                                                              │
│ Gas Payment:                                                                                     │
│  ┌──                                                                                             │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                        │
│  │ Version: 103342237                                                                            │
│  │ Digest: C97Zux7MCQS2A4aNJx9BtWuwi33ntUWanUb6bDTf8kDY                                          │
│  └──                                                                                             │
│                                                                                                  │
│ Transaction Kind: Programmable                                                                   │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x0c09dd9c8e250ddda64af01fc7840ce0959c9d12b26c563d87daef181f74682a  │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "HuiWang-World"                                       │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "HuiWang-World-NFT"                                   │ │
│ │ 3   Pure Arg: Type: vector<u8>, Value: "https://avatars.githubusercontent.com/HuiWang-World" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮             │
│ │ Commands                                                                         │             │
│ ├──────────────────────────────────────────────────────────────────────────────────┤             │
│ │ 0  MoveCall:                                                                     │             │
│ │  ┌                                                                               │             │
│ │  │ Function:  mint                                                               │             │
│ │  │ Module:    HUIWANG_WORLD_NFT                                                  │             │
│ │  │ Package:   0xb20685c739bfe12eff994044e34d7eab91cc04e2d84f8455e03f4d748591bfee │             │
│ │  │ Arguments:                                                                    │             │
│ │  │   Input  0                                                                    │             │
│ │  │   Input  1                                                                    │             │
│ │  │   Input  2                                                                    │             │
│ │  │   Input  3                                                                    │             │
│ │  └                                                                               │             │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯             │
│                                                                                                  │
│ Signatures:                                                                                      │
│    gJZSyBLbbFTHpafidyQpzGeirH7iUrBJdcSE9lR/1aCEbtW1efICgxFntnDa5oPzxShIP5OCUSmuFYAT1DyiDg==      │
│                                                                                                  │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HcomP6P9Y6bLnc3FBMGc4XifEHm9eZZrYaUdwS9LaQmX                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 439                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x64a2965dd101bc739b315cf09283ff2bca7255fce0f68311088c4a61e51fe42f                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342238                                                                             │
│  │ Digest: GHLw1BXeTVE1W1qme4NCcgEtNhsAaH1LqCf7jXdQEe4q                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0c09dd9c8e250ddda64af01fc7840ce0959c9d12b26c563d87daef181f74682a                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342238                                                                             │
│  │ Digest: UZ9EkgMV6wdnHvVNsuuK1ZX8YpNXyV1x7t1g7V1j9bi                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342238                                                                             │
│  │ Digest: 8vxKvhzmBN6XKLgXX3x2A3ztJAQ7wfHMwSoLsTmWXhBj                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342238                                                                             │
│  │ Digest: 8vxKvhzmBN6XKLgXX3x2A3ztJAQ7wfHMwSoLsTmWXhBj                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4354800 MIST                                                                     │
│    Computation Cost: 752000 MIST                                                                  │
│    Storage Rebate: 2347488 MIST                                                                   │
│    Non-refundable Storage Fee: 23712 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    F59xnVn61s9SJdbupqBmSyjhpuhgTPwYFJWhwu1nozKX                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                  │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x64a2965dd101bc739b315cf09283ff2bca7255fce0f68311088c4a61e51fe42f                                 │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                │
│  │ ObjectType: 0xb20685c739bfe12eff994044e34d7eab91cc04e2d84f8455e03f4d748591bfee::HUIWANG_WORLD_NFT::NFT       │
│  │ Version: 103342238                                                                                           │
│  │ Digest: GHLw1BXeTVE1W1qme4NCcgEtNhsAaH1LqCf7jXdQEe4q                                                         │
│  └──                                                                                                            │
│ Mutated Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x0c09dd9c8e250ddda64af01fc7840ce0959c9d12b26c563d87daef181f74682a                                 │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                │
│  │ ObjectType: 0xb20685c739bfe12eff994044e34d7eab91cc04e2d84f8455e03f4d748591bfee::HUIWANG_WORLD_NFT::AdminCap  │
│  │ Version: 103342238                                                                                           │
│  │ Digest: UZ9EkgMV6wdnHvVNsuuK1ZX8YpNXyV1x7t1g7V1j9bi                                                          │
│  └──                                                                                                            │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                                 │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                   │
│  │ Version: 103342238                                                                                           │
│  │ Digest: 8vxKvhzmBN6XKLgXX3x2A3ztJAQ7wfHMwSoLsTmWXhBj                                                         │
│  └──                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2759312                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

- 调用合约 生成转发给任务地址的nft

```shell
 sui client call  \
 --package  0xb20685c739bfe12eff994044e34d7eab91cc04e2d84f8455e03f4d748591bfee \
 --module HUIWANG_WORLD_NFT \
 --function mint \
 --args 0x0c09dd9c8e250ddda64af01fc7840ce0959c9d12b26c563d87daef181f74682a "HuiWang-World" "HuiWang-World-NFT" "https://avatars.githubusercontent.com/HuiWang-World"
```

- 执行结果

```shell
Transaction Digest: wo5Cthdc7VkK12zoJMv3bpxwyCdpNas66QsKAmNDGxL
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                       │
│ Gas Owner: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                    │
│ Gas Budget: 100000000 MIST                                                                       │
│ Gas Price: 752 MIST                                                                              │
│ Gas Payment:                                                                                     │
│  ┌──                                                                                             │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                        │
│  │ Version: 103342238                                                                            │
│  │ Digest: 8vxKvhzmBN6XKLgXX3x2A3ztJAQ7wfHMwSoLsTmWXhBj                                          │
│  └──                                                                                             │
│                                                                                                  │
│ Transaction Kind: Programmable                                                                   │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x0c09dd9c8e250ddda64af01fc7840ce0959c9d12b26c563d87daef181f74682a  │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "HuiWang-World"                                       │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "HuiWang-World-NFT"                                   │ │
│ │ 3   Pure Arg: Type: vector<u8>, Value: "https://avatars.githubusercontent.com/HuiWang-World" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮             │
│ │ Commands                                                                         │             │
│ ├──────────────────────────────────────────────────────────────────────────────────┤             │
│ │ 0  MoveCall:                                                                     │             │
│ │  ┌                                                                               │             │
│ │  │ Function:  mint                                                               │             │
│ │  │ Module:    HUIWANG_WORLD_NFT                                                  │             │
│ │  │ Package:   0xb20685c739bfe12eff994044e34d7eab91cc04e2d84f8455e03f4d748591bfee │             │
│ │  │ Arguments:                                                                    │             │
│ │  │   Input  0                                                                    │             │
│ │  │   Input  1                                                                    │             │
│ │  │   Input  2                                                                    │             │
│ │  │   Input  3                                                                    │             │
│ │  └                                                                               │             │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯             │
│                                                                                                  │
│ Signatures:                                                                                      │
│    MyYl4IheaY3v/OsDKjdpuIh9QuKhNdZ9Na1II6JZ5D0rGLFxmnfNf/10Uz0PucDmvbEzY8B3tgI4xA4k2ihYCQ==      │
│                                                                                                  │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: wo5Cthdc7VkK12zoJMv3bpxwyCdpNas66QsKAmNDGxL                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 439                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x9855e6838b1dabc734e1b4991dab188bd2ecfe29ba912e2256768d4a4af6a3df                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342239                                                                             │
│  │ Digest: 32SVNhPmKPbsiVNnZd9pHJKZDwUjp47nuAWg7HiKPjcc                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0c09dd9c8e250ddda64af01fc7840ce0959c9d12b26c563d87daef181f74682a                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342239                                                                             │
│  │ Digest: 4mnmGvZRyQ3qgw5B9d5quXCBfMDjL9PtVabzngAJW15C                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342239                                                                             │
│  │ Digest: 3ySGt8zpqApCMD6dXSd8a8KXNTNUfDUkAXS8tD1xcxRm                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342239                                                                             │
│  │ Digest: 3ySGt8zpqApCMD6dXSd8a8KXNTNUfDUkAXS8tD1xcxRm                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4354800 MIST                                                                     │
│    Computation Cost: 752000 MIST                                                                  │
│    Storage Rebate: 2347488 MIST                                                                   │
│    Non-refundable Storage Fee: 23712 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    F59xnVn61s9SJdbupqBmSyjhpuhgTPwYFJWhwu1nozKX                                                   │
│    HcomP6P9Y6bLnc3FBMGc4XifEHm9eZZrYaUdwS9LaQmX                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                  │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x9855e6838b1dabc734e1b4991dab188bd2ecfe29ba912e2256768d4a4af6a3df                                 │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                │
│  │ ObjectType: 0xb20685c739bfe12eff994044e34d7eab91cc04e2d84f8455e03f4d748591bfee::HUIWANG_WORLD_NFT::NFT       │
│  │ Version: 103342239                                                                                           │
│  │ Digest: 32SVNhPmKPbsiVNnZd9pHJKZDwUjp47nuAWg7HiKPjcc                                                         │
│  └──                                                                                                            │
│ Mutated Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x0c09dd9c8e250ddda64af01fc7840ce0959c9d12b26c563d87daef181f74682a                                 │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                │
│  │ ObjectType: 0xb20685c739bfe12eff994044e34d7eab91cc04e2d84f8455e03f4d748591bfee::HUIWANG_WORLD_NFT::AdminCap  │
│  │ Version: 103342239                                                                                           │
│  │ Digest: 4mnmGvZRyQ3qgw5B9d5quXCBfMDjL9PtVabzngAJW15C                                                         │
│  └──                                                                                                            │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                                 │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )                │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                   │
│  │ Version: 103342239                                                                                           │
│  │ Digest: 3ySGt8zpqApCMD6dXSd8a8KXNTNUfDUkAXS8tD1xcxRm                                                         │
│  └──                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2759312                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

- 给任务地址发送 nft

```shell
sui client transfer --gas-budget 10000000 \
  --object-id 0x9855e6838b1dabc734e1b4991dab188bd2ecfe29ba912e2256768d4a4af6a3df \
  --to 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 
```

- 执行结果

```shell
Transaction Digest: DgJZRmmrfLg8rtvJEkRwZvZ6UMsSsYqDjjC96rPwTWwd
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                   │
│ Gas Owner: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 752 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                                    │
│  │ Version: 103342239                                                                                        │
│  │ Digest: 3ySGt8zpqApCMD6dXSd8a8KXNTNUfDUkAXS8tD1xcxRm                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ │ 1   Imm/Owned Object ID: 0x9855e6838b1dabc734e1b4991dab188bd2ecfe29ba912e2256768d4a4af6a3df              │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────╮                                                                                     │
│ │ Commands             │                                                                                     │
│ ├──────────────────────┤                                                                                     │
│ │ 0  TransferObjects:  │                                                                                     │
│ │  ┌                   │                                                                                     │
│ │  │ Arguments:        │                                                                                     │
│ │  │   Input  1        │                                                                                     │
│ │  │ Address: Input  0 │                                                                                     │
│ │  └                   │                                                                                     │
│ ╰──────────────────────╯                                                                                     │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    oDD9tGN0pEh7PNWSsvV5kQEUgqGbYwvaQn9jEU3i9TtxBuj8kIezOC2DNDgOOcjbc7pVJenS4fHMoTytE/qWAw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DgJZRmmrfLg8rtvJEkRwZvZ6UMsSsYqDjjC96rPwTWwd                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 439                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342240                                                                             │
│  │ Digest: HYEQFi9meKWpLGZGrgVFkSe3JreCb5neeGXhUjJNEUiJ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9855e6838b1dabc734e1b4991dab188bd2ecfe29ba912e2256768d4a4af6a3df                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 103342240                                                                             │
│  │ Digest: CUmS7TGwaxjg2R8gni8jumzty9nj6ghZPwPLDzVuyTo1                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                         │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ Version: 103342240                                                                             │
│  │ Digest: HYEQFi9meKWpLGZGrgVFkSe3JreCb5neeGXhUjJNEUiJ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2971600 MIST                                                                     │
│    Computation Cost: 752000 MIST                                                                  │
│    Storage Rebate: 2941884 MIST                                                                   │
│    Non-refundable Storage Fee: 29716 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    wo5Cthdc7VkK12zoJMv3bpxwyCdpNas66QsKAmNDGxL                                                    │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                           │
│  ┌──                                                                                                       │
│  │ ObjectID: 0x760171358680330db49355a2d9b0a49d5df50b51a2c850b9d2eb0b51d9364af2                            │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                              │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                              │
│  │ Version: 103342240                                                                                      │
│  │ Digest: HYEQFi9meKWpLGZGrgVFkSe3JreCb5neeGXhUjJNEUiJ                                                    │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ ObjectID: 0x9855e6838b1dabc734e1b4991dab188bd2ecfe29ba912e2256768d4a4af6a3df                            │
│  │ Sender: 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896                              │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )           │
│  │ ObjectType: 0xb20685c739bfe12eff994044e34d7eab91cc04e2d84f8455e03f4d748591bfee::HUIWANG_WORLD_NFT::NFT  │
│  │ Version: 103342240                                                                                      │
│  │ Digest: CUmS7TGwaxjg2R8gni8jumzty9nj6ghZPwPLDzVuyTo1                                                    │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0b5b33ff213280beec362c3edf7caf472db920bf40a7d731fad8013748b1a896 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -781716                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

--- task end---