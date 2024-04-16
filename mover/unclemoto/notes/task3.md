# Task3

## Deploy

```rust
sui client publish --gas-budget 50000000  --skip-fetch-latest-git-deps
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3
Successfully verified dependencies on-chain against source.
Transaction Digest: 7SETPfCZaPvcACXrS1MV1fDK2423jnA54EQ2wiktBJy9
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                   │
│ Gas Owner: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                                    │
│  │ Version: 88253681                                                                                         │
│  │ Digest: A49HskeEeXNwvg5uEnHhzBW72ZrJrt7roNugPs6rBAXJ                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6" │ │
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
│    4ecXAJkYFPSvxY+XW8a+lNubqsDRN+90JEMIOkM10JN/fUiZc3JNJUBxg3g84Och48at/JZh0oWxIiAQV0WBDg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 7SETPfCZaPvcACXrS1MV1fDK2423jnA54EQ2wiktBJy9                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 366                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x92ce5972f5016fc773d63210a6282f25d3a2a9b561999922214537b907f45ec2                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253682                                                                              │
│  │ Digest: EwAaUrFizqDH9J1xEMqZsmqJDHJCwmMTspwRzqKDGrKu                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd6a1bcd174e398c8316038e5e2cd4b2c6f7629bc6fd9a3162475541f1542709b                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253682                                                                              │
│  │ Digest: FpeULVJNLkCaNFgeqKuvcptRW4NTTDegzkDhreYPJmKA                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf3825d52435df55d0dee70fb7390947e1df136c839e5d891e2687eb32193dc86                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253682                                                                              │
│  │ Digest: 3v5uPYqbwALD8hFb3xzX9J1574JdSZwQTw9eeEpYZDv4                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xfd11beecf23ee5c88f2ab2755aa56c49a13dad33ccffccfc52aefaac6bdde8f8                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 4HzeD4cBPgN11D1xNebYoLNYwRS6NBztWGZBfFqJ5VDX                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253682                                                                              │
│  │ Digest: J6ma6jgN5tm1f2QC7LisCHFfjjasHU9naMERUQn6tMDg                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253682                                                                              │
│  │ Digest: J6ma6jgN5tm1f2QC7LisCHFfjjasHU9naMERUQn6tMDg                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 15564800 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3RwhtKQ3NFhH4aRn9aZr2uYghJiZh3pkY9GJrwrZSSKb                                                   │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                         │
│  │ EventID: 7SETPfCZaPvcACXrS1MV1fDK2423jnA54EQ2wiktBJy9:0                                                                   │
│  │ PackageID: 0xfd11beecf23ee5c88f2ab2755aa56c49a13dad33ccffccfc52aefaac6bdde8f8                                             │
│  │ Transaction Module: mynft                                                                                                 │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                                │
│  │ EventType: 0x2::display::DisplayCreated<0xfd11beecf23ee5c88f2ab2755aa56c49a13dad33ccffccfc52aefaac6bdde8f8::mynft::Zeroc> │
│  │ ParsedJSON:                                                                                                               │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                             │
│  │   │ id │ 0xf3825d52435df55d0dee70fb7390947e1df136c839e5d891e2687eb32193dc86 │                                             │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                             │
│  └──                                                                                                                         │
│  ┌──                                                                                                                         │
│  │ EventID: 7SETPfCZaPvcACXrS1MV1fDK2423jnA54EQ2wiktBJy9:1                                                                   │
│  │ PackageID: 0xfd11beecf23ee5c88f2ab2755aa56c49a13dad33ccffccfc52aefaac6bdde8f8                                             │
│  │ Transaction Module: mynft                                                                                                 │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                                │
│  │ EventType: 0x2::display::VersionUpdated<0xfd11beecf23ee5c88f2ab2755aa56c49a13dad33ccffccfc52aefaac6bdde8f8::mynft::Zeroc> │
│  │ ParsedJSON:                                                                                                               │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                        │
│  │   │ fields  │ contents │ key   │ name                                            │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ value │ unclemoto                                       │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ key   │ description                                     │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ value │ A sample NFT for unclemoto                      │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ key   │ image_url                                       │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ value │ https://github.com/unclemoto.png                │                                        │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                        │
│  │   │ id      │ 0xf3825d52435df55d0dee70fb7390947e1df136c839e5d891e2687eb32193dc86 │                                        │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                        │
│  │   │ version │ 1                                                                  │                                        │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                        │
│  └──                                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                          │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                        │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0x92ce5972f5016fc773d63210a6282f25d3a2a9b561999922214537b907f45ec2                                         │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                           │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )                        │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                 │
│  │ Version: 88253682                                                                                                    │
│  │ Digest: EwAaUrFizqDH9J1xEMqZsmqJDHJCwmMTspwRzqKDGrKu                                                                 │
│  └──                                                                                                                    │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0xd6a1bcd174e398c8316038e5e2cd4b2c6f7629bc6fd9a3162475541f1542709b                                         │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                           │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )                        │
│  │ ObjectType: 0x2::package::Publisher                                                                                  │
│  │ Version: 88253682                                                                                                    │
│  │ Digest: FpeULVJNLkCaNFgeqKuvcptRW4NTTDegzkDhreYPJmKA                                                                 │
│  └──                                                                                                                    │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0xf3825d52435df55d0dee70fb7390947e1df136c839e5d891e2687eb32193dc86                                         │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                           │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )                        │
│  │ ObjectType: 0x2::display::Display<0xfd11beecf23ee5c88f2ab2755aa56c49a13dad33ccffccfc52aefaac6bdde8f8::mynft::Zeroc>  │
│  │ Version: 88253682                                                                                                    │
│  │ Digest: 3v5uPYqbwALD8hFb3xzX9J1574JdSZwQTw9eeEpYZDv4                                                                 │
│  └──                                                                                                                    │
│ Mutated Objects:                                                                                                        │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                                         │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                           │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )                        │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                           │
│  │ Version: 88253682                                                                                                    │
│  │ Digest: J6ma6jgN5tm1f2QC7LisCHFfjjasHU9naMERUQn6tMDg                                                                 │
│  └──                                                                                                                    │
│ Published Objects:                                                                                                      │
│  ┌──                                                                                                                    │
│  │ PackageID: 0xfd11beecf23ee5c88f2ab2755aa56c49a13dad33ccffccfc52aefaac6bdde8f8                                        │
│  │ Version: 1                                                                                                           │
│  │ Digest: 4HzeD4cBPgN11D1xNebYoLNYwRS6NBztWGZBfFqJ5VDX                                                                 │
│  │ Modules: mynft                                                                                                       │
│  └──                                                                                                                    │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -15336680                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
## transfer

```rust
sui client call --package 0xfd11beecf23ee5c88f2ab2755aa56c49a13dad33ccffccfc52aefaac6bdde8f8 --module mynft --function mint --args "uncleMOTO NFT" "Test" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000
Transaction Digest: F7xyF9rjEwcEUrfHNQwrPeF7fVngiUJD3vAcWThZJ6Gr
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                   │
│ Gas Owner: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                                    │
│  │ Version: 88253682                                                                                         │
│  │ Digest: J6ma6jgN5tm1f2QC7LisCHFfjjasHU9naMERUQn6tMDg                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "uncleMOTO NFT"                                                   │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "Test"                                                            │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mynft                                                              │                         │
│ │  │ Package:   0xfd11beecf23ee5c88f2ab2755aa56c49a13dad33ccffccfc52aefaac6bdde8f8 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    pFl2NuExeD/fKCeYH8RYZwQbJPNt9Eyf4bFR5wGrRMbEwTEyIc0fpqvQkRZ63ma47RDxevvwwCAbi1qXOT7SAA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: F7xyF9rjEwcEUrfHNQwrPeF7fVngiUJD3vAcWThZJ6Gr                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 366                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x675e09cb0f5eda70bba9c50cb9fbfa3439afd33c5ed6f817d448df5573732a65                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 88253683                                                                              │
│  │ Digest: HfFajF36cZtBpdnXnQpGitGdWamdkCWHBmASU7WxCduJ                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253683                                                                              │
│  │ Digest: BKdbYFr75oZ4zE8idRNGKa7MR9JjT3BZmBMFMZMPnTNM                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                         │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ Version: 88253683                                                                              │
│  │ Digest: BKdbYFr75oZ4zE8idRNGKa7MR9JjT3BZmBMFMZMPnTNM                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2401600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7SETPfCZaPvcACXrS1MV1fDK2423jnA54EQ2wiktBJy9                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x675e09cb0f5eda70bba9c50cb9fbfa3439afd33c5ed6f817d448df5573732a65                  │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                    │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 ) │
│  │ ObjectType: 0xfd11beecf23ee5c88f2ab2755aa56c49a13dad33ccffccfc52aefaac6bdde8f8::mynft::Zeroc  │
│  │ Version: 88253683                                                                             │
│  │ Digest: HfFajF36cZtBpdnXnQpGitGdWamdkCWHBmASU7WxCduJ                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xf32211ed285ef4a983cdb2770a28e43565c97ef878749ae603874c3681f48d0c                  │
│  │ Sender: 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6                    │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 88253683                                                                             │
│  │ Digest: BKdbYFr75oZ4zE8idRNGKa7MR9JjT3BZmBMFMZMPnTNM                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x93058db307665cff1626f0203db9f92b1b8d5620580446610821c76907e008c6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2173480                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```
