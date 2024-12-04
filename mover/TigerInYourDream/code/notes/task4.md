# Game

1. publish 

```rust
sui client publish --gas-budget 20000000 --skip-dependency-verification                                     │
```

1. output

```rust
Transaction Digest: FQxJhk4drs6xWFCHb8RzQ2w6dCrCQahZS3UW7RmaP5S1
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
│  │ Version: 80879233                                                                                         │
│  │ Digest: GAZs6HuTciYAUyxmeF9hVDEPWFpRv1BdZ8iNLW4knaK5                                                      │
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
│    4G0jl6G8izkcHgxJTLKy0qEFLL8V8MX6mHDTV8j9AZfEL7hYzmTqpjopaOAARItikekkcYCjxo8eYfIwrVqoCg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: FQxJhk4drs6xWFCHb8RzQ2w6dCrCQahZS3UW7RmaP5S1                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 346                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x560284e289f17ee7336c7d01916e0d91c2cc54951f4bb18c6f9d25028bdacd9c                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879234                                                                              │
│  │ Digest: 55KdtFrTL7JG8kHAMwjyFY5aA8tuRiEuzkdQajpeR68P                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6d899571c6497b7b91fe48d911305f09401a7db115f453345a97d3bd5bdaa319                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 9vEwSfR2FHdRuZgi22g1iy3nHYULiqurwN2VSDwN35Cd                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879234                                                                              │
│  │ Digest: HyPfSTweNU3strwdX7acTaPAe92i7Nfb99CPGThEVipx                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879234                                                                              │
│  │ Digest: HyPfSTweNU3strwdX7acTaPAe92i7Nfb99CPGThEVipx                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9743200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    7FtUuSqeZ9VRGbrMs38To5Qf4qd9nuVf43Xo4G6YL8Sz                                                   │
│    8ufrUyYLVSC9KLdfRJK9gtVW2b8nvnaBMUekfhq92vHH                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x560284e289f17ee7336c7d01916e0d91c2cc54951f4bb18c6f9d25028bdacd9c                  │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                    │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 80879234                                                                             │
│  │ Digest: 55KdtFrTL7JG8kHAMwjyFY5aA8tuRiEuzkdQajpeR68P                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                  │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                    │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 80879234                                                                             │
│  │ Digest: HyPfSTweNU3strwdX7acTaPAe92i7Nfb99CPGThEVipx                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x6d899571c6497b7b91fe48d911305f09401a7db115f453345a97d3bd5bdaa319                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 9vEwSfR2FHdRuZgi22g1iy3nHYULiqurwN2VSDwN35Cd                                          │
│  │ Modules: game                                                                                 │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -9515080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

1. play

```rust
sui client call --function play --module game --package 0x6d899571c6497b7b91fe48d911305f09401a7db115f453345a97d3bd5bdaa319 --args 1 0x6 --gas-budget 30000000

```

1. output

```rust
Transaction Digest: GGeBnJ1z13Q8FMw4EWWm6ZqbLzn2QC8qBLhQnUYRxtkt
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                      │
│ Gas Owner: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                   │
│ Gas Budget: 30000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                       │
│  │ Version: 80879234                                                                            │
│  │ Digest: HyPfSTweNU3strwdX7acTaPAe92i7Nfb99CPGThEVipx                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: u64, Value: "1"                                                         │ │
│ │ 1   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  play                                                               │            │
│ │  │ Module:    game                                                               │            │
│ │  │ Package:   0x6d899571c6497b7b91fe48d911305f09401a7db115f453345a97d3bd5bdaa319 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    9m4gbKied6iADhDFqSEtsxKuCrHClrAguzpBcq1WRCE3sXU+0tC2NQOstdm+vt4nmJJPVsfpsmTnHTgoVBWSAQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GGeBnJ1z13Q8FMw4EWWm6ZqbLzn2QC8qBLhQnUYRxtkt                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 346                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879235                                                                              │
│  │ Digest: 8YXmYoLuhXmZFZbngghuiYC7W56DWmi2jovb5vMAeUiJ                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 29618984                                                                              │
│  │ Digest: vXqb3M1ujvfG4Jc5ZpzzrbdMwJ6pJWY6x7W2nZdC3hH                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                         │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ Version: 80879235                                                                              │
│  │ Digest: 8YXmYoLuhXmZFZbngghuiYC7W56DWmi2jovb5vMAeUiJ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 988000 MIST                                                                      │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    FQxJhk4drs6xWFCHb8RzQ2w6dCrCQahZS3UW7RmaP5S1                                                   │
│    GRsTXjqRMa6FJquqEzGgcSYw6JyBeUYZxkLpPtVyUZSo                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                           │
├────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                               │
│  │ EventID: GGeBnJ1z13Q8FMw4EWWm6ZqbLzn2QC8qBLhQnUYRxtkt:0                                         │
│  │ PackageID: 0x6d899571c6497b7b91fe48d911305f09401a7db115f453345a97d3bd5bdaa319                   │
│  │ Transaction Module: game                                                                        │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                      │
│  │ EventType: 0x6d899571c6497b7b91fe48d911305f09401a7db115f453345a97d3bd5bdaa319::game::GameOutPut │
│  │ ParsedJSON:                                                                                     │
│  │   ┌─────────────┬─────────┐                                                                     │
│  │   │ game_number │ 3       │                                                                     │
│  │   ├─────────────┼─────────┤                                                                     │
│  │   │ output      │ you win │                                                                     │
│  │   ├─────────────┼─────────┤                                                                     │
│  │   │ you_number  │ 1       │                                                                     │
│  │   └─────────────┴─────────┘                                                                     │
│  └──                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x8e20323f9d405ab4d1169069984d49d9aebe9b971f1a02706cb2031ea40006da                  │
│  │ Sender: 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c                    │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 80879235                                                                             │
│  │ Digest: 8YXmYoLuhXmZFZbngghuiYC7W56DWmi2jovb5vMAeUiJ                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x0a5c1673fb9727f04df3fb382e1175a4d003c056167d5ec00d76a41c007a078c )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -759880                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```