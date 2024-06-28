# task 5

build:
```bash
❯ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task5
```

发布合约:
```bash
❯ sui client publish --gas-budget 5000000000
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.22.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task5
Successfully verified dependencies on-chain against source.
Transaction Digest: wtcEp5Qp9Vvz1N1wMFPWHw94wcrmbpoQoXeuvTLBbS8
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                   │
│ Gas Owner: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                │
│ Gas Budget: 1000000000 MIST                                                                                  │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                                    │
│  │ Version: 29277192                                                                                         │
│  │ Digest: BivS93fpoepX1UQW8LuQ7Rk4WuAEYWmMLvCpqWd1bxTs                                                      │
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
│    3vDrI1lQjdmDswja75Mjzg/PUFyt75pLnyTqTm4lj1pClPPtpi7E3d8ul6gQ5p+Qyxm9HZQfFZKNOuYYWDZRBw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: wtcEp5Qp9Vvz1N1wMFPWHw94wcrmbpoQoXeuvTLBbS8                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 342                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 62JNd4e4tmEUMspHHjMkGmeXsphXw8MqGoQrTqHueX1p                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x77fcc09d3ecd00ef0a67c5b78ac8c16027f3c28764c30c9f6413cd1750350935                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277193                                                                              │
│  │ Digest: ChVDmZse7Ry2PHQRsCcyc5jP1dYe4HnX97WCLYpSMjBM                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb6bba70e5cdcbb658c6854767927e5f4d6e8cb0de470dcc498478e4d88e6a0b4                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 29277193                                                                              │
│  │ Digest: FTpPyeLAfz1453YRLo9aDhAxUb2YXeTeMpriouuhrsr6                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277193                                                                              │
│  │ Digest: GMRv3tWk5nAeHfCesGKj2gTx8dvneE35F8veBqmvaCiN                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277193                                                                              │
│  │ Digest: GMRv3tWk5nAeHfCesGKj2gTx8dvneE35F8veBqmvaCiN                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 20056400 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    E5WuJBxYLDDiwMVGyUfzznpyP9Q14QeFAKcnnHzdNp6Q                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                            │
│  ┌──                                                                                                        │
│  │ ObjectID: 0x77fcc09d3ecd00ef0a67c5b78ac8c16027f3c28764c30c9f6413cd1750350935                             │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                               │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )            │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                     │
│  │ Version: 29277193                                                                                        │
│  │ Digest: ChVDmZse7Ry2PHQRsCcyc5jP1dYe4HnX97WCLYpSMjBM                                                     │
│  └──                                                                                                        │
│  ┌──                                                                                                        │
│  │ ObjectID: 0xb6bba70e5cdcbb658c6854767927e5f4d6e8cb0de470dcc498478e4d88e6a0b4                             │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                               │
│  │ Owner: Shared                                                                                            │
│  │ ObjectType: 0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557::swap_moveexpert::Pocket  │
│  │ Version: 29277193                                                                                        │
│  │ Digest: FTpPyeLAfz1453YRLo9aDhAxUb2YXeTeMpriouuhrsr6                                                     │
│  └──                                                                                                        │
│ Mutated Objects:                                                                                            │
│  ┌──                                                                                                        │
│  │ ObjectID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                             │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                               │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                               │
│  │ Version: 29277193                                                                                        │
│  │ Digest: GMRv3tWk5nAeHfCesGKj2gTx8dvneE35F8veBqmvaCiN                                                     │
│  └──                                                                                                        │
│ Published Objects:                                                                                          │
│  ┌──                                                                                                        │
│  │ PackageID: 0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557                            │
│  │ Version: 1                                                                                               │
│  │ Digest: 62JNd4e4tmEUMspHHjMkGmeXsphXw8MqGoQrTqHueX1p                                                     │
│  │ Modules: swap_moveexpert                                                                                 │
│  └──                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -20078280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

铸造代币move410coin:
```bash
❯ sui client call --package 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f --module move410coin --function mint  --args 0xeac8a7c99a05646e0984984229a61a6424f5edbe83dad3fe4e2030236881dd23 1000000000000 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc
Transaction Digest: Co9pqFQEh7nWwi5DnE2kV2ZDHxYhV47L3SMmt7nxHwEh
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                   │
│ Gas Owner: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                                    │
│  │ Version: 29277236                                                                                         │
│  │ Digest: 6MdWQEcoFpP8u3Hg28zRrMGmwUDgdh6u4XTR3m5cGRQe                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xeac8a7c99a05646e0984984229a61a6424f5edbe83dad3fe4e2030236881dd23              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000000000000"                                                          │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    move410coin                                                        │                         │
│ │  │ Package:   0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    jwZuzDk4C9HeDE+E3oaXBGGs8hXGUk7wcJ0qviex9k1cL2keqYbk5QIw47k+EDA3Wki9ZEGN7mjRpQnZjZcuBg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Co9pqFQEh7nWwi5DnE2kV2ZDHxYhV47L3SMmt7nxHwEh                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x13263d2eb5f35ff5fb2d1645cf9f73e66ae7e3cd598857fc4c170b0274537fed                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277237                                                                              │
│  │ Digest: 7hrNP2sgLuLUxMspiSL5mTTg2aJ5R2rNfBLRzjDVUjJR                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277237                                                                              │
│  │ Digest: 6D4tJFzPtRfZWLDxow8BgojvnAbm7qnaVsz7AEoidoPC                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xeac8a7c99a05646e0984984229a61a6424f5edbe83dad3fe4e2030236881dd23                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277237                                                                              │
│  │ Digest: 3fUv6Yv15HgtfsALgyg9cXFQF2LDtCsMUj3uHMkRir8Q                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277237                                                                              │
│  │ Digest: 6D4tJFzPtRfZWLDxow8BgojvnAbm7qnaVsz7AEoidoPC                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4225600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2768832 MIST                                                                   │
│    Non-refundable Storage Fee: 27968 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3L2qZr2rYjjwSpWDpmqP85mai511s3NTo1QK9hsG9Ck2                                                   │
│    5Dvv55B4DN6HKQm2opxoJ9J7hzdeVZRpSU8E732kExPL                                                   │
│    5ztD9DuxSy3i2p7FBXbkpD18qfywQ7bWPAeyfKiEdZPS                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x13263d2eb5f35ff5fb2d1645cf9f73e66ae7e3cd598857fc4c170b0274537fed                                                      │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                        │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                     │
│  │ ObjectType: 0x2::coin::Coin<0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN>         │
│  │ Version: 29277237                                                                                                                 │
│  │ Digest: 7hrNP2sgLuLUxMspiSL5mTTg2aJ5R2rNfBLRzjDVUjJR                                                                              │
│  └──                                                                                                                                 │
│ Mutated Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                                                      │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                        │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                        │
│  │ Version: 29277237                                                                                                                 │
│  │ Digest: 6D4tJFzPtRfZWLDxow8BgojvnAbm7qnaVsz7AEoidoPC                                                                              │
│  └──                                                                                                                                 │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0xeac8a7c99a05646e0984984229a61a6424f5edbe83dad3fe4e2030236881dd23                                                      │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                        │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                     │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN>  │
│  │ Version: 29277237                                                                                                                 │
│  │ Digest: 3fUv6Yv15HgtfsALgyg9cXFQF2LDtCsMUj3uHMkRir8Q                                                                              │
│  └──                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2456768                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )           │
│  │ CoinType: 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN  │
│  │ Amount: 1000000000000                                                                                   │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

铸造代币sui410coin:
```bash
❯ sui client call --package 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f --module sui410coin --function mint  --args 0x1289226cdff8183285d865a3ab61a96c9d277d7b3e372520ba0a3da17811a728 8100000000000 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc
Transaction Digest: AdQwQ9uX4DkyDyTa5dpCUdNa3TXo575YSk2nzrwGSydb
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                   │
│ Gas Owner: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                                    │
│  │ Version: 29277230                                                                                         │
│  │ Digest: 9btULc3h1V5T1JkxEPTmQeVcSmZN3M78CGW416zUPEJB                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x1289226cdff8183285d865a3ab61a96c9d277d7b3e372520ba0a3da17811a728              │ │
│ │ 1   Pure Arg: Type: u64, Value: "8100000000000"                                                          │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    sui410coin                                                         │                         │
│ │  │ Package:   0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    mYnHmKpu2TJ2CoSkTJk6gRVr54eshF8vRNwmnElW93Vr/8LSWbUdVNJ8LW9RIsY+Nuwvw8agINSwUm1JO1dfDA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: AdQwQ9uX4DkyDyTa5dpCUdNa3TXo575YSk2nzrwGSydb                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 343                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xf4cdb0eb8c285487100b648b518539f38a2243adbf2758b002bd39d6edd08432                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277231                                                                              │
│  │ Digest: HzWz5oyT1fiixCaAMwqm8o1P6HWEExf5te1z3xc8JUVy                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1289226cdff8183285d865a3ab61a96c9d277d7b3e372520ba0a3da17811a728                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277231                                                                              │
│  │ Digest: BTAyUBfGK353EN2ze2WNVt5hih6NwE5A42yS5K3ETzFA                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277231                                                                              │
│  │ Digest: wKm4na3GUvLrah1iNsjZsbXtNtudpmVNtJG5ZfoCh8f                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277231                                                                              │
│  │ Digest: wKm4na3GUvLrah1iNsjZsbXtNtudpmVNtJG5ZfoCh8f                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4195200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2753784 MIST                                                                   │
│    Non-refundable Storage Fee: 27816 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3L2qZr2rYjjwSpWDpmqP85mai511s3NTo1QK9hsG9Ck2                                                   │
│    5Dvv55B4DN6HKQm2opxoJ9J7hzdeVZRpSU8E732kExPL                                                   │
│    9G4Hc7R4F2doqy8MmTQ6t93pyxZdtgNYbohByvmxVn8W                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                     │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                   │
│  ┌──                                                                                                                               │
│  │ ObjectID: 0xf4cdb0eb8c285487100b648b518539f38a2243adbf2758b002bd39d6edd08432                                                    │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                      │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                   │
│  │ ObjectType: 0x2::coin::Coin<0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN>         │
│  │ Version: 29277231                                                                                                               │
│  │ Digest: HzWz5oyT1fiixCaAMwqm8o1P6HWEExf5te1z3xc8JUVy                                                                            │
│  └──                                                                                                                               │
│ Mutated Objects:                                                                                                                   │
│  ┌──                                                                                                                               │
│  │ ObjectID: 0x1289226cdff8183285d865a3ab61a96c9d277d7b3e372520ba0a3da17811a728                                                    │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                      │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                   │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN>  │
│  │ Version: 29277231                                                                                                               │
│  │ Digest: BTAyUBfGK353EN2ze2WNVt5hih6NwE5A42yS5K3ETzFA                                                                            │
│  └──                                                                                                                               │
│  ┌──                                                                                                                               │
│  │ ObjectID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                                                    │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                      │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                   │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                      │
│  │ Version: 29277231                                                                                                               │
│  │ Digest: wKm4na3GUvLrah1iNsjZsbXtNtudpmVNtJG5ZfoCh8f                                                                             │
│  └──                                                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )         │
│  │ CoinType: 0x2::sui::SUI                                                                               │
│  │ Amount: -2441416                                                                                      │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )         │
│  │ CoinType: 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN  │
│  │ Amount: 8100000000000                                                                                 │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```



创建交易池，存入move410coin和sui410coin:
```bash
❯ sui client call --package 0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557 --module swap_moveexpert --function create_pool --type-args 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN --gas-budget 10000000
Transaction Digest: 5q9SKCcXJ1PLZKiL2XL68A1Rbuddh3NUjK6xtDPNL1sJ
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                            │
│ Gas Owner: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                         │
│ Gas Budget: 10000000 MIST                                                                             │
│ Gas Price: 1000 MIST                                                                                  │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                             │
│  │ Version: 29277237                                                                                  │
│  │ Digest: 6D4tJFzPtRfZWLDxow8BgojvnAbm7qnaVsz7AEoidoPC                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│   No input objects for this transaction                                                               │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  create_pool                                                                         │ │
│ │  │ Module:    swap_moveexpert                                                                     │ │
│ │  │ Package:   0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN │ │
│ │  │   0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN   │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    rW0/DhdLWAhb91lO0H4txt3rIIHyQgU+FubW2hn5urPHeGKXy9G0oqyaiasyQBhrh7U9UdibQx9X38lbtvnfBg==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5q9SKCcXJ1PLZKiL2XL68A1Rbuddh3NUjK6xtDPNL1sJ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 29277238                                                                              │
│  │ Digest: Ha7JjDj6ujuib4w4FgV84QSxr45MWg16QoPHdmej8eVu                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277238                                                                              │
│  │ Digest: 9BEbibcEsQqAtEpXXK6imQJAYdZY47TM7wYaoRdQp61K                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277238                                                                              │
│  │ Digest: 9BEbibcEsQqAtEpXXK6imQJAYdZY47TM7wYaoRdQp61K                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3374400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    wtcEp5Qp9Vvz1N1wMFPWHw94wcrmbpoQoXeuvTLBbS8                                                    │
│    5Dvv55B4DN6HKQm2opxoJ9J7hzdeVZRpSU8E732kExPL                                                   │
│    Co9pqFQEh7nWwi5DnE2kV2ZDHxYhV47L3SMmt7nxHwEh                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                                    │
│  ┌──                                                                                                                                                                                                                                                                                                │
│  │ ObjectID: 0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265                                                                                                                                                                                                                     │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                                                                                                                                                                                       │
│  │ Owner: Shared                                                                                                                                                                                                                                                                                    │
│  │ ObjectType: 0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557::swap_moveexpert::Pool<0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN, 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN>  │
│  │ Version: 29277238                                                                                                                                                                                                                                                                                │
│  │ Digest: Ha7JjDj6ujuib4w4FgV84QSxr45MWg16QoPHdmej8eVu                                                                                                                                                                                                                                             │
│  └──                                                                                                                                                                                                                                                                                                │
│ Mutated Objects:                                                                                                                                                                                                                                                                                    │
│  ┌──                                                                                                                                                                                                                                                                                                │
│  │ ObjectID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                                                                                                                                                                                                                     │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                                                                                                                                                                                       │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                                                                                                                                                                                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                                       │
│  │ Version: 29277238                                                                                                                                                                                                                                                                                │
│  │ Digest: 9BEbibcEsQqAtEpXXK6imQJAYdZY47TM7wYaoRdQp61K                                                                                                                                                                                                                                             │
│  └──                                                                                                                                                                                                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3396280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


添加流动池:
```bash
❯ sui client call --package 0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557 --module swap_moveexpert --function add_liquidity --args 0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265 0x13263d2eb5f35ff5fb2d1645cf9f73e66ae7e3cd598857fc4c170b0274537fed 0xf4cdb0eb8c285487100b648b518539f38a2243adbf2758b002bd39d6edd08432 0xb6bba70e5cdcbb658c6854767927e5f4d6e8cb0de470dcc498478e4d88e6a0b4 --type-args 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN --gas-budget 5000000000

Transaction Digest: 6HPsgY8zoXQ4ggMqKMjEfiFEckicvwk8Ptj8kYoouVgP
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                            │
│ Gas Owner: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                         │
│ Gas Budget: 5000000000 MIST                                                                           │
│ Gas Price: 1000 MIST                                                                                  │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                             │
│  │ Version: 29277238                                                                                  │
│  │ Digest: 9BEbibcEsQqAtEpXXK6imQJAYdZY47TM7wYaoRdQp61K                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮       │
│ │ Input Objects                                                                               │       │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤       │
│ │ 0   Shared Object    ID: 0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265 │       │
│ │ 1   Imm/Owned Object ID: 0x13263d2eb5f35ff5fb2d1645cf9f73e66ae7e3cd598857fc4c170b0274537fed │       │
│ │ 2   Imm/Owned Object ID: 0xf4cdb0eb8c285487100b648b518539f38a2243adbf2758b002bd39d6edd08432 │       │
│ │ 3   Shared Object    ID: 0xb6bba70e5cdcbb658c6854767927e5f4d6e8cb0de470dcc498478e4d88e6a0b4 │       │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯       │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  add_liquidity                                                                       │ │
│ │  │ Module:    swap_moveexpert                                                                     │ │
│ │  │ Package:   0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN │ │
│ │  │   0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN   │ │
│ │  │ Arguments:                                                                                     │ │
│ │  │   Input  0                                                                                     │ │
│ │  │   Input  1                                                                                     │ │
│ │  │   Input  2                                                                                     │ │
│ │  │   Input  3                                                                                     │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    8dF2qj2XfPZh8wQriCXcv7ko/Gp3M7HCldlrtjhYClJ0Onx/0HSxCjtAxTaf2t3EctDNnYnkBgtDD5OnPyamAg==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6HPsgY8zoXQ4ggMqKMjEfiFEckicvwk8Ptj8kYoouVgP                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x354ab12ebccbe112d1e591147c9f09cd24fc4220684e271ddece1a7242763d1f                         │
│  │ Owner: Object ID: ( 0x44d24fea56e3ff86985803950f753ca7a043edbf778740e87e6e2a7341eef2ed )       │
│  │ Version: 29277239                                                                              │
│  │ Digest: 648qxXHgttJmDqHhWsh8RCETp7s11zY5rXFqE14i7NbV                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb5533be7112b004e15720cd3004954076b796b5a457eef08639a6fe16a748f9c                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277239                                                                              │
│  │ Digest: 9upSnEzAz24RnamkubUUJmW28KhX2RyZCC7hESGEeGTb                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277239                                                                              │
│  │ Digest: 4MVYnKa6bs8qk9rEbayFkqazzEqtBB5hGc6H8yVmoBgJ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb6bba70e5cdcbb658c6854767927e5f4d6e8cb0de470dcc498478e4d88e6a0b4                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 29277239                                                                              │
│  │ Digest: AoSjjhotv5kpTDtqu6a9p1hCVAq9dAjvGU1b7a5xA3HH                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 29277239                                                                              │
│  │ Digest: BMrtBuKHzfzoejS1DKTTmaFxVLXXV5eRx94MoYgfkqyg                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xb6bba70e5cdcbb658c6854767927e5f4d6e8cb0de470dcc498478e4d88e6a0b4                         │
│  │ Version: 29277235                                                                              │
│  │ Digest: ABB5gWkr4sGMSacE43bmu85BMcAPnVk7oRDPofA5LPs2                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265                         │
│  │ Version: 29277238                                                                              │
│  │ Digest: Ha7JjDj6ujuib4w4FgV84QSxr45MWg16QoPHdmej8eVu                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x13263d2eb5f35ff5fb2d1645cf9f73e66ae7e3cd598857fc4c170b0274537fed                         │
│  │ Version: 29277239                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf4cdb0eb8c285487100b648b518539f38a2243adbf2758b002bd39d6edd08432                         │
│  │ Version: 29277239                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277239                                                                              │
│  │ Digest: 4MVYnKa6bs8qk9rEbayFkqazzEqtBB5hGc6H8yVmoBgJ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9340400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 7794864 MIST                                                                   │
│    Non-refundable Storage Fee: 78736 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    nbfUt5zKu97NwjwKEz7RvsrAG3xN3YPpegwV6jxezB9                                                    │
│    wtcEp5Qp9Vvz1N1wMFPWHw94wcrmbpoQoXeuvTLBbS8                                                    │
│    5Dvv55B4DN6HKQm2opxoJ9J7hzdeVZRpSU8E732kExPL                                                   │
│    5q9SKCcXJ1PLZKiL2XL68A1Rbuddh3NUjK6xtDPNL1sJ                                                   │
│    Co9pqFQEh7nWwi5DnE2kV2ZDHxYhV47L3SMmt7nxHwEh                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                                                     │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                                                               │
│  │ ObjectID: 0x354ab12ebccbe112d1e591147c9f09cd24fc4220684e271ddece1a7242763d1f                                                                                                                                                                                                                                    │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                                                                                                                                                                                                      │
│  │ Owner: Object ID: ( 0x44d24fea56e3ff86985803950f753ca7a043edbf778740e87e6e2a7341eef2ed )                                                                                                                                                                                                                        │
│  │ ObjectType: 0x2::dynamic_field::Field<0x2::object::ID, vector<u64>>                                                                                                                                                                                                                                             │
│  │ Version: 29277239                                                                                                                                                                                                                                                                                               │
│  │ Digest: 648qxXHgttJmDqHhWsh8RCETp7s11zY5rXFqE14i7NbV                                                                                                                                                                                                                                                            │
│  └──                                                                                                                                                                                                                                                                                                               │
│  ┌──                                                                                                                                                                                                                                                                                                               │
│  │ ObjectID: 0xb5533be7112b004e15720cd3004954076b796b5a457eef08639a6fe16a748f9c                                                                                                                                                                                                                                    │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                                                                                                                                                                                                      │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                                                                                                                                                                                                   │
│  │ ObjectType: 0x2::coin::Coin<0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557::swap_moveexpert::LP<0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN, 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN>>  │
│  │ Version: 29277239                                                                                                                                                                                                                                                                                               │
│  │ Digest: 9upSnEzAz24RnamkubUUJmW28KhX2RyZCC7hESGEeGTb                                                                                                                                                                                                                                                            │
│  └──                                                                                                                                                                                                                                                                                                               │
│ Mutated Objects:                                                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                                                               │
│  │ ObjectID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                                                                                                                                                                                                                                    │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                                                                                                                                                                                                      │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                                                                                                                                                                                                   │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                                                      │
│  │ Version: 29277239                                                                                                                                                                                                                                                                                               │
│  │ Digest: 4MVYnKa6bs8qk9rEbayFkqazzEqtBB5hGc6H8yVmoBgJ                                                                                                                                                                                                                                                            │
│  └──                                                                                                                                                                                                                                                                                                               │
│  ┌──                                                                                                                                                                                                                                                                                                               │
│  │ ObjectID: 0xb6bba70e5cdcbb658c6854767927e5f4d6e8cb0de470dcc498478e4d88e6a0b4                                                                                                                                                                                                                                    │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                                                                                                                                                                                                      │
│  │ Owner: Shared                                                                                                                                                                                                                                                                                                   │
│  │ ObjectType: 0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557::swap_moveexpert::Pocket                                                                                                                                                                                                         │
│  │ Version: 29277239                                                                                                                                                                                                                                                                                               │
│  │ Digest: AoSjjhotv5kpTDtqu6a9p1hCVAq9dAjvGU1b7a5xA3HH                                                                                                                                                                                                                                                            │
│  └──                                                                                                                                                                                                                                                                                                               │
│  ┌──                                                                                                                                                                                                                                                                                                               │
│  │ ObjectID: 0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265                                                                                                                                                                                                                                    │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                                                                                                                                                                                                      │
│  │ Owner: Shared                                                                                                                                                                                                                                                                                                   │
│  │ ObjectType: 0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557::swap_moveexpert::Pool<0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN, 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN>                 │
│  │ Version: 29277239                                                                                                                                                                                                                                                                                               │
│  │ Digest: BMrtBuKHzfzoejS1DKTTmaFxVLXXV5eRx94MoYgfkqyg                                                                                                                                                                                                                                                            │
│  └──                                                                                                                                                                                                                                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                                                                                                                                                                                                 │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                                                                                                                                                                                            │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                                                                                                                                                                                │
│  │ CoinType: 0x2::sui::SUI                                                                                                                                                                                                                                                                      │
│  │ Amount: -2545536                                                                                                                                                                                                                                                                             │
│  └──                                                                                                                                                                                                                                                                                            │
│  ┌──                                                                                                                                                                                                                                                                                            │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                                                                                                                                                                                │
│  │ CoinType: 0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557::swap_moveexpert::LP<0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN, 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN>  │
│  │ Amount: 9100000000000                                                                                                                                                                                                                                                                        │
│  └──                                                                                                                                                                                                                                                                                            │
│  ┌──                                                                                                                                                                                                                                                                                            │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                                                                                                                                                                                │
│  │ CoinType: 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN                                                                                                                                                                                       │
│  │ Amount: -1000000000000                                                                                                                                                                                                                                                                       │
│  └──                                                                                                                                                                                                                                                                                            │
│  ┌──                                                                                                                                                                                                                                                                                            │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                                                                                                                                                                                │
│  │ CoinType: 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN                                                                                                                                                                                         │
│  │ Amount: -8100000000000                                                                                                                                                                                                                                                                       │
│  └──                                                                                                                                                                                                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```


move410coin swap sui410coin:
```bash
❯ sui client call --package 0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557 --module swap_moveexpert --function sui_swap_to_to --args 0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265 0x0882670328b87ac3621cca898e6abd149c5821f4c4212d7a81cc04802461758f --type-args 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN --gas-budget 5000000000
Transaction Digest: HkcsXWePN9dPW4FZ1hFvsHQqe8d6jnxu1bheQuab47xL
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                            │
│ Gas Owner: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                         │
│ Gas Budget: 5000000000 MIST                                                                           │
│ Gas Price: 1000 MIST                                                                                  │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                             │
│  │ Version: 29277244                                                                                  │
│  │ Digest: CXgWktDz5AUMDVmB1BLH4qMF35CzSeu7uJp94ySV9via                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮       │
│ │ Input Objects                                                                               │       │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤       │
│ │ 0   Shared Object    ID: 0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265 │       │
│ │ 1   Imm/Owned Object ID: 0x0882670328b87ac3621cca898e6abd149c5821f4c4212d7a81cc04802461758f │       │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯       │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  sui_swap_to_to                                                                      │ │
│ │  │ Module:    swap_moveexpert                                                                     │ │
│ │  │ Package:   0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN │ │
│ │  │   0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN   │ │
│ │  │ Arguments:                                                                                     │ │
│ │  │   Input  0                                                                                     │ │
│ │  │   Input  1                                                                                     │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    Lf94wYTtgYZK94QEeEM8dhiUz1hirHWYb+tLaBiUyAxC0NwORvOZusg1cWQeFALxs1FHxKLEpFiHKsIQZ6/TAQ==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HkcsXWePN9dPW4FZ1hFvsHQqe8d6jnxu1bheQuab47xL                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xde6545382977cea64cf1c6633ba38b2b37ad7da2cd1356cbfe16433079b14160                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277245                                                                              │
│  │ Digest: DhVFfLqwLkuFML9feCPdavwEySBfEGC452QKP7XtkC3T                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277245                                                                              │
│  │ Digest: FVcKHLrxFFpEuweYJyozk3ftKV7fNSfH74AzmCh9zzMN                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 29277245                                                                              │
│  │ Digest: 83ujfi8VK24krxNvLRjzCg6BHonHd89ZqAJwUXCSWjZk                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265                         │
│  │ Version: 29277244                                                                              │
│  │ Digest: AMTVBC1BAmD9SNvN6x5wdVa3MoEaCkt36pzPzoeMNqLW                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0882670328b87ac3621cca898e6abd149c5821f4c4212d7a81cc04802461758f                         │
│  │ Version: 29277245                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277245                                                                              │
│  │ Digest: FVcKHLrxFFpEuweYJyozk3ftKV7fNSfH74AzmCh9zzMN                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4803200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 4740120 MIST                                                                   │
│    Non-refundable Storage Fee: 47880 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    wtcEp5Qp9Vvz1N1wMFPWHw94wcrmbpoQoXeuvTLBbS8                                                    │
│    5Dvv55B4DN6HKQm2opxoJ9J7hzdeVZRpSU8E732kExPL                                                   │
│    Avz2aGKZLqan7DdTQ1MtjihgmvhdqWbbbQsS5pnhsb9H                                                   │
│    HoyGWKXMeKN8cFuzEJeWigoDeLSY88QW86tPxqq9zMuJ                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                                    │
│  ┌──                                                                                                                                                                                                                                                                                                │
│  │ ObjectID: 0xde6545382977cea64cf1c6633ba38b2b37ad7da2cd1356cbfe16433079b14160                                                                                                                                                                                                                     │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                                                                                                                                                                                       │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                                                                                                                                                                                    │
│  │ ObjectType: 0x2::coin::Coin<0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN>                                                                                                                                                                        │
│  │ Version: 29277245                                                                                                                                                                                                                                                                                │
│  │ Digest: DhVFfLqwLkuFML9feCPdavwEySBfEGC452QKP7XtkC3T                                                                                                                                                                                                                                             │
│  └──                                                                                                                                                                                                                                                                                                │
│ Mutated Objects:                                                                                                                                                                                                                                                                                    │
│  ┌──                                                                                                                                                                                                                                                                                                │
│  │ ObjectID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                                                                                                                                                                                                                     │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                                                                                                                                                                                       │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )                                                                                                                                                                                                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                                       │
│  │ Version: 29277245                                                                                                                                                                                                                                                                                │
│  │ Digest: FVcKHLrxFFpEuweYJyozk3ftKV7fNSfH74AzmCh9zzMN                                                                                                                                                                                                                                             │
│  └──                                                                                                                                                                                                                                                                                                │
│  ┌──                                                                                                                                                                                                                                                                                                │
│  │ ObjectID: 0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265                                                                                                                                                                                                                     │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                                                                                                                                                                                                       │
│  │ Owner: Shared                                                                                                                                                                                                                                                                                    │
│  │ ObjectType: 0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557::swap_moveexpert::Pool<0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN, 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN>  │
│  │ Version: 29277245                                                                                                                                                                                                                                                                                │
│  │ Digest: 83ujfi8VK24krxNvLRjzCg6BHonHd89ZqAJwUXCSWjZk                                                                                                                                                                                                                                             │
│  └──                                                                                                                                                                                                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -1063080                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )           │
│  │ CoinType: 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN  │
│  │ Amount: 9900000000                                                                                      │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )           │
│  │ CoinType: 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN    │
│  │ Amount: -9900000000                                                                                     │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

ps：在验证过程中有几个误区，需要澄清一下。
1. 我的合约账号是0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc，所以我铸币时要转给我的合约地址，否则就要获取接收地址的操作权限，会比较麻烦。
2. 我创建池子的地址是 https://suiscan.xyz/testnet/object/0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265，当我添加流动性的时候，我可以看到分别存进去了move410coin和sui410coin，目前是从钱包里把两种代币的全部余额转进去的，当然也可以设定金额。
3. 接下来验证的时候，我在参数上一直出错，我以为swap的第二个参数，是我刚才铸币并转入池子时的代币objectID，其实不是，这里应该是我钱包里面准备要去池子里兑换的代币的objectID，就好比池子是小卖部，前面只是把商品放入小卖部，这些商品暂时就不属于我了，接下来我要用我需要拿来操作的钱包里的代币的objectId来操作，所以我又给我的钱包重新mint了代币，替换参数后，成功了。


可以优化的部分：
1. 创建流动性的时候，可以指定转入金额。
2. 代币swap可以设定价格，但是实际上这个价格应该是实时变动的。