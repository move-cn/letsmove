# Task4

```bash
> sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task4
```


```bash
> sui client publish --gas-budget 50000000 --skip-dependency-verification

[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task4
Skipping dependency verification
Transaction Digest: 2jMiVHHfd4B17qEhSWG3iQ4HhonKDpTafYjDoy79rvL4
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                   │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                                    │
│  │ Version: 856                                                                                              │
│  │ Digest: B7WPp4dbUPfuozFfjbyFaE7rZYAA7ce7g1aNntWTZ7Ud                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc" │ │
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
│    kJ0PRDSYCNxwCtkp3GqT9X5GwpJP1IcO4Ym466Z9IVVDvGFJjZZvVUxZJeRHxWUXTbzqBudN9XYjfQV405pQDA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2jMiVHHfd4B17qEhSWG3iQ4HhonKDpTafYjDoy79rvL4                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 935                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8a17295a8265372d7cba6aaf6bbbb41a612735e36116ce037a65ee8c43dd8849                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 857                                                                                   │
│  │ Digest: CZJePAowrJKNd1HG5LYmPf3sVRYuhwJGCx4nJXJmaepv                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xea54f6bfedd4ab60938a0ddc134719f23f4cd7057f04161459965758f6feb9da                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: GCeGn6DvcvWF5ya2KGSEsDwnF13b3NwbsfhyNsicNg1k                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 857                                                                                   │
│  │ Digest: cGBvMyhYNJm7WExoP5iZEDj3f3skApUbrmgLrGYj8GD                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 857                                                                                   │
│  │ Digest: cGBvMyhYNJm7WExoP5iZEDj3f3skApUbrmgLrGYj8GD                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9849600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7Ukrc5GqdFqTA41wvWgreCdHn2vRLfgQ3YMFkdks72Vk                                                   │
│    9sYLffjQf6yqboha4GAktYxRLLiTFGecuxhzrLGCiFzB                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x8a17295a8265372d7cba6aaf6bbbb41a612735e36116ce037a65ee8c43dd8849                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                    │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 857                                                                                  │
│  │ Digest: CZJePAowrJKNd1HG5LYmPf3sVRYuhwJGCx4nJXJmaepv                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                    │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 857                                                                                  │
│  │ Digest: cGBvMyhYNJm7WExoP5iZEDj3f3skApUbrmgLrGYj8GD                                           │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xea54f6bfedd4ab60938a0ddc134719f23f4cd7057f04161459965758f6feb9da                 │
│  │ Version: 1                                                                                    │
│  │ Digest: GCeGn6DvcvWF5ya2KGSEsDwnF13b3NwbsfhyNsicNg1k                                          │
│  │ Modules: guess_game                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -9871480                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


```bash
> sui client call --function play --module guess_game --package 0xea54f6bfedd4ab60938a0ddc134719f23f4cd7057f04161459965758f6feb9da --args 1 0x6 --gas-budget 50000000

[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
Transaction Digest: 3fvhKKqUmhBpTuxWS4zXMmoYKxpmZEERC5Mb7iaaSGgR
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                      │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                   │
│ Gas Budget: 50000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                       │
│  │ Version: 857                                                                                 │
│  │ Digest: cGBvMyhYNJm7WExoP5iZEDj3f3skApUbrmgLrGYj8GD                                          │
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
│ │  │ Module:    guess_game                                                         │            │
│ │  │ Package:   0xea54f6bfedd4ab60938a0ddc134719f23f4cd7057f04161459965758f6feb9da │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    HcSPs6XrJoKlevPj5Kza4DvEAxy2G5u2bIQ66W4NFR1qrKtJrB84DIf6eC0OAQzMnZUgUcWIa2rabWahRe36Aw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3fvhKKqUmhBpTuxWS4zXMmoYKxpmZEERC5Mb7iaaSGgR                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 935                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481604                                                                                │
│  │ Digest: 91c2AAiB2eFJVH8Au25YYJwVZ3iWopEzN2HoVDASGTjc                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 481603                                                                                │
│  │ Digest: pzUj3i2wSufTwGMJHv99HS6TA82hZTieBRP6kWZ4nEb                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 481604                                                                                │
│  │ Digest: 91c2AAiB2eFJVH8Au25YYJwVZ3iWopEzN2HoVDASGTjc                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 988000 MIST                                                                      │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2jMiVHHfd4B17qEhSWG3iQ4HhonKDpTafYjDoy79rvL4                                                   │
│    8Qpbj6Qgr4oi539U9G5XvJN4NAzZqMCHiMass3HQHRc3                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                          │
│  │ EventID: 3fvhKKqUmhBpTuxWS4zXMmoYKxpmZEERC5Mb7iaaSGgR:0                                                    │
│  │ PackageID: 0xea54f6bfedd4ab60938a0ddc134719f23f4cd7057f04161459965758f6feb9da                              │
│  │ Transaction Module: guess_game                                                                             │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                 │
│  │ EventType: 0xea54f6bfedd4ab60938a0ddc134719f23f4cd7057f04161459965758f6feb9da::guess_game::GuessGameResult │
│  │ ParsedJSON:                                                                                                │
│  │   ┌─────────────┬───────────┐                                                                              │
│  │   │ game_number │ 5         │                                                                              │
│  │   ├─────────────┼───────────┤                                                                              │
│  │   │ output      │ You Lose! │                                                                              │
│  │   ├─────────────┼───────────┤                                                                              │
│  │   │ you_number  │ 1         │                                                                              │
│  │   └─────────────┴───────────┘                                                                              │
│  └──                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                    │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 481604                                                                               │
│  │ Digest: 91c2AAiB2eFJVH8Au25YYJwVZ3iWopEzN2HoVDASGTjc                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1009880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```