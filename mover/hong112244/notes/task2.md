# Task 1 - sui coin

## 创建并项目
### 新建项目
```bash
sui move new mycoin
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
BUILDING mycoin
Successfully verified dependencies on-chain against source.
Transaction Digest: EnyaU5eDVyYvskJK2G7wYCwPfiSns1FHrn1WvSB1SFv5
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
│  │ Version: 663190                                                                                           │
│  │ Digest: FJJ3eUAa1JnWGzNufVfBquiqDkKvLtsagMRuJsLaCpbo                                                      │
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
│    G1FvvmuhJlx9T3dkK0V1JyG9GTUdF3hQxVc1t7w2BdtZq9ei86HsPw2e4qnUUcqCjx57UCcHGKds8gSMlNNSKA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EnyaU5eDVyYvskJK2G7wYCwPfiSns1FHrn1WvSB1SFv5                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 320                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x04099237eb59b5ad16be69008b8f47f6cd6a183a988667619ff3c4e9fb8cee1a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Drw6NiyLjirAcbK1EAMehUKpX6318wiXu5QCDdoWM1N                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x1db80a2e461523abc8ba51bef16ac4d1cb6f836e696326af1e0bff46e5121418                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ Version: 663191                                                                                │
│  │ Digest: G4fnXb2beUq6qtHGZ5jFcJnQDQBusMTGwpLkGAjFMFyW                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x53c110368635522b78f49d9df273df0733ff5de9af431e29c2dbbc2d04cec466                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ Version: 663191                                                                                │
│  │ Digest: GEADm59DzHWgvLL46jjfMbZudcQ2gNd4oEYvN1wrJtE                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5fcd08951f4998448051a64af9e6f5c34961449828d0df5bd908c91ad106bff0                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 663191                                                                                │
│  │ Digest: J1ymu8bykkY8RUhuMKha9XjjxLUU3eL9zSvLk7UqMpE7                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xcd176e84d91b607b59a716724cacc4c1c18bc69c9639c91a582bcf5e7d209a58                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 663191                                                                                │
│  │ Digest: 4So4LCpESbTvYQWpAGBYUZExDDxXo2UvBmpxKmJi7uPC                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe3738f56f4af8494553eaf5392f4f971e836ebafd833bff89fa04902a95a2176                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ Version: 663191                                                                                │
│  │ Digest: EpHwzM64P4dGRPtBNnV5xv4tcLJEYS9VGdhtr6PPfXg9                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb214a9d90c451572d295c64f3415d319bd003ec4173ce341c615d291e96d86c9                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ Version: 663191                                                                                │
│  │ Digest: 8zSMgnDLznhA8cgxSgPfUZcZgneHpSbtQEXE3JV7QoWz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb214a9d90c451572d295c64f3415d319bd003ec4173ce341c615d291e96d86c9                         │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ Version: 663191                                                                                │
│  │ Digest: 8zSMgnDLznhA8cgxSgPfUZcZgneHpSbtQEXE3JV7QoWz                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 24114800 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    7yCsrEDdqgWfN5oynAW69sQB2ua7YFUTH3o2fMx6Pm2C                                                   │
│    GZcMfNx5jvGHsfSKEHJD7jZss7yCHqEGfhVk8Jx8a2N1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x1db80a2e461523abc8ba51bef16ac4d1cb6f836e696326af1e0bff46e5121418                                                      │
│  │ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                                                        │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )                                     │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x4099237eb59b5ad16be69008b8f47f6cd6a183a988667619ff3c4e9fb8cee1a::mycoin::MYCOIN>             │
│  │ Version: 663191                                                                                                                   │
│  │ Digest: G4fnXb2beUq6qtHGZ5jFcJnQDQBusMTGwpLkGAjFMFyW                                                                              │
│  └──                                                                                                                                 │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x53c110368635522b78f49d9df273df0733ff5de9af431e29c2dbbc2d04cec466                                                      │
│  │ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                                                        │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )                                     │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                              │
│  │ Version: 663191                                                                                                                   │
│  │ Digest: GEADm59DzHWgvLL46jjfMbZudcQ2gNd4oEYvN1wrJtE                                                                               │
│  └──                                                                                                                                 │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x5fcd08951f4998448051a64af9e6f5c34961449828d0df5bd908c91ad106bff0                                                      │
│  │ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                                                        │
│  │ Owner: Immutable                                                                                                                  │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x4099237eb59b5ad16be69008b8f47f6cd6a183a988667619ff3c4e9fb8cee1a::mycoin::MYCOIN>            │
│  │ Version: 663191                                                                                                                   │
│  │ Digest: J1ymu8bykkY8RUhuMKha9XjjxLUU3eL9zSvLk7UqMpE7                                                                              │
│  └──                                                                                                                                 │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0xcd176e84d91b607b59a716724cacc4c1c18bc69c9639c91a582bcf5e7d209a58                                                      │
│  │ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                                                        │
│  │ Owner: Immutable                                                                                                                  │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x4099237eb59b5ad16be69008b8f47f6cd6a183a988667619ff3c4e9fb8cee1a::faucet_coin::FAUCET_COIN>  │
│  │ Version: 663191                                                                                                                   │
│  │ Digest: 4So4LCpESbTvYQWpAGBYUZExDDxXo2UvBmpxKmJi7uPC                                                                              │
│  └──                                                                                                                                 │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0xe3738f56f4af8494553eaf5392f4f971e836ebafd833bff89fa04902a95a2176                                                      │
│  │ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                                                        │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )                                     │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x4099237eb59b5ad16be69008b8f47f6cd6a183a988667619ff3c4e9fb8cee1a::faucet_coin::FAUCET_COIN>   │
│  │ Version: 663191                                                                                                                   │
│  │ Digest: EpHwzM64P4dGRPtBNnV5xv4tcLJEYS9VGdhtr6PPfXg9                                                                              │
│  └──                                                                                                                                 │
│ Mutated Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0xb214a9d90c451572d295c64f3415d319bd003ec4173ce341c615d291e96d86c9                                                      │
│  │ Sender: 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897                                                        │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )                                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                        │
│  │ Version: 663191                                                                                                                   │
│  │ Digest: 8zSMgnDLznhA8cgxSgPfUZcZgneHpSbtQEXE3JV7QoWz                                                                              │
│  └──                                                                                                                                 │
│ Published Objects:                                                                                                                   │
│  ┌──                                                                                                                                 │
│  │ PackageID: 0x04099237eb59b5ad16be69008b8f47f6cd6a183a988667619ff3c4e9fb8cee1a                                                     │
│  │ Version: 1                                                                                                                        │
│  │ Digest: Drw6NiyLjirAcbK1EAMehUKpX6318wiXu5QCDdoWM1N                                                                               │
│  │ Modules: faucet_coin, mycoin                                                                                                      │
│  └──                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -24136680                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
几个比较关键的信息：
packageid: 0x04099237eb59b5ad16be69008b8f47f6cd6a183a988667619ff3c4e9fb8cee1a (因为是两个coin在一个项目下，所以packageid是一样的，不一样的是TreasuryCap)
MYCoin TreasuryCap: 0x1db80a2e461523abc8ba51bef16ac4d1cb6f836e696326af1e0bff46e5121418
FaucetCoin TreasuryCap: 0xe3738f56f4af8494553eaf5392f4f971e836ebafd833bff89fa04902a95a2176

## mint&transfer
### mint
```bash
sui client call --function mint --module mycoin --package 0x04099237eb59b5ad16be69008b8f47f6cd6a183a988667619ff3c4e9fb8cee1a --args 0x1db80a2e461523abc8ba51bef16ac4d1cb6f836e696326af1e0bff46e5121418 1000000000000 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 --gas-budget 50000000

sui client call --function mint --module faucet_coin --package 0x04099237eb59b5ad16be69008b8f47f6cd6a183a988667619ff3c4e9fb8cee1a --args 0xe3738f56f4af8494553eaf5392f4f971e836ebafd833bff89fa04902a95a2176 1000000000000 0x65d8b350c02090135193483f051ef5d6f5ab7d8603c6c2ef4a20c5dc143b7897 --gas-budget 50000000
```

### 给老板发点MYCoin
```bash
sui client call --function mint --module mycoin --package 0x04099237eb59b5ad16be69008b8f47f6cd6a183a988667619ff3c4e9fb8cee1a --args 0x1db80a2e461523abc8ba51bef16ac4d1cb6f836e696326af1e0bff46e5121418 1000000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000
```