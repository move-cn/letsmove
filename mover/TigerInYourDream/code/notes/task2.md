### Task2

查看代码即可
主要包含知识点 OTW One Time Wintness 

mycoin 额外添加代币 image_url </br>

以下是交互细节 由于交互方式类似仅展示 faucetcoin的交互，mycoin会转给特定地址

1. 切换网路
2. 命令行如下

```rust
sui client envs
sui client new-env --alias=mainnet --rpc https://fullnode.mainnet.sui.io:443
sui client switch --env mainnet
```

3. publich

```rust
sui client publish --gas-budget 20000000 --skip-dependency-verification
```

4. output

```rust
[warn] Client/Server api version mismatch, client api version : 1.21.0, server api version : 1.20.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING faucet_coin
Skipping dependency verification
Transaction Digest: Bg8bhivdq3VpRH66r3ssrVzAio4tF8Yie6okS9MijrZs
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                   │
│ Gas Owner: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                │
│ Gas Budget: 20000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                                    │
│  │ Version: 80879223                                                                                         │
│  │ Digest: 2yNQgQfKVdTPcLJfbDuLUuH3DUfbKP9BDqp2feu7nahY                                                      │
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
│    AGveKnn59fKSvRcIwUIpY32tGj4Uqa2Fmix9V5sf0DO8nfUdYd5HRpGFMUjtozlMCCk1QCl4IYvT4lgBxT0lAA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Bg8bhivdq3VpRH66r3ssrVzAio4tF8Yie6okS9MijrZs                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 345                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x06dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 5hQyuNzF2YoKNRKgnni2d5bnskvWAQA6gunijF5B1XA8                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x1532ff4df9d93f405724f21eb91c7a6afa105c892b7ecdfc0adf86e6ba7790f8                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879224                                                                              │
│  │ Digest: QW48ggU349ayC3j94nBzvVg54SF591pA4wARVTdqPEL                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb39dcdad5f5717d5e823b69114f3548e4e2023d66433b90fb8f09528150d6af1                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 80879224                                                                              │
│  │ Digest: 4UUYbLWDVLXFqBTEF17UdNPrQV72G6AuBWxY62e4y4Ku                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb703ab407d1c11f2421fededd187e292bd543e15ac4bcc263057c7bac5a72d03                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879224                                                                              │
│  │ Digest: FwPvZK7yKbzgosCQNxHXgQi91wfwfdpVmQzcUTkRCu5J                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879224                                                                              │
│  │ Digest: AhjW37GBFRNqqqQTRFdUgaSwb73b1TNVEDQjBGXfRU4                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879224                                                                              │
│  │ Digest: AhjW37GBFRNqqqQTRFdUgaSwb73b1TNVEDQjBGXfRU4                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 14052400 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    qbYMHsLyn1v634YYb81nv3pnWUAnS1kXtsPnrX2iAnF                                                    │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    7FtUuSqeZ9VRGbrMs38To5Qf4qd9nuVf43Xo4G6YL8Sz                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x1532ff4df9d93f405724f21eb91c7a6afa105c892b7ecdfc0adf86e6ba7790f8                                                      │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                        │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                     │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                              │
│  │ Version: 80879224                                                                                                                 │
│  │ Digest: QW48ggU349ayC3j94nBzvVg54SF591pA4wARVTdqPEL                                                                               │
│  └──                                                                                                                                 │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0xb39dcdad5f5717d5e823b69114f3548e4e2023d66433b90fb8f09528150d6af1                                                      │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                        │
│  │ Owner: Immutable                                                                                                                  │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN>  │
│  │ Version: 80879224                                                                                                                 │
│  │ Digest: 4UUYbLWDVLXFqBTEF17UdNPrQV72G6AuBWxY62e4y4Ku                                                                              │
│  └──                                                                                                                                 │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0xb703ab407d1c11f2421fededd187e292bd543e15ac4bcc263057c7bac5a72d03                                                      │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                        │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                     │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN>   │
│  │ Version: 80879224                                                                                                                 │
│  │ Digest: FwPvZK7yKbzgosCQNxHXgQi91wfwfdpVmQzcUTkRCu5J                                                                              │
│  └──                                                                                                                                 │
│ Mutated Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                                                      │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                        │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                        │
│  │ Version: 80879224                                                                                                                 │
│  │ Digest: AhjW37GBFRNqqqQTRFdUgaSwb73b1TNVEDQjBGXfRU4                                                                               │
│  └──                                                                                                                                 │
│ Published Objects:                                                                                                                   │
│  ┌──                                                                                                                                 │
│  │ PackageID: 0x06dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63                                                     │
│  │ Version: 1                                                                                                                        │
│  │ Digest: 5hQyuNzF2YoKNRKgnni2d5bnskvWAQA6gunijF5B1XA8                                                                              │
│  │ Modules: faucet_coin                                                                                                              │
│  └──                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -13824280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

1. mint

```rust
pack 0x06dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63

TreasuryCap  0xb703ab407d1c11f2421fededd187e292bd543e15ac4bcc263057c7bac5a72d03

recipient 

moudle faucet_coin

sui client call --function mint --module faucet_coin --package 0x06dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63 --gas-budget 5000000 --args 0xb703ab407d1c11f2421fededd187e292bd543e15ac4bcc263057c7bac5a72d03 100 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c 

```

out put

```
warn] Client/Server api version mismatch, client api version : 1.21.0, server api version : 1.20.1
Transaction Digest: 4Wq1eySicgqYzCJxqhGrQH7eorhYG3MkXprxFvxuNLkp
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                   │
│ Gas Owner: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                │
│ Gas Budget: 5000000 MIST                                                                                     │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                                    │
│  │ Version: 80879224                                                                                         │
│  │ Digest: AhjW37GBFRNqqqQTRFdUgaSwb73b1TNVEDQjBGXfRU4                                                       │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xb703ab407d1c11f2421fededd187e292bd543e15ac4bcc263057c7bac5a72d03              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100"                                                                    │ │
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
│    t9/h8OWqPrXS/GuldWm5msphp6gv9UpLMsWFGht7Z175euKo7FSjhHz+YQvfQf6H2TYv5EqG8B1rjGS2lbswAg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4Wq1eySicgqYzCJxqhGrQH7eorhYG3MkXprxFvxuNLkp                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 345                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xaa0f50671aa4fcfe3ee86b7215d4633d4f898e276b287bcf9348f93933e1779e                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879225                                                                              │
│  │ Digest: 7eFgbLwFFCcFifs8ncHDTtwnxtyp1ZMeAnuUmZGTvtzH                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879225                                                                              │
│  │ Digest: FcVE2vNYZoKcre3sNghSxq5XHTdMcQ5NrdtbMjGKxkGP                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb703ab407d1c11f2421fededd187e292bd543e15ac4bcc263057c7bac5a72d03                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879225                                                                              │
│  │ Digest: 9L42CQE7z7h9aiLy5askF9HDasxwCmdicdMZXEZk3Eg                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879225                                                                              │
│  │ Digest: FcVE2vNYZoKcre3sNghSxq5XHTdMcQ5NrdtbMjGKxkGP                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4225600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2768832 MIST                                                                   │
│    Non-refundable Storage Fee: 27968 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
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
│  │ ObjectID: 0xaa0f50671aa4fcfe3ee86b7215d4633d4f898e276b287bcf9348f93933e1779e                                                     │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                       │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                    │
│  │ ObjectType: 0x2::coin::Coin<0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN>         │
│  │ Version: 80879225                                                                                                                │
│  │ Digest: 7eFgbLwFFCcFifs8ncHDTtwnxtyp1ZMeAnuUmZGTvtzH                                                                             │
│  └──                                                                                                                                │
│ Mutated Objects:                                                                                                                    │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                                                     │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                       │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                       │
│  │ Version: 80879225                                                                                                                │
│  │ Digest: FcVE2vNYZoKcre3sNghSxq5XHTdMcQ5NrdtbMjGKxkGP                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0xb703ab407d1c11f2421fededd187e292bd543e15ac4bcc263057c7bac5a72d03                                                     │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                                                       │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )                                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x6dc273473ccf56fcbe4960ff7aad8aec76d4e77c6dd94446b5603ba5bd2aa63::faucet_coin::FAUCET_COIN>  │
│  │ Version: 80879225                                                                                                                │
│  │ Digest: 9L42CQE7z7h9aiLy5askF9HDasxwCmdicdMZXEZk3Eg                                                                              │
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
│  │ Amount: 100                                                                                            │
│  └──                                                                                                      │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

