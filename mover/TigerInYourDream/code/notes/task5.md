# Swap

[https://docs.sui.io/guides/developer/app-examples/trustless-token-swap](https://docs.sui.io/guides/developer/app-examples/trustless-token-swap)

[https://github.com/NonceGeek/Web3-dApp-Camp/tree/main/move-dapp/sui/swap](https://github.com/NonceGeek/Web3-dApp-Camp/tree/main/move-dapp/sui/swap)

交互稍显麻烦，请仔细对照 suiexplore的数据 
请提前准备需要 swap的币。

1. 发布合约

```rust
sui client publish --gas-budget 50000000 --skip-dependency-verification
```

1. 合约输出

```rust
[warn] Client/Server api version mismatch, client api version : 1.21.0, server api version : 1.21.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING swap
Skipping dependency verification
Transaction Digest: 4k1aKMBLgRtp6oLFCqTRGDsptHW79FJ6f8D8mq8k3SLW
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                   │
│ Gas Owner: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                                    │
│  │ Version: 82054444                                                                                         │
│  │ Digest: 13aKkBNW6JgAHvVKn5epmLvoKS6p4FvVfNutbFRaEhgk                                                      │
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
│    Q7SJPpDgSk/G/QTtu0aO1bH9+wg7cgnW3csij4LoOmBceKn18tl+gsbZd4QpVwVSRbwaI18cOKtT4opIXzyWBA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4k1aKMBLgRtp6oLFCqTRGDsptHW79FJ6f8D8mq8k3SLW                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 349                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x07aaf9fc5aeb4e2acf5731e52b65a44ea646ac19d1c01a9b9d8907671d5f75ba                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054445                                                                              │
│  │ Digest: 6Hvx4Szqq21VyZ3xjuQrUGy54vW6pDiu1zzfRfMhvzQs                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: DtJKb4v9bhQHfaoX9oCADykr2Q7ioskAoR7iCK3qy6Rw                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054445                                                                              │
│  │ Digest: 7LC8acT6KRpHPm6Mgx8DPe8gArdqPyPHStdi48nzDtn2                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054445                                                                              │
│  │ Digest: 7LC8acT6KRpHPm6Mgx8DPe8gArdqPyPHStdi48nzDtn2                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 30932000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    7FtUuSqeZ9VRGbrMs38To5Qf4qd9nuVf43Xo4G6YL8Sz                                                   │
│    9Roq8iKuBTUDfcAavYrykGXWRS7YoBQhRKQxbJYK3498                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x07aaf9fc5aeb4e2acf5731e52b65a44ea646ac19d1c01a9b9d8907671d5f75ba                  │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                    │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 82054445                                                                             │
│  │ Digest: 6Hvx4Szqq21VyZ3xjuQrUGy54vW6pDiu1zzfRfMhvzQs                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                  │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                    │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 82054445                                                                             │
│  │ Digest: 7LC8acT6KRpHPm6Mgx8DPe8gArdqPyPHStdi48nzDtn2                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a                 │
│  │ Version: 1                                                                                    │
│  │ Digest: DtJKb4v9bhQHfaoX9oCADykr2Q7ioskAoR7iCK3qy6Rw                                          │
│  │ Modules: alvin_swap                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -30703880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

1. 准备工作  需要 mint两种  coin  就用之前发布的 facent_coin 和 my_coin

```rust
sui client call --function mint --module mycoin --package 0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da --gas-budget 4000000 --args 0x61fd67b806dbe2af1b97fb5da7e1c2367faae25b546b3ec352d44b53d71f647c 1000 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c 

```

1. mycoin mint

```rust
[warn] Client/Server api version mismatch, client api version : 1.21.0, server api version : 1.21.1
Transaction Digest: vbP95We2EerY2YpG4zkbgE3U1XdLPfmzvTCXJmhtveN
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                   │
│ Gas Owner: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                │
│ Gas Budget: 4000000 MIST                                                                                     │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                                    │
│  │ Version: 82054445                                                                                         │
│  │ Digest: 7LC8acT6KRpHPm6Mgx8DPe8gArdqPyPHStdi48nzDtn2                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x61fd67b806dbe2af1b97fb5da7e1c2367faae25b546b3ec352d44b53d71f647c              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000"                                                                   │ │
│ │ 2   Pure Arg: Type: address, Value: "0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mycoin                                                             │                         │
│ │  │ Package:   0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    hPi8IKcQBDQkDfkhSCvtK+FM41LH3P7Crvbek/AoMgT9eRvGSitWESxiukCDL49ZSRDaOl99ZQwDHp3PWEl9Cg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: vbP95We2EerY2YpG4zkbgE3U1XdLPfmzvTCXJmhtveN                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 349                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x063ce9f554dc92386c8bdcdd1eae067af423d84e33725360b4e64c37cd719540                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054446                                                                              │
│  │ Digest: AVT4mnMbc5DgXnjUvsWMSsHGdxeUrqhCeq7mg62JUU6u                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054446                                                                              │
│  │ Digest: BSqwUGoi14kZnBu1vEkd2thqQTzNznRNUsYmVvcjLxXm                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x61fd67b806dbe2af1b97fb5da7e1c2367faae25b546b3ec352d44b53d71f647c                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054446                                                                              │
│  │ Digest: HAR1vQbknKHYzF9s2pi5e8HuMgtK77neMid5s1Nj29kW                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054446                                                                              │
│  │ Digest: BSqwUGoi14kZnBu1vEkd2thqQTzNznRNUsYmVvcjLxXm                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4k1aKMBLgRtp6oLFCqTRGDsptHW79FJ6f8D8mq8k3SLW                                                   │
│    7keZaj575dFkRhC7fHcDkMSFmKQ7vaZkHftxd3cSr9mN                                                   │
│    AKQUgZvvUJdyYhzk33fjArvm91vG6tVA6uQtg3N5KvTp                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x063ce9f554dc92386c8bdcdd1eae067af423d84e33725360b4e64c37cd719540                                            │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                           │
│  │ ObjectType: 0x2::coin::Coin<0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN>         │
│  │ Version: 82054446                                                                                                       │
│  │ Digest: AVT4mnMbc5DgXnjUvsWMSsHGdxeUrqhCeq7mg62JUU6u                                                                    │
│  └──                                                                                                                       │
│ Mutated Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                                            │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                              │
│  │ Version: 82054446                                                                                                       │
│  │ Digest: BSqwUGoi14kZnBu1vEkd2thqQTzNznRNUsYmVvcjLxXm                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x61fd67b806dbe2af1b97fb5da7e1c2367faae25b546b3ec352d44b53d71f647c                                            │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                           │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN>  │
│  │ Version: 82054446                                                                                                       │
│  │ Digest: HAR1vQbknKHYzF9s2pi5e8HuMgtK77neMid5s1Nj29kW                                                                    │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2130008                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ CoinType: 0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN   │
│  │ Amount: 1000                                                                                   │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

1. 再 mint 1000个 faucentCoin

```rust
sui client call --function mint --module faucet_coin --package 0x06dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63 --gas-budget 5000000 --args 0xb703ab407d1c11f2421fededd187e292bd543e15ac4bcc263057c7bac5a72d03 1000 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c 
```

1. output

```rust
[warn] Client/Server api version mismatch, client api version : 1.21.0, server api version : 1.21.1
Transaction Digest: 4bDrZecrnZE2hL8PGVYWogHyqWCTYw72Rw9fguirixp2
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                   │
│ Gas Owner: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                │
│ Gas Budget: 5000000 MIST                                                                                     │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                                    │
│  │ Version: 82054446                                                                                         │
│  │ Digest: BSqwUGoi14kZnBu1vEkd2thqQTzNznRNUsYmVvcjLxXm                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xb703ab407d1c11f2421fededd187e292bd543e15ac4bcc263057c7bac5a72d03              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000"                                                                   │ │
│ │ 2   Pure Arg: Type: address, Value: "0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    faucet_coin                                                        │                         │
│ │  │ Package:   0x06dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    0MHK95mC2bOvv0q4WQYcMkKfnCdIpkJHx5oGl9rGg5szEvdPe7AmhypEt6pLQ0V5CvX+wMXRFjHt6jSeYlVrDw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4bDrZecrnZE2hL8PGVYWogHyqWCTYw72Rw9fguirixp2                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 349                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xeaee61e8a57da7e7e4334ebf1e07c5010fae4ead6a528ee866d8b76d698155a2                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054447                                                                              │
│  │ Digest: Bd6UDkMLm45ZjMTk5pvz2JW4jaUChchdQgbyr9Wh24ji                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054447                                                                              │
│  │ Digest: 84rL3f8xmmtmM9qFiHwUT2v6nmERkNFDZciEFkSZUJY9                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb703ab407d1c11f2421fededd187e292bd543e15ac4bcc263057c7bac5a72d03                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054447                                                                              │
│  │ Digest: 5TsxQpXLgEzD94xneDZ5g1f1UGbLqonVkB8jNXZ3Ubqq                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054447                                                                              │
│  │ Digest: 84rL3f8xmmtmM9qFiHwUT2v6nmERkNFDZciEFkSZUJY9                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4225600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2768832 MIST                                                                   │
│    Non-refundable Storage Fee: 27968 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    vbP95We2EerY2YpG4zkbgE3U1XdLPfmzvTCXJmhtveN                                                    │
│    4Wq1eySicgqYzCJxqhGrQH7eorhYG3MkXprxFvxuNLkp                                                   │
│    Bg8bhivdq3VpRH66r3ssrVzAio4tF8Yie6okS9MijrZs                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                    │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0xeaee61e8a57da7e7e4334ebf1e07c5010fae4ead6a528ee866d8b76d698155a2                                                     │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                       │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                    │
│  │ ObjectType: 0x2::coin::Coin<0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN>         │
│  │ Version: 82054447                                                                                                                │
│  │ Digest: Bd6UDkMLm45ZjMTk5pvz2JW4jaUChchdQgbyr9Wh24ji                                                                             │
│  └──                                                                                                                                │
│ Mutated Objects:                                                                                                                    │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                                                     │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                       │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                       │
│  │ Version: 82054447                                                                                                                │
│  │ Digest: 84rL3f8xmmtmM9qFiHwUT2v6nmERkNFDZciEFkSZUJY9                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0xb703ab407d1c11f2421fededd187e292bd543e15ac4bcc263057c7bac5a72d03                                                     │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                       │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN>  │
│  │ Version: 82054447                                                                                                                │
│  │ Digest: 5TsxQpXLgEzD94xneDZ5g1f1UGbLqonVkB8jNXZ3Ubqq                                                                             │
│  └──                                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                           │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                      │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )          │
│  │ CoinType: 0x2::sui::SUI                                                                                │
│  │ Amount: -2206768                                                                                       │
│  └──                                                                                                      │
│  ┌──                                                                                                      │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )          │
│  │ CoinType: 0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN  │
│  │ Amount: 1000                                                                                           │
│  └──                                                                                                      │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

1. 总结

```rust
AMMPKG=0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a
COINA=0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN
COINB=0x06dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN

```

1. 生成 POOL

```rust
sui client call --package 0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a \
                --module alvin_swap \
                --function generate_pool \
                 \
                --type-args  $COINA $COINB
```

1. 输出 POOL

```rust
[warn] Client/Server api version mismatch, client api version : 1.21.0, server api version : 1.21.1
Transaction Digest: DdAFzoYEzs7seMCwB9oGpvWML7DjP1tw28cSLG7GJB1f
╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                           │
│ Gas Owner: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                        │
│ Gas Budget: 100000000 MIST                                                                           │
│ Gas Price: 750 MIST                                                                                  │
│ Gas Payment:                                                                                         │
│  ┌──                                                                                                 │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                            │
│  │ Version: 82054447                                                                                 │
│  │ Digest: 84rL3f8xmmtmM9qFiHwUT2v6nmERkNFDZciEFkSZUJY9                                              │
│  └──                                                                                                 │
│                                                                                                      │
│ Transaction Kind: Programmable                                                                       │
│   No input objects for this transaction                                                              │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                         │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                     │ │
│ │  ┌                                                                                               │ │
│ │  │ Function:  generate_pool                                                                      │ │
│ │  │ Module:    alvin_swap                                                                         │ │
│ │  │ Package:   0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a                 │ │
│ │  │ Type Arguments:                                                                               │ │
│ │  │   0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN          │ │
│ │  │   0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN │ │
│ │  └                                                                                               │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                      │
│ Signatures:                                                                                          │
│    FtcKE8+40ZhS/YpgeoNmTM8yCThaGbEGhO46icigO1G5xDWPc0qcEMUrOMuvwLoMHimkr1LVLtIIUn+xf5fwAw==          │
│                                                                                                      │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DdAFzoYEzs7seMCwB9oGpvWML7DjP1tw28cSLG7GJB1f                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 349                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8698274f9e029bca0a9fcd577ae570b9a465a4c01ffb9e2a8cc38ddbe20a6e60                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 82054448                                                                              │
│  │ Digest: HTQXJ9YZvncp2PCeiUeYrDqrXk2iopERgtDYkxpjaJ81                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054448                                                                              │
│  │ Digest: EZT7iNNt55L5xyyYuoEejXvV9bYZjeXnsM2KSy3yBf1B                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054448                                                                              │
│  │ Digest: EZT7iNNt55L5xyyYuoEejXvV9bYZjeXnsM2KSy3yBf1B                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3275600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4bDrZecrnZE2hL8PGVYWogHyqWCTYw72Rw9fguirixp2                                                   │
│    4k1aKMBLgRtp6oLFCqTRGDsptHW79FJ6f8D8mq8k3SLW                                                   │
│    AKQUgZvvUJdyYhzk33fjArvm91vG6tVA6uQtg3N5KvTp                                                   │
│    Bg8bhivdq3VpRH66r3ssrVzAio4tF8Yie6okS9MijrZs                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0x8698274f9e029bca0a9fcd577ae570b9a465a4c01ffb9e2a8cc38ddbe20a6e60                                                                                                                                                                                                       │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                                                                                                                                                                         │
│  │ Owner: Shared                                                                                                                                                                                                                                                                      │
│  │ ObjectType: 0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a::alvin_swap::Pool<0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN, 0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN>  │
│  │ Version: 82054448                                                                                                                                                                                                                                                                  │
│  │ Digest: HTQXJ9YZvncp2PCeiUeYrDqrXk2iopERgtDYkxpjaJ81                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│ Mutated Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                                                                                                                                                                                                       │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                         │
│  │ Version: 82054448                                                                                                                                                                                                                                                                  │
│  │ Digest: EZT7iNNt55L5xyyYuoEejXvV9bYZjeXnsM2KSy3yBf1B                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3047480                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

1. pool

```rust
POOLID="0x8698274f9e029bca0a9fcd577ae570b9a465a4c01ffb9e2a8cc38ddbe20a6e60"

```

1. 增加 POCKET

```rust
sui client call --package $AMMPKG \
                --module alvin_swap \
                --function create_pocket \
                 
```

1. POCKET

```rust
[warn] Client/Server api version mismatch, client api version : 1.21.0, server api version : 1.21.1
Transaction Digest: BSmD9zUMT72Le1wEdHtzVtqCpm7FdxtxCXNGZawuC9Jp
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                  │
│ Gas Owner: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c               │
│ Gas Budget: 100000000 MIST                                                                  │
│ Gas Price: 750 MIST                                                                         │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                   │
│  │ Version: 82054448                                                                        │
│  │ Digest: EZT7iNNt55L5xyyYuoEejXvV9bYZjeXnsM2KSy3yBf1B                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│   No input objects for this transaction                                                     │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  create_pocket                                                      │        │
│ │  │ Module:    alvin_swap                                                         │        │
│ │  │ Package:   0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    f4glzraB7JKlGw7MfsftvJYKRBVxl3/FRwFi+ZJEflmOqql7hwlWLLGTYwY0D06FIvjne8+4KTh49+gtnaOtAQ== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BSmD9zUMT72Le1wEdHtzVtqCpm7FdxtxCXNGZawuC9Jp                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 349                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x370ca5a1c5a6117c237ad691c7ae38d9f50d51357bc75db740af1d8bcf21426f                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054449                                                                              │
│  │ Digest: ECHc3VA1G5VqnGuCRydZWiY198M54LP3QdPnVS3gwXPU                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054449                                                                              │
│  │ Digest: 7x11sPemCWK64agJcBN2N6sD3JS7zwQQRZZVBYGNHnEf                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054449                                                                              │
│  │ Digest: 7x11sPemCWK64agJcBN2N6sD3JS7zwQQRZZVBYGNHnEf                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2606800 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4k1aKMBLgRtp6oLFCqTRGDsptHW79FJ6f8D8mq8k3SLW                                                   │
│    DdAFzoYEzs7seMCwB9oGpvWML7DjP1tw28cSLG7GJB1f                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                       │
│  ┌──                                                                                                   │
│  │ ObjectID: 0x370ca5a1c5a6117c237ad691c7ae38d9f50d51357bc75db740af1d8bcf21426f                        │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                          │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )       │
│  │ ObjectType: 0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a::alvin_swap::Pocket  │
│  │ Version: 82054449                                                                                   │
│  │ Digest: ECHc3VA1G5VqnGuCRydZWiY198M54LP3QdPnVS3gwXPU                                                │
│  └──                                                                                                   │
│ Mutated Objects:                                                                                       │
│  ┌──                                                                                                   │
│  │ ObjectID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                        │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                          │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                          │
│  │ Version: 82054449                                                                                   │
│  │ Digest: 7x11sPemCWK64agJcBN2N6sD3JS7zwQQRZZVBYGNHnEf                                                │
│  └──                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2378680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

1. pocket_id

```rust
POCKETID="0x370ca5a1c5a6117c237ad691c7ae38d9f50d51357bc75db740af1d8bcf21426f"

```

1. 增加流动性

```rust
sui client call --package $AMMPKG --module alvin_swap --function deposit_totally \
                 --type-args  $COINA $COINB \
                --args $POOLID 0x063ce9f554dc92386c8bdcdd1eae067af423d84e33725360b4e64c37cd719540 0xeaee61e8a57da7e7e4334ebf1e07c5010fae4ead6a528ee866d8b76d698155a2 $POCKETID

```

1. 输出

```rust
Transaction Digest: 2L1RSpXBqCwKCA8nHyMhyt4WpGydPHq9rmknmti492qZ
╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                           │
│ Gas Owner: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                        │
│ Gas Budget: 100000000 MIST                                                                           │
│ Gas Price: 750 MIST                                                                                  │
│ Gas Payment:                                                                                         │
│  ┌──                                                                                                 │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                            │
│  │ Version: 82054449                                                                                 │
│  │ Digest: 7x11sPemCWK64agJcBN2N6sD3JS7zwQQRZZVBYGNHnEf                                              │
│  └──                                                                                                 │
│                                                                                                      │
│ Transaction Kind: Programmable                                                                       │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮      │
│ │ Input Objects                                                                               │      │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤      │
│ │ 0   Shared Object    ID: 0x8698274f9e029bca0a9fcd577ae570b9a465a4c01ffb9e2a8cc38ddbe20a6e60 │      │
│ │ 1   Imm/Owned Object ID: 0x063ce9f554dc92386c8bdcdd1eae067af423d84e33725360b4e64c37cd719540 │      │
│ │ 2   Imm/Owned Object ID: 0xeaee61e8a57da7e7e4334ebf1e07c5010fae4ead6a528ee866d8b76d698155a2 │      │
│ │ 3   Imm/Owned Object ID: 0x370ca5a1c5a6117c237ad691c7ae38d9f50d51357bc75db740af1d8bcf21426f │      │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯      │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                         │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                     │ │
│ │  ┌                                                                                               │ │
│ │  │ Function:  deposit_totally                                                                    │ │
│ │  │ Module:    alvin_swap                                                                         │ │
│ │  │ Package:   0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a                 │ │
│ │  │ Type Arguments:                                                                               │ │
│ │  │   0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN          │ │
│ │  │   0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN │ │
│ │  │ Arguments:                                                                                    │ │
│ │  │   Input  0                                                                                    │ │
│ │  │   Input  1                                                                                    │ │
│ │  │   Input  2                                                                                    │ │
│ │  │   Input  3                                                                                    │ │
│ │  └                                                                                               │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                      │
│ Signatures:                                                                                          │
│    Ot0xKga+nAcvtJmhoEGNpbxfrJNxkzYkT/L86wIPFc0TL0rFBshOEWURjlLj61M0a3J7rkIHFL5cXqI6MlobDQ==          │
│                                                                                                      │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2L1RSpXBqCwKCA8nHyMhyt4WpGydPHq9rmknmti492qZ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 349                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8be47d257354f7b46c5813dcc1ac598984fb0cffc9e4563d6c93deb6f31a3349                         │
│  │ Owner: Object ID: ( 0xd55e7c3ba68dc2b24c8a8d05e56d389240d2d920560fa937e1c432a6a254bc64 )       │
│  │ Version: 82054450                                                                              │
│  │ Digest: qpLUCTSBbo5jHAp4CncdqemJR3759bpoypZfsCfju2W                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xddf826dbd87db57e6916ff72815c9041ce639e7a4cee01065a5a4ef770ab8b57                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054450                                                                              │
│  │ Digest: AHfqVUWADWpAYHNau99mXUgfXyqjGs6s94H7ZDXxAN4K                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054450                                                                              │
│  │ Digest: GvTAM1dx2YtUc8J26p3qZaFtswKXyiX6MVvhbaB1QnuH                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x370ca5a1c5a6117c237ad691c7ae38d9f50d51357bc75db740af1d8bcf21426f                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054450                                                                              │
│  │ Digest: 59U9RadZNadN5d3XXQAQxboU8WJXhUD6SqEbfYFSKoKL                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8698274f9e029bca0a9fcd577ae570b9a465a4c01ffb9e2a8cc38ddbe20a6e60                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 82054450                                                                              │
│  │ Digest: DsXRwALii8czk1WrfFf1eHWmGCKUBu4gitqFpRoR7tiv                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x8698274f9e029bca0a9fcd577ae570b9a465a4c01ffb9e2a8cc38ddbe20a6e60                         │
│  │ Version: 82054448                                                                              │
│  │ Digest: HTQXJ9YZvncp2PCeiUeYrDqrXk2iopERgtDYkxpjaJ81                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x063ce9f554dc92386c8bdcdd1eae067af423d84e33725360b4e64c37cd719540                         │
│  │ Version: 82054450                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xeaee61e8a57da7e7e4334ebf1e07c5010fae4ead6a528ee866d8b76d698155a2                         │
│  │ Version: 82054450                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054450                                                                              │
│  │ Digest: GvTAM1dx2YtUc8J26p3qZaFtswKXyiX6MVvhbaB1QnuH                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9104800 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 7599240 MIST                                                                   │
│    Non-refundable Storage Fee: 76760 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    vbP95We2EerY2YpG4zkbgE3U1XdLPfmzvTCXJmhtveN                                                    │
│    4bDrZecrnZE2hL8PGVYWogHyqWCTYw72Rw9fguirixp2                                                   │
│    4k1aKMBLgRtp6oLFCqTRGDsptHW79FJ6f8D8mq8k3SLW                                                   │
│    AKQUgZvvUJdyYhzk33fjArvm91vG6tVA6uQtg3N5KvTp                                                   │
│    BSmD9zUMT72Le1wEdHtzVtqCpm7FdxtxCXNGZawuC9Jp                                                   │
│    Bg8bhivdq3VpRH66r3ssrVzAio4tF8Yie6okS9MijrZs                                                   │
│    DdAFzoYEzs7seMCwB9oGpvWML7DjP1tw28cSLG7GJB1f                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                                     │
│  ┌──                                                                                                                                                                                                                                                                                                 │
│  │ ObjectID: 0x8be47d257354f7b46c5813dcc1ac598984fb0cffc9e4563d6c93deb6f31a3349                                                                                                                                                                                                                      │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                                                                                                                                                                                        │
│  │ Owner: Object ID: ( 0xd55e7c3ba68dc2b24c8a8d05e56d389240d2d920560fa937e1c432a6a254bc64 )                                                                                                                                                                                                          │
│  │ ObjectType: 0x2::dynamic_field::Field<0x2::object::ID, vector<u64>>                                                                                                                                                                                                                               │
│  │ Version: 82054450                                                                                                                                                                                                                                                                                 │
│  │ Digest: qpLUCTSBbo5jHAp4CncdqemJR3759bpoypZfsCfju2W                                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                                 │
│  ┌──                                                                                                                                                                                                                                                                                                 │
│  │ ObjectID: 0xddf826dbd87db57e6916ff72815c9041ce639e7a4cee01065a5a4ef770ab8b57                                                                                                                                                                                                                      │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                                                                                                                                                                                        │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                                                                                                                                                                                     │
│  │ ObjectType: 0x2::coin::Coin<0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a::alvin_swap::LP<0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN, 0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN>>  │
│  │ Version: 82054450                                                                                                                                                                                                                                                                                 │
│  │ Digest: AHfqVUWADWpAYHNau99mXUgfXyqjGs6s94H7ZDXxAN4K                                                                                                                                                                                                                                              │
│  └──                                                                                                                                                                                                                                                                                                 │
│ Mutated Objects:                                                                                                                                                                                                                                                                                     │
│  ┌──                                                                                                                                                                                                                                                                                                 │
│  │ ObjectID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                                                                                                                                                                                                                      │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                                                                                                                                                                                        │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                                                                                                                                                                                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                                        │
│  │ Version: 82054450                                                                                                                                                                                                                                                                                 │
│  │ Digest: GvTAM1dx2YtUc8J26p3qZaFtswKXyiX6MVvhbaB1QnuH                                                                                                                                                                                                                                              │
│  └──                                                                                                                                                                                                                                                                                                 │
│  ┌──                                                                                                                                                                                                                                                                                                 │
│  │ ObjectID: 0x370ca5a1c5a6117c237ad691c7ae38d9f50d51357bc75db740af1d8bcf21426f                                                                                                                                                                                                                      │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                                                                                                                                                                                        │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                                                                                                                                                                                     │
│  │ ObjectType: 0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a::alvin_swap::Pocket                                                                                                                                                                                                │
│  │ Version: 82054450                                                                                                                                                                                                                                                                                 │
│  │ Digest: 59U9RadZNadN5d3XXQAQxboU8WJXhUD6SqEbfYFSKoKL                                                                                                                                                                                                                                              │
│  └──                                                                                                                                                                                                                                                                                                 │
│  ┌──                                                                                                                                                                                                                                                                                                 │
│  │ ObjectID: 0x8698274f9e029bca0a9fcd577ae570b9a465a4c01ffb9e2a8cc38ddbe20a6e60                                                                                                                                                                                                                      │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                                                                                                                                                                                        │
│  │ Owner: Shared                                                                                                                                                                                                                                                                                     │
│  │ ObjectType: 0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a::alvin_swap::Pool<0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN, 0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN>                 │
│  │ Version: 82054450                                                                                                                                                                                                                                                                                 │
│  │ Digest: DsXRwALii8czk1WrfFf1eHWmGCKUBu4gitqFpRoR7tiv                                                                                                                                                                                                                                              │
│  └──                                                                                                                                                                                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                                                                                                                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                                                                                                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                                                                                                                                                                  │
│  │ CoinType: 0x2::sui::SUI                                                                                                                                                                                                                                                        │
│  │ Amount: -2255560                                                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                              │
│  ┌──                                                                                                                                                                                                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                                                                                                                                                                  │
│  │ CoinType: 0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN                                                                                                                                                                          │
│  │ Amount: -1000                                                                                                                                                                                                                                                                  │
│  └──                                                                                                                                                                                                                                                                              │
│  ┌──                                                                                                                                                                                                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                                                                                                                                                                  │
│  │ CoinType: 0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN                                                                                                                                                                                   │
│  │ Amount: -1000                                                                                                                                                                                                                                                                  │
│  └──                                                                                                                                                                                                                                                                              │
│  ┌──                                                                                                                                                                                                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                                                                                                                                                                  │
│  │ CoinType: 0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a::alvin_swap::LP<0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN, 0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN>  │
│  │ Amount: 2000                                                                                                                                                                                                                                                                   │
│  └──                                                                                                                                                                                                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

1. swap

```rust
// 找一个COINB 转换  another coinb (FacuentCoin)
sui client call --package $AMMPKG \
                --module alvin_swap \
                --function swap_b_to_a \
                 \
                --type-args $COINA $COINB \
                --args $POOLID \
                       '["0xaa0f50671aa4fcfe3ee86b7215d4633d4f898e276b287bcf9348f93933e1779e"]' \
                       \"66\"
```

1. 找一个COINB 转换

```rust
Transaction Digest: EBy4FBdUiukmKtPnu7EDMuS5wqHw8oTnQ3PRoYfNzoEC
╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                           │
│ Gas Owner: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                        │
│ Gas Budget: 100000000 MIST                                                                           │
│ Gas Price: 750 MIST                                                                                  │
│ Gas Payment:                                                                                         │
│  ┌──                                                                                                 │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                            │
│  │ Version: 82054450                                                                                 │
│  │ Digest: GvTAM1dx2YtUc8J26p3qZaFtswKXyiX6MVvhbaB1QnuH                                              │
│  └──                                                                                                 │
│                                                                                                      │
│ Transaction Kind: Programmable                                                                       │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮      │
│ │ Input Objects                                                                               │      │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤      │
│ │ 0   Shared Object    ID: 0x8698274f9e029bca0a9fcd577ae570b9a465a4c01ffb9e2a8cc38ddbe20a6e60 │      │
│ │ 1   Imm/Owned Object ID: 0xaa0f50671aa4fcfe3ee86b7215d4633d4f898e276b287bcf9348f93933e1779e │      │
│ │ 2   Pure Arg: Type: u64, Value: "66"                                                        │      │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯      │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                         │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MakeMoveVec:                                                                                  │ │
│ │  ┌                                                                                               │ │
│ │  │ Arguments:                                                                                    │ │
│ │  │   Input  1                                                                                    │ │
│ │  └                                                                                               │ │
│ │                                                                                                  │ │
│ │ 1  MoveCall:                                                                                     │ │
│ │  ┌                                                                                               │ │
│ │  │ Function:  swap_b_to_a                                                                        │ │
│ │  │ Module:    alvin_swap                                                                         │ │
│ │  │ Package:   0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a                 │ │
│ │  │ Type Arguments:                                                                               │ │
│ │  │   0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN          │ │
│ │  │   0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN │ │
│ │  │ Arguments:                                                                                    │ │
│ │  │   Input  0                                                                                    │ │
│ │  │   Result 0                                                                                    │ │
│ │  │   Input  2                                                                                    │ │
│ │  └                                                                                               │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                      │
│ Signatures:                                                                                          │
│    TK8aEb82BGBOyVi/tiJnzSVVXcde/2+7sP+K8VsVc3DRHLO4Fljd2u/TOy8of+rjEr4UqcsZA3KQwcN1rr1QCQ==          │
│                                                                                                      │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EBy4FBdUiukmKtPnu7EDMuS5wqHw8oTnQ3PRoYfNzoEC                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 349                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x51c9f29161c0f5d8d41c75412ac6b1fc479708b7f75bcf73f9599ae72053e6c5                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054451                                                                              │
│  │ Digest: AY2q4gWHuc53PWaeAHAsKNDjQVgqotn8nED1otNHhgg2                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa99d6fb5710facf401e3f4d086a5c2328f6d86a103e8d89ab9e7f26480bd8a4e                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054451                                                                              │
│  │ Digest: J6GGkJ1oqyCnFskz3vqwNHqmtg3himeKRHm55AqamSoh                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054451                                                                              │
│  │ Digest: Ex5wGcGzJsaXcYfdmuaSjUV1aFKVTz5UksroWk3aYUCV                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8698274f9e029bca0a9fcd577ae570b9a465a4c01ffb9e2a8cc38ddbe20a6e60                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 82054451                                                                              │
│  │ Digest: 2JzwPeE1KKQcWNkh1GpdEJn3r7J1VqmAHteGpUZDfjtm                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x8698274f9e029bca0a9fcd577ae570b9a465a4c01ffb9e2a8cc38ddbe20a6e60                         │
│  │ Version: 82054450                                                                              │
│  │ Digest: DsXRwALii8czk1WrfFf1eHWmGCKUBu4gitqFpRoR7tiv                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xaa0f50671aa4fcfe3ee86b7215d4633d4f898e276b287bcf9348f93933e1779e                         │
│  │ Version: 82054451                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 82054451                                                                              │
│  │ Digest: Ex5wGcGzJsaXcYfdmuaSjUV1aFKVTz5UksroWk3aYUCV                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 6057200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 4657356 MIST                                                                   │
│    Non-refundable Storage Fee: 47044 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2L1RSpXBqCwKCA8nHyMhyt4WpGydPHq9rmknmti492qZ                                                   │
│    4Wq1eySicgqYzCJxqhGrQH7eorhYG3MkXprxFvxuNLkp                                                   │
│    4k1aKMBLgRtp6oLFCqTRGDsptHW79FJ6f8D8mq8k3SLW                                                   │
│    AKQUgZvvUJdyYhzk33fjArvm91vG6tVA6uQtg3N5KvTp                                                   │
│    Bg8bhivdq3VpRH66r3ssrVzAio4tF8Yie6okS9MijrZs                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0x51c9f29161c0f5d8d41c75412ac6b1fc479708b7f75bcf73f9599ae72053e6c5                                                                                                                                                                                                       │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN>                                                                                                                                                           │
│  │ Version: 82054451                                                                                                                                                                                                                                                                  │
│  │ Digest: AY2q4gWHuc53PWaeAHAsKNDjQVgqotn8nED1otNHhgg2                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0xa99d6fb5710facf401e3f4d086a5c2328f6d86a103e8d89ab9e7f26480bd8a4e                                                                                                                                                                                                       │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN>                                                                                                                                                                    │
│  │ Version: 82054451                                                                                                                                                                                                                                                                  │
│  │ Digest: J6GGkJ1oqyCnFskz3vqwNHqmtg3himeKRHm55AqamSoh                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│ Mutated Objects:                                                                                                                                                                                                                                                                      │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0x22bf065163218c53fa6e0c7f10317aababbfb8aa049739f00db55c3709104dd3                                                                                                                                                                                                       │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                                                                                                                                                                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                                                                                                                                                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                         │
│  │ Version: 82054451                                                                                                                                                                                                                                                                  │
│  │ Digest: Ex5wGcGzJsaXcYfdmuaSjUV1aFKVTz5UksroWk3aYUCV                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
│  ┌──                                                                                                                                                                                                                                                                                  │
│  │ ObjectID: 0x8698274f9e029bca0a9fcd577ae570b9a465a4c01ffb9e2a8cc38ddbe20a6e60                                                                                                                                                                                                       │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                                                                                                                                                                         │
│  │ Owner: Shared                                                                                                                                                                                                                                                                      │
│  │ ObjectType: 0xf00ba72ba3e180ccde2318b077b48e572f923542dfa8fda17d312c02c040351a::alvin_swap::Pool<0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN, 0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN>  │
│  │ Version: 82054451                                                                                                                                                                                                                                                                  │
│  │ Digest: 2JzwPeE1KKQcWNkh1GpdEJn3r7J1VqmAHteGpUZDfjtm                                                                                                                                                                                                                               │
│  └──                                                                                                                                                                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                           │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                      │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )          │
│  │ CoinType: 0x2::sui::SUI                                                                                │
│  │ Amount: -2149844                                                                                       │
│  └──                                                                                                      │
│  ┌──                                                                                                      │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )          │
│  │ CoinType: 0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN  │
│  │ Amount: -66                                                                                            │
│  └──                                                                                                      │
│  ┌──                                                                                                      │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )          │
│  │ CoinType: 0x86dbb37c4d0864966a5ec8f566ccda813e318412218257041ab663b3f3e070da::mycoin::MYCOIN           │
│  │ Amount: 66                                                                                             │
│  └──                                                                                                      │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```