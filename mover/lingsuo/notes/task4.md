# Game
## 部署合约
[warn] Client/Server api version mismatch, client api version : 1.21.0, server api version : 1.21.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task_four
Successfully verified dependencies on-chain against source.
Transaction Digest: EJXM2JK6W78ZyfvKzsv1WLbehq3sUzn7ZKCFa8LVjYLq
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2                                   │
│ Gas Owner: 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xb36adea9cc7e8cc3d687286bc48a1a2af6404b675611aa49bd6d4a8439e70268                                    │
│  │ Version: 854793                                                                                           │
│  │ Digest: 4TdhC7hqp4FJov2wZ74CDeaJbZ2ELnRSt7mzYFMGHiKj                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2" │ │
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
│    lUxRRanUlHBmwg2xHXvEzIIWGkPU6HvLnG6qLY6TQkJRvsTB5iCtwtGRoXKvZYGjycYIX+eNIQ1yg/iJ4P++BA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EJXM2JK6W78ZyfvKzsv1WLbehq3sUzn7ZKCFa8LVjYLq                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 322                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x84b523fe51f139da4de3e94601917af6b80f6fefdccf3a73c6c3a3a5630e7b4c                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: EjnAFKbRLeWo7ZQWZ4DMgAKH7JLiX49zA4Eb7ANEmzD7                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb20306bb3a2e365304adbf5051a051c6e081c1cf30c032d3d6940c10705e7e8b                         │
│  │ Owner: Account Address ( 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2 )  │
│  │ Version: 854794                                                                                │
│  │ Digest: E2fkUsJuYBRtHgKp5YT1F4UyVpok25iiNqJhYpfXMyya                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb36adea9cc7e8cc3d687286bc48a1a2af6404b675611aa49bd6d4a8439e70268                         │
│  │ Owner: Account Address ( 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2 )  │
│  │ Version: 854794                                                                                │
│  │ Digest: 8yHoqoooawcZbBi3MuuMCGxBDWamFmL8pfPqn7K6Z1ia                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb36adea9cc7e8cc3d687286bc48a1a2af6404b675611aa49bd6d4a8439e70268                         │
│  │ Owner: Account Address ( 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2 )  │
│  │ Version: 854794                                                                                │
│  │ Digest: 8yHoqoooawcZbBi3MuuMCGxBDWamFmL8pfPqn7K6Z1ia                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8922400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    9eWbKJUo27zLyM9uwmMbJFnvcr9gk631gwdw1ybHusHV                                                   │
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
│  │ ObjectID: 0xb20306bb3a2e365304adbf5051a051c6e081c1cf30c032d3d6940c10705e7e8b                  │
│  │ Sender: 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2                    │
│  │ Owner: Account Address ( 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 854794                                                                               │
│  │ Digest: E2fkUsJuYBRtHgKp5YT1F4UyVpok25iiNqJhYpfXMyya                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xb36adea9cc7e8cc3d687286bc48a1a2af6404b675611aa49bd6d4a8439e70268                  │
│  │ Sender: 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2                    │
│  │ Owner: Account Address ( 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 854794                                                                               │
│  │ Digest: 8yHoqoooawcZbBi3MuuMCGxBDWamFmL8pfPqn7K6Z1ia                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x84b523fe51f139da4de3e94601917af6b80f6fefdccf3a73c6c3a3a5630e7b4c                 │
│  │ Version: 1                                                                                    │
│  │ Digest: EjnAFKbRLeWo7ZQWZ4DMgAKH7JLiX49zA4Eb7ANEmzD7                                          │
│  │ Modules: mygame                                                                               │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8944280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

## 运行play
[warn] Client/Server api version mismatch, client api version : 1.21.0, server api version : 1.21.1
Transaction Digest: 21NcUT46CLDbjdLtuHUnbCwmvuUj1iqpLgJHqqqSUnsM
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2                      │
│ Gas Owner: 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2                   │
│ Gas Budget: 90000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xb36adea9cc7e8cc3d687286bc48a1a2af6404b675611aa49bd6d4a8439e70268                       │
│  │ Version: 854794                                                                              │
│  │ Digest: 8yHoqoooawcZbBi3MuuMCGxBDWamFmL8pfPqn7K6Z1ia                                         │
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
│ │  │ Module:    mygame                                                             │            │
│ │  │ Package:   0x84b523fe51f139da4de3e94601917af6b80f6fefdccf3a73c6c3a3a5630e7b4c │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    MaIWF1NR7ZU1Fc4dmmiMk3btpw8G5JREND4lwHvWSEv32RB5u0WyQslxiFqM4m0uLpgVQcNIzbqoGRwLRoAxCQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 21NcUT46CLDbjdLtuHUnbCwmvuUj1iqpLgJHqqqSUnsM                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 322                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb36adea9cc7e8cc3d687286bc48a1a2af6404b675611aa49bd6d4a8439e70268                         │
│  │ Owner: Account Address ( 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2 )  │
│  │ Version: 27682430                                                                              │
│  │ Digest: 4fDfzKo5VKYeKaU2QKxcX2EKTtuz3TXPmkvZLm29WxE6                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 27682429                                                                              │
│  │ Digest: 9MM1BKwaxz2GE39d4LUcpJBsMw6B5n2CSxkFGJx82GuZ                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb36adea9cc7e8cc3d687286bc48a1a2af6404b675611aa49bd6d4a8439e70268                         │
│  │ Owner: Account Address ( 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2 )  │
│  │ Version: 27682430                                                                              │
│  │ Digest: 4fDfzKo5VKYeKaU2QKxcX2EKTtuz3TXPmkvZLm29WxE6                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 988000 MIST                                                                      │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    EJXM2JK6W78ZyfvKzsv1WLbehq3sUzn7ZKCFa8LVjYLq                                                   │
│    FrhRnDFwapdNiBpp7JT258MrrmqQtCfbnSYz5iQdozY3                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                 │
│  │ EventID: 21NcUT46CLDbjdLtuHUnbCwmvuUj1iqpLgJHqqqSUnsM:0                                           │
│  │ PackageID: 0x84b523fe51f139da4de3e94601917af6b80f6fefdccf3a73c6c3a3a5630e7b4c                     │
│  │ Transaction Module: mygame                                                                        │
│  │ Sender: 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2                        │
│  │ EventType: 0x84b523fe51f139da4de3e94601917af6b80f6fefdccf3a73c6c3a3a5630e7b4c::mygame::GameResult │
│  │ ParsedJSON:                                                                                       │
│  │   ┌─────────────────┬──────────┐                                                                  │
│  │   │ computer_number │ 8        │                                                                  │
│  │   ├─────────────────┼──────────┤                                                                  │
│  │   │ result          │ you lose │                                                                  │
│  │   ├─────────────────┼──────────┤                                                                  │
│  │   │ your_number     │ 1        │                                                                  │
│  │   └─────────────────┴──────────┘                                                                  │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xb36adea9cc7e8cc3d687286bc48a1a2af6404b675611aa49bd6d4a8439e70268                  │
│  │ Sender: 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2                    │
│  │ Owner: Account Address ( 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 27682430                                                                             │
│  │ Digest: 4fDfzKo5VKYeKaU2QKxcX2EKTtuz3TXPmkvZLm29WxE6                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf893b88a3739085671a5f92d2662e3af61e7ed03c6ac3e2960cf9c226a80dda2 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1009880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
