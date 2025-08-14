

```text

[warn] Client/Server api version mismatch, client api version : 1.26.0, server api version : 1.25.4
UPDATING GIT DEPENDENCY https://gitee.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING lumia001
Successfully verified dependencies on-chain against source.
Transaction Digest: 5hn6WcVyviopeVWgtbWRBmHgrgDPfbkGmWYY5iYDbGsV
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                   │
│ Gas Owner: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x5e99e654ff8ace87888b67e7333a9a6fca9060ed8edcb4d09ec2dacc4c638097                                    │
│  │ Version: 211023828                                                                                        │
│  │ Digest: 2rT5KBxW2Y9M7viHdwEmnNA53n5mYvwSioH4sviySrjH                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59" │ │
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
│    EdrbEJ590sC0fLXtfjmUzai019VN0U0JzcMSlsRnpo/cGs7eJ4Xxx/4bBPpI38vMlSWoMb0VJ5gDFmArnrp1CQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5hn6WcVyviopeVWgtbWRBmHgrgDPfbkGmWYY5iYDbGsV                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 418                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1bc8df3c64fcd4c05fad107c1ac3aec18cf09814d6e9e1a2456be56dfc8e6bf9                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 5y4LrghRkUmi2xfeaWGpqFmoPLsDVgwxgyc6hK4i3DWA                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x21334b3547671c5ffbb8836613207818811458fbc0b94527c02dccae369b6bb1                         │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )  │
│  │ Version: 211023829                                                                             │
│  │ Digest: BqHron3RG6VRQuTmRJDNgSfhNwVLLUxSuYRaJ4TBWu2T                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x34ba5082cb3ba007532edf514e6afbc9e062b3754bf72aa17ff9b4621a76b561                         │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )  │
│  │ Version: 211023829                                                                             │
│  │ Digest: 2X8wEKWkWeTiQTzVrK8LjGpd5SsN75qoVPfuqugneqo7                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb1e20054b8026b954796277593d5b7e61a8806afe34a7c59296b07b40c8dcbd3                         │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )  │
│  │ Version: 211023829                                                                             │
│  │ Digest: JAkTcmTDYNDp6mNCp3oHCuduio7ybkTLLszfJWhpWXBk                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5e99e654ff8ace87888b67e7333a9a6fca9060ed8edcb4d09ec2dacc4c638097                         │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )  │
│  │ Version: 211023829                                                                             │
│  │ Digest: xUqH2v61kW8NchB6CiGis7sEbb7R7iT9oZJMCNSsQjJ                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x5e99e654ff8ace87888b67e7333a9a6fca9060ed8edcb4d09ec2dacc4c638097                         │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )  │
│  │ Version: 211023829                                                                             │
│  │ Digest: xUqH2v61kW8NchB6CiGis7sEbb7R7iT9oZJMCNSsQjJ                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 15929600 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    CzD9G1KLrBTq4cWezM69aTPyrFKoHcrrb7Jt23PQQBr9                                                   │
│    FZQQfVC428RKpDcuobUQVp45DMM4PwiELT4YH4ivaHZA                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                             │
│  │ EventID: 5hn6WcVyviopeVWgtbWRBmHgrgDPfbkGmWYY5iYDbGsV:0                                                                       │
│  │ PackageID: 0x1bc8df3c64fcd4c05fad107c1ac3aec18cf09814d6e9e1a2456be56dfc8e6bf9                                                 │
│  │ Transaction Module: Lumia001Nft                                                                                               │
│  │ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                                    │
│  │ EventType: 0x2::display::DisplayCreated<0x1bc8df3c64fcd4c05fad107c1ac3aec18cf09814d6e9e1a2456be56dfc8e6bf9::Lumia001Nft::NFT> │
│  │ ParsedJSON:                                                                                                                   │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                                 │
│  │   │ id │ 0x21334b3547671c5ffbb8836613207818811458fbc0b94527c02dccae369b6bb1 │                                                 │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                                 │
│  └──                                                                                                                             │
│  ┌──                                                                                                                             │
│  │ EventID: 5hn6WcVyviopeVWgtbWRBmHgrgDPfbkGmWYY5iYDbGsV:1                                                                       │
│  │ PackageID: 0x1bc8df3c64fcd4c05fad107c1ac3aec18cf09814d6e9e1a2456be56dfc8e6bf9                                                 │
│  │ Transaction Module: Lumia001Nft                                                                                               │
│  │ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                                    │
│  │ EventType: 0x2::display::VersionUpdated<0x1bc8df3c64fcd4c05fad107c1ac3aec18cf09814d6e9e1a2456be56dfc8e6bf9::Lumia001Nft::NFT> │
│  │ ParsedJSON:                                                                                                                   │
│  │   ┌─────────┬──────────┬───────┬──────────────────────────────────────────────────────┐                                       │
│  │   │ fields  │ contents │ key   │ name                                                 │                                       │
│  │   │         │          ├───────┼──────────────────────────────────────────────────────┤                                       │
│  │   │         │          │ value │ Lumia001                                             │                                       │
│  │   │         │          ├───────┼──────────────────────────────────────────────────────┤                                       │
│  │   │         │          │ key   │ image_url                                            │                                       │
│  │   │         │          ├───────┼──────────────────────────────────────────────────────┤                                       │
│  │   │         │          │ value │ https://avatars.githubusercontent.com/u/44024489?v=4 │                                       │
│  │   │         │          ├───────┼──────────────────────────────────────────────────────┤                                       │
│  │   │         │          │ key   │ description                                          │                                       │
│  │   │         │          ├───────┼──────────────────────────────────────────────────────┤                                       │
│  │   │         │          │ value │ Lumia001's NFT.                                      │                                       │
│  │   ├─────────┼──────────┴───────┴──────────────────────────────────────────────────────┤                                       │
│  │   │ id      │ 0x21334b3547671c5ffbb8836613207818811458fbc0b94527c02dccae369b6bb1      │                                       │
│  │   ├─────────┼─────────────────────────────────────────────────────────────────────────┤                                       │
│  │   │ version │ 1                                                                       │                                       │
│  │   └─────────┴─────────────────────────────────────────────────────────────────────────┘                                       │
│  └──                                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x21334b3547671c5ffbb8836613207818811458fbc0b94527c02dccae369b6bb1                                             │
│  │ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                               │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )                            │
│  │ ObjectType: 0x2::display::Display<0x1bc8df3c64fcd4c05fad107c1ac3aec18cf09814d6e9e1a2456be56dfc8e6bf9::Lumia001Nft::NFT>  │
│  │ Version: 211023829                                                                                                       │
│  │ Digest: BqHron3RG6VRQuTmRJDNgSfhNwVLLUxSuYRaJ4TBWu2T                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x34ba5082cb3ba007532edf514e6afbc9e062b3754bf72aa17ff9b4621a76b561                                             │
│  │ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                               │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )                            │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                     │
│  │ Version: 211023829                                                                                                       │
│  │ Digest: 2X8wEKWkWeTiQTzVrK8LjGpd5SsN75qoVPfuqugneqo7                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xb1e20054b8026b954796277593d5b7e61a8806afe34a7c59296b07b40c8dcbd3                                             │
│  │ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                               │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )                            │
│  │ ObjectType: 0x2::package::Publisher                                                                                      │
│  │ Version: 211023829                                                                                                       │
│  │ Digest: JAkTcmTDYNDp6mNCp3oHCuduio7ybkTLLszfJWhpWXBk                                                                     │
│  └──                                                                                                                        │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x5e99e654ff8ace87888b67e7333a9a6fca9060ed8edcb4d09ec2dacc4c638097                                             │
│  │ Sender: 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59                                               │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 211023829                                                                                                       │
│  │ Digest: xUqH2v61kW8NchB6CiGis7sEbb7R7iT9oZJMCNSsQjJ                                                                      │
│  └──                                                                                                                        │
│ Published Objects:                                                                                                          │
│  ┌──                                                                                                                        │
│  │ PackageID: 0x1bc8df3c64fcd4c05fad107c1ac3aec18cf09814d6e9e1a2456be56dfc8e6bf9                                            │
│  │ Version: 1                                                                                                               │
│  │ Digest: 5y4LrghRkUmi2xfeaWGpqFmoPLsDVgwxgyc6hK4i3DWA                                                                     │
│  │ Modules: Lumia001Nft                                                                                                     │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x4887f3c29909a93ca193609fa28b9c3f35ee01ac352346fc9d56d2d50126ad59 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -15701480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```