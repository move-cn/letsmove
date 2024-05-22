# Task 1 - sui nft

## 创建并项目
### 新建项目
```bash
sui move new mynft
```

### 构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```

得到结果：
```bash
[warn] Client/Server api version mismatch, client api version : 1.20.0, server api version : 1.21.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mynft
Total number of linter warnings suppressed: 1 (filtered categories: 1)
Successfully verified dependencies on-chain against source.
Transaction Digest: AtwENjnntwj4qfDZTcc7BSGc5p8CBbbrLifDyB2Dvu7N
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                                   │
│ Gas Owner: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xb214a9d90c451572d295c64f3415d319bd003ec4173ce341c615d291e96d86c9                                    │
│  │ Version: 663196                                                                                           │
│  │ Digest: 4qn7dThNbZSDtPjv7JCtJdt7gfu1JmaR48tMHo8m5hkD                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897" │ │
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
│    sikmMXt97sIoWKkjvshf/scCkexlgH3fVMlglAq+Fgt/HOaWoXyPYNYbhK+jApCANyyfl+G9qVfZV5pWyIm6wQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: AtwENjnntwj4qfDZTcc7BSGc5p8CBbbrLifDyB2Dvu7N                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 320                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x99f5ca55304382c18102ee89f9cc626f4c3160ac72e63211dc3d5e2eb279c450                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: FeBYcjaSQ9DQ5X9aP1QMHYUz1QF4EPQBaozjsusMu5iu                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9daef4674e70cdb232e9bea0fc185a5649c1ea6b231a07202dac930b6e42194f                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ Version: 663197                                                                                │
│  │ Digest: 48uQJmFd5AWy9yedBWHfjDGPYUhtF7oph7WnLX8qHxgE                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb214a9d90c451572d295c64f3415d319bd003ec4173ce341c615d291e96d86c9                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ Version: 663197                                                                                │
│  │ Digest: JC4LVX1TFGLysDcTfSYqJC97wK3xXCE2EfuEpXig58C6                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb214a9d90c451572d295c64f3415d319bd003ec4173ce341c615d291e96d86c9                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ Version: 663197                                                                                │
│  │ Digest: JC4LVX1TFGLysDcTfSYqJC97wK3xXCE2EfuEpXig58C6                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 11096000 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    2fyxKisErW41UThuDSX46oC6Vhs4ta3ibxgHTtAaQMAG                                                   │
│    GZcMfNx5jvGHsfSKEHJD7jZss7yCHqEGfhVk8Jx8a2N1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x9daef4674e70cdb232e9bea0fc185a5649c1ea6b231a07202dac930b6e42194f                  │
│  │ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                    │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 663197                                                                               │
│  │ Digest: 48uQJmFd5AWy9yedBWHfjDGPYUhtF7oph7WnLX8qHxgE                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xb214a9d90c451572d295c64f3415d319bd003ec4173ce341c615d291e96d86c9                  │
│  │ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                    │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 663197                                                                               │
│  │ Digest: JC4LVX1TFGLysDcTfSYqJC97wK3xXCE2EfuEpXig58C6                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x99f5ca55304382c18102ee89f9cc626f4c3160ac72e63211dc3d5e2eb279c450                 │
│  │ Version: 1                                                                                    │
│  │ Digest: FeBYcjaSQ9DQ5X9aP1QMHYUz1QF4EPQBaozjsusMu5iu                                          │
│  │ Modules: devnet_nft                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -11117880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
关键信息：
packageid: 0x99f5ca55304382c18102ee89f9cc626f4c3160ac72e63211dc3d5e2eb279c450

## mint&transfer
### mint
```bash
#铸造
sui client call --function mint_to_sender --module devnet_nft --package 0x99f5ca55304382c18102ee89f9cc626f4c3160ac72e63211dc3d5e2eb279c450 --args tencent qq https://www.qq.com --gas-budget 50000000

#查看object信息
sui client object 0xa58ecbce9f780ec3b4a4b1eed38dde8ec3dac7781c5f0e9d92a20c562230c1b3

# 调用有问题，看起来是返回值的问题，没搜到解决方案，回头再试试
# sui client call --function name --module devnet_nft --package 0x99f5ca55304382c18102ee89f9cc626f4c3160ac72e63211dc3d5e2eb279c450 --args 0xa58ecbce9f780ec3b4a4b1eed38dde8ec3dac7781c5f0e9d92a20c562230c1b3 --gas-budget 50000000 --type-args 0x1::string::String

sui client call --function mint_to_sender --module devnet_nft --package 0x99f5ca55304382c18102ee89f9cc626f4c3160ac72e63211dc3d5e2eb279c450 --args tencent-news news https://news.qq.com --gas-budget 50000000

#0x0fc1b85a348439c15be9278e662d3ac5dd32d93ac66a36d4e5a24b5ef753104b
```


### 把tencent-news转给老板
```bash
sui client call --function transfer --module devnet_nft --package 0x99f5ca55304382c18102ee89f9cc626f4c3160ac72e63211dc3d5e2eb279c450 --args 0x0fc1b85a348439c15be9278e662d3ac5dd32d93ac66a36d4e5a24b5ef753104b 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

# 查看owner已经归属老板了
sui client object 0x0fc1b85a348439c15be9278e662d3ac5dd32d93ac66a36d4e5a24b5ef753104b
```