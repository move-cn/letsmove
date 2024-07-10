#  完成两个Coin合约的上链部署
- 上链网络: mainnet

## 需求
- 完成 Coin相关知识的学习
- 完成 `My Coin` 的学习并部署主网  
- 完成 `Faucet Coin` 的学习并部署主网
- 提交 `My Coin` 和 `Faucet Coin` 合约发布`package id`
- 发送 `My Coin`  给地址 `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

## 任务指南

部署两个Coins合约

```bash
➜  task2 git:(main) ✗ sui client envs;sui client addresses;sui client gas
╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ devnet  │ https://fullnode.devnet.sui.io:443  │        │
│ testnet │ https://fullnode.testnet.sui.io:443 │        │
│ mainnet │ https://fullnode.mainnet.sui.io:443 │ *      │
╰─────────┴─────────────────────────────────────┴────────╯
╭──────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias    │ address                                                            │ active address │
├──────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ admin    │ 0x21ed06370e7cad73b9e60df59cd5b1cbff7176ee3cb5e3673f3f119add6126c7 │                │
│ deployer │ 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 │ *              │
╰──────────┴────────────────────────────────────────────────────────────────────┴────────────────╯
╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0x2f6c8718a9f7c8438feab4e507532599c81bb2d9bfd3a4775da47026bd0b0d20 │ 100000000          │ 0.10             │
│ 0xa0b2789d0ce4ef924d3a88d233979b8b98101f0818670050a85ad8533a5a89ec │ 6970360            │ 0.00             │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯
➜  task2 git:(main) ✗ sui client publish 
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
Successfully verified dependencies on-chain against source.
Transaction Digest: mbBAaj5BviCuJa6UBBgorhiRZVKTYhqvQHBDXeiJ8ov
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                   │
│ Gas Owner: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x2f6c8718a9f7c8438feab4e507532599c81bb2d9bfd3a4775da47026bd0b0d20                                    │
│  │ Version: 88022456                                                                                         │
│  │ Digest: Detp2vFePtTy9LqNXjLGq3oEf668W7K543utNc5qfB7c                                                      │
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
│    kO9NYdIOR064GBqWisO0ePuODQoB/04AL9EJFtfSWgTA9a0PeIsdJT2oumkCdESzuzQIV8NoadgDayLdEgOlAA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: mbBAaj5BviCuJa6UBBgorhiRZVKTYhqvQHBDXeiJ8ov                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 370                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x052d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: EkhLzLnqAuLWUajhfUZN637bCTY299Kks4zjARdZcfsc                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x4d7298be521749e87e18cc341092ff2cfe89bc4e6b78144977b62490c329c5af                         │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )  │
│  │ Version: 88022457                                                                              │
│  │ Digest: 2AqZarUVP36fmGfwxe6arniBZTjyaTt9HBwfposCL5zN                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x686173139b6a446aee5f8e2a8d5c78600085bf8234ed91e24823325a4b4460aa                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 88022457                                                                              │
│  │ Digest: 57JVf9PY9Kbysr5JTJu4mnGC3v5moZpZQC8Uc47h3ec9                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x89d521545f0074d3370ad20b0e1ade4dd92186514b52cccf16711143b904dbd7                         │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )  │
│  │ Version: 88022457                                                                              │
│  │ Digest: 6MK9Y6dT6bkvfv9PyUD2Noyc8WmHDV3oHdwJV2YFCe2b                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa8f486d2a5ee8260d0070626568cfb8f3bbbac01778c0b92578c79bc36edbd7f                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 88022457                                                                              │
│  │ Digest: FGgt62sgyQ7Ar1mY5SrkZfmEo7apMCqwVoK4rzLgnLiV                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xdc31596d82782ce453ad04ee2edba614a721f2239d32071541b48557bf791ba6                         │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )  │
│  │ Version: 88022457                                                                              │
│  │ Digest: EzfgiVHziDWLRjVxL6BebgnhCdkJNEBTS9oKzKj9Epn7                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2f6c8718a9f7c8438feab4e507532599c81bb2d9bfd3a4775da47026bd0b0d20                         │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )  │
│  │ Version: 88022457                                                                              │
│  │ Digest: Hc5VPV867dvXouFiHR4acjbHXRGo1r6dTT4LWvpoAb1g                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2f6c8718a9f7c8438feab4e507532599c81bb2d9bfd3a4775da47026bd0b0d20                         │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )  │
│  │ Version: 88022457                                                                              │
│  │ Digest: Hc5VPV867dvXouFiHR4acjbHXRGo1r6dTT4LWvpoAb1g                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 25270000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    J65MdU1b1gMcTv4qXT7UoohNnvCNjhAkdSMqqF5akjH3                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                             │
│  ┌──                                                                                                                                         │
│  │ ObjectID: 0x4d7298be521749e87e18cc341092ff2cfe89bc4e6b78144977b62490c329c5af                                                              │
│  │ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                                                │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )                                             │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x52d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03::mulander_coin::MULANDER_COIN>       │
│  │ Version: 88022457                                                                                                                         │
│  │ Digest: 2AqZarUVP36fmGfwxe6arniBZTjyaTt9HBwfposCL5zN                                                                                      │
│  └──                                                                                                                                         │
│  ┌──                                                                                                                                         │
│  │ ObjectID: 0x686173139b6a446aee5f8e2a8d5c78600085bf8234ed91e24823325a4b4460aa                                                              │
│  │ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                                                │
│  │ Owner: Immutable                                                                                                                          │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x52d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03::mulander_coin::MULANDER_COIN>      │
│  │ Version: 88022457                                                                                                                         │
│  │ Digest: 57JVf9PY9Kbysr5JTJu4mnGC3v5moZpZQC8Uc47h3ec9                                                                                      │
│  └──                                                                                                                                         │
│  ┌──                                                                                                                                         │
│  │ ObjectID: 0x89d521545f0074d3370ad20b0e1ade4dd92186514b52cccf16711143b904dbd7                                                              │
│  │ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                                                │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )                                             │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x52d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03::mulander_faucet::MULANDER_FAUCET>   │
│  │ Version: 88022457                                                                                                                         │
│  │ Digest: 6MK9Y6dT6bkvfv9PyUD2Noyc8WmHDV3oHdwJV2YFCe2b                                                                                      │
│  └──                                                                                                                                         │
│  ┌──                                                                                                                                         │
│  │ ObjectID: 0xa8f486d2a5ee8260d0070626568cfb8f3bbbac01778c0b92578c79bc36edbd7f                                                              │
│  │ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                                                │
│  │ Owner: Immutable                                                                                                                          │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x52d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03::mulander_faucet::MULANDER_FAUCET>  │
│  │ Version: 88022457                                                                                                                         │
│  │ Digest: FGgt62sgyQ7Ar1mY5SrkZfmEo7apMCqwVoK4rzLgnLiV                                                                                      │
│  └──                                                                                                                                         │
│  ┌──                                                                                                                                         │
│  │ ObjectID: 0xdc31596d82782ce453ad04ee2edba614a721f2239d32071541b48557bf791ba6                                                              │
│  │ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                                                │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )                                             │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                                      │
│  │ Version: 88022457                                                                                                                         │
│  │ Digest: EzfgiVHziDWLRjVxL6BebgnhCdkJNEBTS9oKzKj9Epn7                                                                                      │
│  └──                                                                                                                                         │
│ Mutated Objects:                                                                                                                             │
│  ┌──                                                                                                                                         │
│  │ ObjectID: 0x2f6c8718a9f7c8438feab4e507532599c81bb2d9bfd3a4775da47026bd0b0d20                                                              │
│  │ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                                                │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )                                             │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                │
│  │ Version: 88022457                                                                                                                         │
│  │ Digest: Hc5VPV867dvXouFiHR4acjbHXRGo1r6dTT4LWvpoAb1g                                                                                      │
│  └──                                                                                                                                         │
│ Published Objects:                                                                                                                           │
│  ┌──                                                                                                                                         │
│  │ PackageID: 0x052d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03                                                             │
│  │ Version: 1                                                                                                                                │
│  │ Digest: EkhLzLnqAuLWUajhfUZN637bCTY299Kks4zjARdZcfsc                                                                                      │
│  │ Modules: mulander_coin, mulander_faucet                                                                                                   │
│  └──                                                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -25041880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯                                       
```

Transfer MyCoin to `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

```bash
➜  task2 git:(main) ✗ sui client call --function mint --module mulander_coin --package 0x052d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03 --args 0x4d7298be521749e87e18cc341092ff2cfe89bc4e6b78144977b62490c329c5af 100000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 74958120
Transaction Digest: 75Q61r9pmedw4GUHnGJZqBjtjFQo4zZHyenpepsaqW1z
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                   │
│ Gas Owner: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                │
│ Gas Budget: 74958120 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x2f6c8718a9f7c8438feab4e507532599c81bb2d9bfd3a4775da47026bd0b0d20                                    │
│  │ Version: 88022457                                                                                         │
│  │ Digest: Hc5VPV867dvXouFiHR4acjbHXRGo1r6dTT4LWvpoAb1g                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x4d7298be521749e87e18cc341092ff2cfe89bc4e6b78144977b62490c329c5af              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100000000"                                                              │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mulander_coin                                                      │                         │
│ │  │ Package:   0x052d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    rD0bSA+g1otVeW6AfQ1SL9qQo6qzN0VEYSedOBjdEuxG5R1h/cNNqeCujXI54npwbcHnlXsqiPoSJoaOMWpODw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 75Q61r9pmedw4GUHnGJZqBjtjFQo4zZHyenpepsaqW1z                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 370                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xe7dd1d2074484ff255c40fd1a97ca8b9ac3a08df6a7a8c180c5f88b371a288d9                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 88022458                                                                              │
│  │ Digest: Afg3U7CiQ6adzBbeQjea2uAS8qSz3HnGYE4wtdwzbssk                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2f6c8718a9f7c8438feab4e507532599c81bb2d9bfd3a4775da47026bd0b0d20                         │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )  │
│  │ Version: 88022458                                                                              │
│  │ Digest: DvCFnuSv2Tgp7BupCzHSDtYeUUzLnZQDCmBREvXtxXrn                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x4d7298be521749e87e18cc341092ff2cfe89bc4e6b78144977b62490c329c5af                         │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )  │
│  │ Version: 88022458                                                                              │
│  │ Digest: 7u4HkzDePxAmkEa3Vj2fAzUEi5d4mdnSfusHVh5Xg412                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2f6c8718a9f7c8438feab4e507532599c81bb2d9bfd3a4775da47026bd0b0d20                         │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )  │
│  │ Version: 88022458                                                                              │
│  │ Digest: DvCFnuSv2Tgp7BupCzHSDtYeUUzLnZQDCmBREvXtxXrn                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4286400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2798928 MIST                                                                   │
│    Non-refundable Storage Fee: 28272 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    mbBAaj5BviCuJa6UBBgorhiRZVKTYhqvQHBDXeiJ8ov                                                    │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                          │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                        │
│  ┌──                                                                                                                                    │
│  │ ObjectID: 0xe7dd1d2074484ff255c40fd1a97ca8b9ac3a08df6a7a8c180c5f88b371a288d9                                                         │
│  │ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                                           │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                                        │
│  │ ObjectType: 0x2::coin::Coin<0x52d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03::mulander_coin::MULANDER_COIN>         │
│  │ Version: 88022458                                                                                                                    │
│  │ Digest: Afg3U7CiQ6adzBbeQjea2uAS8qSz3HnGYE4wtdwzbssk                                                                                 │
│  └──                                                                                                                                    │
│ Mutated Objects:                                                                                                                        │
│  ┌──                                                                                                                                    │
│  │ ObjectID: 0x2f6c8718a9f7c8438feab4e507532599c81bb2d9bfd3a4775da47026bd0b0d20                                                         │
│  │ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                                           │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )                                        │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                           │
│  │ Version: 88022458                                                                                                                    │
│  │ Digest: DvCFnuSv2Tgp7BupCzHSDtYeUUzLnZQDCmBREvXtxXrn                                                                                 │
│  └──                                                                                                                                    │
│  ┌──                                                                                                                                    │
│  │ ObjectID: 0x4d7298be521749e87e18cc341092ff2cfe89bc4e6b78144977b62490c329c5af                                                         │
│  │ Sender: 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918                                                           │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )                                        │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x52d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03::mulander_coin::MULANDER_COIN>  │
│  │ Version: 88022458                                                                                                                    │
│  │ Digest: 7u4HkzDePxAmkEa3Vj2fAzUEi5d4mdnSfusHVh5Xg412                                                                                 │
│  └──                                                                                                                                    │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                          │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )              │
│  │ CoinType: 0x52d69241b3ded4f1455dd7163814ac4472e589da7641764892f918f6f167f03::mulander_coin::MULANDER_COIN  │
│  │ Amount: 100000000                                                                                          │
│  └──                                                                                                          │
│  ┌──                                                                                                          │
│  │ Owner: Account Address ( 0x9da100344b78791774119ed087abae1d111c36276369accbf72ac2c8d8c8e918 )              │
│  │ CoinType: 0x2::sui::SUI                                                                                    │
│  │ Amount: -2237472                                                                                           │
│  └──                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
