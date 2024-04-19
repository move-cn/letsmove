# task 2
build：
```bash
❯ sui move build                           
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
```

发布合约：
```bash
❯ sui client publish --gas-budget 50000000000
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
Successfully verified dependencies on-chain against source.
Transaction Digest: AhrDMrqBhRte5P6DNCEpt9NxbHwP1g8UMimem9ZGSAEv
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                   │
│ Gas Owner: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                │
│ Gas Budget: 50000000000 MIST                                                                                 │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                    │
│  │ Version: 13314990                                                                                         │
│  │ Digest: HtpaX7uVXHbheQGSeXezGNKgkeoZScAwGsRJDTLUjm1m                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6" │ │
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
│    gGW1F3IUYijNsNewTJXrJidXXHb5b+OUBiZAUobJQ3W7RCiXjLlRCGJpgtNFhxKnksY+5rd3qFHzaK5MX8FVBA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: AhrDMrqBhRte5P6DNCEpt9NxbHwP1g8UMimem9ZGSAEv                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0073f601aa01d69f86658ee19d1fc03881dc57990accbab0cdda96711ee15251                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13314991                                                                              │
│  │ Digest: HVLDzxkDipqqB1sATE3SRMGvDjZhym2a3hdoxRuUtjcf                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: AenMnJTLiCLnXHsLy1TKi3KtuYVgucHQrPM1dStEPjCD                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xaf33fcedc0c9042b1130b50c754056c53bd1c12464e7bfe055f9497b94f279d5                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 13314991                                                                              │
│  │ Digest: 7Fha1hAGr1NMtDeKzEZmLaeY44Bsdx4hpHQH65dkyUxK                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb92b83f420af670ab1d28c204445baebbad15f6184027818285c0f46be56024b                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13314991                                                                              │
│  │ Digest: CpcWkv7CoeLRYDoJpP8xfck4ADaG7FS1pTbMpqpZDfUk                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd43cb5ff2036273e67f6068d73571b31e238de01cd73c8f908e331ae8b0e09dc                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 13314991                                                                              │
│  │ Digest: 5W4wUyZq2SsAcs5aEM1LAQ8mZqYZNAPQyXbqHAcRkQwR                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe9b1a8ea455d5d8d833718ad282e8976a8560962dbfd292141b085a314394c1e                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13314991                                                                              │
│  │ Digest: 7vTab47UzuAvUKjjyQoMXb3CoqmFbXhC8xXNMcZbbzSj                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13314991                                                                              │
│  │ Digest: BpoB8kPxmwNmrsBrY6qkMmczNWBBfTvPz5KEogUNzgEt                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13314991                                                                              │
│  │ Digest: BpoB8kPxmwNmrsBrY6qkMmczNWBBfTvPz5KEogUNzgEt                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 25087600 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2iEQbHv2VDn5gSh4EwN6AqQqmpU7Nn9Sdu8LbanShKsF                                                   │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                  │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                │
│  ┌──                                                                                                                                            │
│  │ ObjectID: 0x0073f601aa01d69f86658ee19d1fc03881dc57990accbab0cdda96711ee15251                                                                 │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                   │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                                                │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent1coin::MOVESTUDENT1COIN>   │
│  │ Version: 13314991                                                                                                                            │
│  │ Digest: HVLDzxkDipqqB1sATE3SRMGvDjZhym2a3hdoxRuUtjcf                                                                                         │
│  └──                                                                                                                                            │
│  ┌──                                                                                                                                            │
│  │ ObjectID: 0xaf33fcedc0c9042b1130b50c754056c53bd1c12464e7bfe055f9497b94f279d5                                                                 │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                   │
│  │ Owner: Immutable                                                                                                                             │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent2coin::MOVESTUDENT2COIN>  │
│  │ Version: 13314991                                                                                                                            │
│  │ Digest: 7Fha1hAGr1NMtDeKzEZmLaeY44Bsdx4hpHQH65dkyUxK                                                                                         │
│  └──                                                                                                                                            │
│  ┌──                                                                                                                                            │
│  │ ObjectID: 0xb92b83f420af670ab1d28c204445baebbad15f6184027818285c0f46be56024b                                                                 │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                   │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                                                │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                                         │
│  │ Version: 13314991                                                                                                                            │
│  │ Digest: CpcWkv7CoeLRYDoJpP8xfck4ADaG7FS1pTbMpqpZDfUk                                                                                         │
│  └──                                                                                                                                            │
│  ┌──                                                                                                                                            │
│  │ ObjectID: 0xd43cb5ff2036273e67f6068d73571b31e238de01cd73c8f908e331ae8b0e09dc                                                                 │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                   │
│  │ Owner: Immutable                                                                                                                             │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent1coin::MOVESTUDENT1COIN>  │
│  │ Version: 13314991                                                                                                                            │
│  │ Digest: 5W4wUyZq2SsAcs5aEM1LAQ8mZqYZNAPQyXbqHAcRkQwR                                                                                         │
│  └──                                                                                                                                            │
│  ┌──                                                                                                                                            │
│  │ ObjectID: 0xe9b1a8ea455d5d8d833718ad282e8976a8560962dbfd292141b085a314394c1e                                                                 │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                   │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                                                │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent2coin::MOVESTUDENT2COIN>   │
│  │ Version: 13314991                                                                                                                            │
│  │ Digest: 7vTab47UzuAvUKjjyQoMXb3CoqmFbXhC8xXNMcZbbzSj                                                                                         │
│  └──                                                                                                                                            │
│ Mutated Objects:                                                                                                                                │
│  ┌──                                                                                                                                            │
│  │ ObjectID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                                                 │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                   │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                                                │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                   │
│  │ Version: 13314991                                                                                                                            │
│  │ Digest: BpoB8kPxmwNmrsBrY6qkMmczNWBBfTvPz5KEogUNzgEt                                                                                         │
│  └──                                                                                                                                            │
│ Published Objects:                                                                                                                              │
│  ┌──                                                                                                                                            │
│  │ PackageID: 0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae                                                                │
│  │ Version: 1                                                                                                                                   │
│  │ Digest: AenMnJTLiCLnXHsLy1TKi3KtuYVgucHQrPM1dStEPjCD                                                                                         │
│  │ Modules: movestudent1coin, movestudent2coin                                                                                                  │
│  └──                                                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -25109480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


```bash
❯ sui client call --package 0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae --module movestudent1coin --function mint --gas-budget 50000000000 --args 0x0073f601aa01d69f86658ee19d1fc03881dc57990accbab0cdda96711ee15251 100 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
Transaction Digest: 635hSkxB7dAYEh5eCcr7xvvWuexRWNXAcZ6z81rpM2x7
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                   │
│ Gas Owner: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                │
│ Gas Budget: 50000000000 MIST                                                                                 │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                    │
│  │ Version: 13315003                                                                                         │
│  │ Digest: 2AXZ4X8VMeepp267YqWSyxJ83tGg9JZGkcEbfW87EQBP                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x0073f601aa01d69f86658ee19d1fc03881dc57990accbab0cdda96711ee15251              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100"                                                                    │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    movestudent1coin                                                   │                         │
│ │  │ Package:   0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    iEjRhLqFkv4N5bqLLFGcJyD6StacUWy8BFS1W8VpEDiNPtEtk4kdIq5q8ClfCgajmAzRXBgjo3KyBl3/OB0gDQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 635hSkxB7dAYEh5eCcr7xvvWuexRWNXAcZ6z81rpM2x7                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x670b4d62d64d229d18e1dede073e41dabea3e13215fe778cbb6d9313e410ee95                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 13315004                                                                              │
│  │ Digest: 9g4BLruQJdWC629DCt4YprsHae7SRvN5Q1VHDX6qV6DJ                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0073f601aa01d69f86658ee19d1fc03881dc57990accbab0cdda96711ee15251                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13315004                                                                              │
│  │ Digest: G2sowS55iotCrB9KmPdS5GM1aAS8Xr5HwvqgeKfkaH67                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13315004                                                                              │
│  │ Digest: J4a3UTMXncAhy6rshNJhx3DeZ6BdnPb5SLqECyR1v9wv                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13315004                                                                              │
│  │ Digest: J4a3UTMXncAhy6rshNJhx3DeZ6BdnPb5SLqECyR1v9wv                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4377600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2844072 MIST                                                                   │
│    Non-refundable Storage Fee: 28728 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    AhrDMrqBhRte5P6DNCEpt9NxbHwP1g8UMimem9ZGSAEv                                                   │
│    BguvUba1VDUaVwZwpY7EwByr4fECBYHVrJ8m9Afmt3bw                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                 │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                               │
│  ┌──                                                                                                                                           │
│  │ ObjectID: 0x670b4d62d64d229d18e1dede073e41dabea3e13215fe778cbb6d9313e410ee95                                                                │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                  │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                                               │
│  │ ObjectType: 0x2::coin::Coin<0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent1coin::MOVESTUDENT1COIN>         │
│  │ Version: 13315004                                                                                                                           │
│  │ Digest: 9g4BLruQJdWC629DCt4YprsHae7SRvN5Q1VHDX6qV6DJ                                                                                        │
│  └──                                                                                                                                           │
│ Mutated Objects:                                                                                                                               │
│  ┌──                                                                                                                                           │
│  │ ObjectID: 0x0073f601aa01d69f86658ee19d1fc03881dc57990accbab0cdda96711ee15251                                                                │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                  │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                                               │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent1coin::MOVESTUDENT1COIN>  │
│  │ Version: 13315004                                                                                                                           │
│  │ Digest: G2sowS55iotCrB9KmPdS5GM1aAS8Xr5HwvqgeKfkaH67                                                                                        │
│  └──                                                                                                                                           │
│  ┌──                                                                                                                                           │
│  │ ObjectID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                                                │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                  │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                                               │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                  │
│  │ Version: 13315004                                                                                                                           │
│  │ Digest: J4a3UTMXncAhy6rshNJhx3DeZ6BdnPb5SLqECyR1v9wv                                                                                        │
│  └──                                                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                      │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                 │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                     │
│  │ CoinType: 0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent1coin::MOVESTUDENT1COIN  │
│  │ Amount: 100                                                                                                       │
│  └──                                                                                                                 │
│  ┌──                                                                                                                 │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                     │
│  │ CoinType: 0x2::sui::SUI                                                                                           │
│  │ Amount: -2533528                                                                                                  │
│  └──                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```