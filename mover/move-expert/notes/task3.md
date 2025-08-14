# task 3

build：
```bash
❯ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3
```

发布合约：
```bash
❯ sui client publish --gas-budget 500000000
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.22.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3
Successfully verified dependencies on-chain against source.
Transaction Digest: DviumEUP89j6kzrdgU16Wez6DjR7jLxeshCV4v7N2naD
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                   │
│ Gas Owner: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                │
│ Gas Budget: 500000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                                    │
│  │ Version: 13315003                                                                                         │
│  │ Digest: HwW7eUoFjpsmM54Z5DdLy9w5NpeKyaW58AM1Pfzk7qzr                                                      │
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
│    OjfkdlSJAuFapQWnnflAQbkC3GSiTEFWlPm7k/9VkCmja6WLE3IZna/ghPOk5tSefRd1sjoYYYPTS0llkoSiDQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DviumEUP89j6kzrdgU16Wez6DjR7jLxeshCV4v7N2naD                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 335                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x395367486abd873c94f1b81131e7228c50d2aff21b265cf1dc971f160d44f73d                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 13315004                                                                              │
│  │ Digest: BKAM2vZHXTf6YdCnKkHc8EN8QVMgGCFL8Q4cGvw3Toqx                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xfec06346663bb5bbf54d06e7a720fabb3260596c7d5cdd8e01bffb5597d01353                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 37PAZUd6zpKraAdZ7ui28E3J9XxsDfxUUgvi6n6GyGkg                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 13315004                                                                              │
│  │ Digest: EuoygAGxztsS6Q5RSAgUcMD6otziKRrqv5j4N381DYap                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 13315004                                                                              │
│  │ Digest: EuoygAGxztsS6Q5RSAgUcMD6otziKRrqv5j4N381DYap                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 10138400 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    8atUs1WnWufu2oUVXbkEkyn7AT8VoZfTZdzWvYkZMhL9                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x395367486abd873c94f1b81131e7228c50d2aff21b265cf1dc971f160d44f73d                  │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                    │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 13315004                                                                             │
│  │ Digest: BKAM2vZHXTf6YdCnKkHc8EN8QVMgGCFL8Q4cGvw3Toqx                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                  │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                    │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 13315004                                                                             │
│  │ Digest: EuoygAGxztsS6Q5RSAgUcMD6otziKRrqv5j4N381DYap                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xfec06346663bb5bbf54d06e7a720fabb3260596c7d5cdd8e01bffb5597d01353                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 37PAZUd6zpKraAdZ7ui28E3J9XxsDfxUUgvi6n6GyGkg                                          │
│  │ Modules: move410nft                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -10160280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

mint：
```bash
❯ sui client call --package 0xfec06346663bb5bbf54d06e7a720fabb3260596c7d5cdd8e01bffb5597d01353 --module move410nft --function mint --args "alex nft" "desc: alex live photo" "https://src.surf.tech/img/ThinkSui-h.png" --gas-budget 50000000
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.22.0
Transaction Digest: Dnx5HXbx3nzppwqm93eHgCEeDuUR4Sv1d8JhA4nqqBoM
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                  │
│ Gas Owner: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc               │
│ Gas Budget: 50000000 MIST                                                                   │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                   │
│  │ Version: 13315004                                                                        │
│  │ Digest: EuoygAGxztsS6Q5RSAgUcMD6otziKRrqv5j4N381DYap                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│ ╭───────────────────────────────────────────────────────────────────────────────────╮       │
│ │ Input Objects                                                                     │       │
│ ├───────────────────────────────────────────────────────────────────────────────────┤       │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "alex nft"                                 │       │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "desc: alex live photo"                    │       │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "https://src.surf.tech/img/ThinkSui-h.png" │       │
│ ╰───────────────────────────────────────────────────────────────────────────────────╯       │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  mint                                                               │        │
│ │  │ Module:    move410nft                                                         │        │
│ │  │ Package:   0xfec06346663bb5bbf54d06e7a720fabb3260596c7d5cdd8e01bffb5597d01353 │        │
│ │  │ Arguments:                                                                    │        │
│ │  │   Input  0                                                                    │        │
│ │  │   Input  1                                                                    │        │
│ │  │   Input  2                                                                    │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    veRW0w3iqyqXG5Z8gn6X4m8Zw2fl4lc0DGo81h7lUhEHljF0zeq9q1ydysQtYbvkDZLU1RIBewD37y7Z4QGJCA== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Dnx5HXbx3nzppwqm93eHgCEeDuUR4Sv1d8JhA4nqqBoM                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 335                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5f8f99aa91b1877d8f3c97092f5d9ce97d42bb9081f2dd807a94a7cb2b64f8b5                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 13315005                                                                              │
│  │ Digest: 7sbdMLSZ7AcrcJdh4eTjeSjFH9geUBxo2bM82Tp9fR3A                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 13315005                                                                              │
│  │ Digest: DQVQ2a5oU9JF8nmkjSyjk2Xakc77TdNqshE29zfbZy4p                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 13315005                                                                              │
│  │ Digest: DQVQ2a5oU9JF8nmkjSyjk2Xakc77TdNqshE29zfbZy4p                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2880400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    DviumEUP89j6kzrdgU16Wez6DjR7jLxeshCV4v7N2naD                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                              │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                  │
│  │ EventID: Dnx5HXbx3nzppwqm93eHgCEeDuUR4Sv1d8JhA4nqqBoM:0                                            │
│  │ PackageID: 0xfec06346663bb5bbf54d06e7a720fabb3260596c7d5cdd8e01bffb5597d01353                      │
│  │ Transaction Module: move410nft                                                                     │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                         │
│  │ EventType: 0xfec06346663bb5bbf54d06e7a720fabb3260596c7d5cdd8e01bffb5597d01353::move410nft::NFTMint │
│  │ ParsedJSON:                                                                                        │
│  │   ┌───────────┬────────────────────────────────────────────────────────────────────┐               │
│  │   │ creater   │ 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc │               │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤               │
│  │   │ name      │ alex nft                                                           │               │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤               │
│  │   │ object_id │ 0x5f8f99aa91b1877d8f3c97092f5d9ce97d42bb9081f2dd807a94a7cb2b64f8b5 │               │
│  │   └───────────┴────────────────────────────────────────────────────────────────────┘               │
│  └──                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                           │
│  ┌──                                                                                                       │
│  │ ObjectID: 0x5f8f99aa91b1877d8f3c97092f5d9ce97d42bb9081f2dd807a94a7cb2b64f8b5                            │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                              │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )           │
│  │ ObjectType: 0xfec06346663bb5bbf54d06e7a720fabb3260596c7d5cdd8e01bffb5597d01353::move410nft::Move410NFT  │
│  │ Version: 13315005                                                                                       │
│  │ Digest: 7sbdMLSZ7AcrcJdh4eTjeSjFH9geUBxo2bM82Tp9fR3A                                                    │
│  └──                                                                                                       │
│ Mutated Objects:                                                                                           │
│  ┌──                                                                                                       │
│  │ ObjectID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                            │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                              │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                              │
│  │ Version: 13315005                                                                                       │
│  │ Digest: DQVQ2a5oU9JF8nmkjSyjk2Xakc77TdNqshE29zfbZy4p                                                    │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2902280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


transfer
```bash
❯ sui client call --package 0xfec06346663bb5bbf54d06e7a720fabb3260596c7d5cdd8e01bffb5597d01353 --module move410nft --function transfer --args 0xc235981c9b3f4927bd2f5ec004c6bdf870783c40494e9e0e84e2b273884cc149 0x5f8f99aa91b1877d8f3c97092f5d9ce97d42bb9081f2dd807a94a7cb2b64f8b5 --gas-budget 50000000
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.22.0
Transaction Digest: ZZvw4dHhELcF5uucGHsF7EzP7x82XDydTUVYCQ7EMDM
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
│  │ Version: 13315005                                                                                         │
│  │ Digest: DQVQ2a5oU9JF8nmkjSyjk2Xakc77TdNqshE29zfbZy4p                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xc235981c9b3f4927bd2f5ec004c6bdf870783c40494e9e0e84e2b273884cc149" │ │
│ │ 1   Imm/Owned Object ID: 0x5f8f99aa91b1877d8f3c97092f5d9ce97d42bb9081f2dd807a94a7cb2b64f8b5              │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  transfer                                                           │                         │
│ │  │ Module:    move410nft                                                         │                         │
│ │  │ Package:   0xfec06346663bb5bbf54d06e7a720fabb3260596c7d5cdd8e01bffb5597d01353 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    7TW31ywkqgaIxTuMzxVl/ZEpr4Ky9jc1MDNroptDiGTQaEXIVzQSyx3+NNDZWv7CEKIqC8gf0UE/L/4FILxYCA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: ZZvw4dHhELcF5uucGHsF7EzP7x82XDydTUVYCQ7EMDM                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 335                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 13315006                                                                              │
│  │ Digest: 8iiuYz5jHTxrmyJTDmqZ68BTB3HMmjLgLSEjXzetZ9tK                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5f8f99aa91b1877d8f3c97092f5d9ce97d42bb9081f2dd807a94a7cb2b64f8b5                         │
│  │ Owner: Account Address ( 0xc235981c9b3f4927bd2f5ec004c6bdf870783c40494e9e0e84e2b273884cc149 )  │
│  │ Version: 13315006                                                                              │
│  │ Digest: 6m6nALgruG1CKCT4zZWcyMKp2YXzSqirV9QCvXgrtxSU                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 13315006                                                                              │
│  │ Digest: 8iiuYz5jHTxrmyJTDmqZ68BTB3HMmjLgLSEjXzetZ9tK                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2880400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2851596 MIST                                                                   │
│    Non-refundable Storage Fee: 28804 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    Dnx5HXbx3nzppwqm93eHgCEeDuUR4Sv1d8JhA4nqqBoM                                                   │
│    DviumEUP89j6kzrdgU16Wez6DjR7jLxeshCV4v7N2naD                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                           │
│  ┌──                                                                                                       │
│  │ ObjectID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                            │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                              │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                              │
│  │ Version: 13315006                                                                                       │
│  │ Digest: 8iiuYz5jHTxrmyJTDmqZ68BTB3HMmjLgLSEjXzetZ9tK                                                    │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ ObjectID: 0x5f8f99aa91b1877d8f3c97092f5d9ce97d42bb9081f2dd807a94a7cb2b64f8b5                            │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                              │
│  │ Owner: Account Address ( 0xc235981c9b3f4927bd2f5ec004c6bdf870783c40494e9e0e84e2b273884cc149 )           │
│  │ ObjectType: 0xfec06346663bb5bbf54d06e7a720fabb3260596c7d5cdd8e01bffb5597d01353::move410nft::Move410NFT  │
│  │ Version: 13315006                                                                                       │
│  │ Digest: 6m6nALgruG1CKCT4zZWcyMKp2YXzSqirV9QCvXgrtxSU                                                    │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1028804                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
