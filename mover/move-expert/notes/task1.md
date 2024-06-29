# task 1

build：
```bash
❯ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
```

发布合约：
```bash
❯ sui client publish --gas-budget 50000000
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.22.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
Successfully verified dependencies on-chain against source.
Transaction Digest: CY8cdzdakfjJnx4V1aHnzgbAj8rALZbAEUWMmq6745Ya
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                   │
│ Gas Owner: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                                    │
│  │ Version: 13314983                                                                                         │
│  │ Digest: H6PfHWXhrrTXoQBhqe2fEyu3XzED4vCU6JgdvXd59XZa                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc" │ │
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
│    GSVvlrj+V7VWS44tYALECNcrJoe3wg7pX7D4kWohvdrzTbKmWqnL/3ScQxV3dQRhn3REJ2enA5pmCriSRh5jDw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: CY8cdzdakfjJnx4V1aHnzgbAj8rALZbAEUWMmq6745Ya                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 334                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb4623cbfdecbae53812901fa0273b6b5d86066db8492f932ea439868def85026                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 13314984                                                                              │
│  │ Digest: 8CVZ1iLgubnr6n8L479fJuWSgMZ3UjFj8pLNSY91WMeB                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe5ef33a2f877b7bb5a19c448649f5547284f2bcc33126f952f7ed6e7fb36b996                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: DtvDrPF4bSDxqFnt4Np6SHtiwWaNWmYvrNcUH6wSX3g6                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 13314984                                                                              │
│  │ Digest: 96tJi6Ejc9kWyZyDZMuFqFtt6dbwUEQYvdErG6ixtWRZ                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 13314984                                                                              │
│  │ Digest: 96tJi6Ejc9kWyZyDZMuFqFtt6dbwUEQYvdErG6ixtWRZ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7904000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    FUQfZqDySyMFQGsuK7Nrqy3zxiFf1mJFjJraWjkm6bPe                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xb4623cbfdecbae53812901fa0273b6b5d86066db8492f932ea439868def85026                  │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                    │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 13314984                                                                             │
│  │ Digest: 8CVZ1iLgubnr6n8L479fJuWSgMZ3UjFj8pLNSY91WMeB                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                  │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                    │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 13314984                                                                             │
│  │ Digest: 96tJi6Ejc9kWyZyDZMuFqFtt6dbwUEQYvdErG6ixtWRZ                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xe5ef33a2f877b7bb5a19c448649f5547284f2bcc33126f952f7ed6e7fb36b996                 │
│  │ Version: 1                                                                                    │
│  │ Digest: DtvDrPF4bSDxqFnt4Np6SHtiwWaNWmYvrNcUH6wSX3g6                                          │
│  │ Modules: hello_word                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7925880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

调用合约函数：
```bash
❯ sui client call --package 0xe5ef33a2f877b7bb5a19c448649f5547284f2bcc33126f952f7ed6e7fb36b996 --module hello_word --function mint 0
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.22.0
Transaction Digest: HAXoyWTucVwFtmysiXRoDfU8ErLsvrqMn7FKA24KUiqa
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                  │
│ Gas Owner: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc               │
│ Gas Budget: 1000000000 MIST                                                                 │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                   │
│  │ Version: 13314984                                                                        │
│  │ Digest: 96tJi6Ejc9kWyZyDZMuFqFtt6dbwUEQYvdErG6ixtWRZ                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│   No input objects for this transaction                                                     │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  mint                                                               │        │
│ │  │ Module:    hello_word                                                         │        │
│ │  │ Package:   0xe5ef33a2f877b7bb5a19c448649f5547284f2bcc33126f952f7ed6e7fb36b996 │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    GLmgS8j9PozGp7XFrYO9xxSNfcJY4kb1zQu5jAbPqJ6oTQuBT6yxRERrH9p5ccBYQN6VVfZpo1nH4SxHuDiHDA== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HAXoyWTucVwFtmysiXRoDfU8ErLsvrqMn7FKA24KUiqa                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 334                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xcb3f62657a222d3744c49baa4d25d92530a3acf1f942de427f095f554d00310e                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 13314985                                                                              │
│  │ Digest: 4SvNFjgEtqwS6eExA3na2oNAiHSP3PHPXFdS27Aj4AUz                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 13314985                                                                              │
│  │ Digest: 5RcFqa71qNd455fJdPzAwca7aWC2XrghHoWGG2GTTvnF                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 13314985                                                                              │
│  │ Digest: 5RcFqa71qNd455fJdPzAwca7aWC2XrghHoWGG2GTTvnF                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2477600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    CY8cdzdakfjJnx4V1aHnzgbAj8rALZbAEUWMmq6745Ya                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                 │
│  ┌──                                                                                                             │
│  │ ObjectID: 0xcb3f62657a222d3744c49baa4d25d92530a3acf1f942de427f095f554d00310e                                  │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                    │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                 │
│  │ ObjectType: 0xe5ef33a2f877b7bb5a19c448649f5547284f2bcc33126f952f7ed6e7fb36b996::hello_word::HelloWorldObject  │
│  │ Version: 13314985                                                                                             │
│  │ Digest: 4SvNFjgEtqwS6eExA3na2oNAiHSP3PHPXFdS27Aj4AUz                                                          │
│  └──                                                                                                             │
│ Mutated Objects:                                                                                                 │
│  ┌──                                                                                                             │
│  │ ObjectID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                                  │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                    │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                 │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                    │
│  │ Version: 13314985                                                                                             │
│  │ Digest: 5RcFqa71qNd455fJdPzAwca7aWC2XrghHoWGG2GTTvnF                                                          │
│  └──                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2499480                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
