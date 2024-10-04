```bash
sui client publish 
```

```

Successfully verified dependencies on-chain against source.
Transaction Digest: H4kNKYo9J8zHSje2LNFeycy6SjC5XWgM4zuCc8dArQgT
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xe6cf2dab8399f98aed5f63482c1c2f06d8d5f18e354c2ba71d5cc86819a745ff                                   │
│ Gas Owner: 0xe6cf2dab8399f98aed5f63482c1c2f06d8d5f18e354c2ba71d5cc86819a745ff                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x5bfbcf35be288a91b07badaf26ffffb6560cde0978a3a9a3b38fecceeb774b64                                    │
│  │ Version: 3                                                                                                │
│  │ Digest: 5Ra8QB8jj7jjtZjfqU1aN2qEWgVGbiy7rrstAr4ne9zf                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xe6cf2dab8399f98aed5f63482c1c2f06d8d5f18e354c2ba71d5cc86819a745ff" │ │
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
│    yzHIyc0ffKR3BNhqRNhq4OAvaLGkqO06ZyN0/NHYKbn8CZBNuLDH7gYbl6ZzsFN1Ha1irUIKd178sBAPWgFkDQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: H4kNKYo9J8zHSje2LNFeycy6SjC5XWgM4zuCc8dArQgT                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 3                                                                                 │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2debc62dec95f1c3b8218de610df894c20cdd59679a3547a4e9f1af7859097c0                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Xu1FhQerFi9hk4YzU5zvAhVkJjj6Mt5nK2CDpfqXvkq                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8f3efda81d86e426e59d8934c1d45af9ca77b6f24d86de35936348a201f2122d                         │
│  │ Owner: Account Address ( 0xe6cf2dab8399f98aed5f63482c1c2f06d8d5f18e354c2ba71d5cc86819a745ff )  │
│  │ Version: 4                                                                                     │
│  │ Digest: BbmNyRHXhgQvFSvmrHsr3C6dQfZL3uU67QfKT1eBA6op                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xaf7801d8d5061d71ef30cfa8a66ef5520a8128416d093bfab73373f6028ea112                         │
│  │ Owner: Account Address ( 0xe6cf2dab8399f98aed5f63482c1c2f06d8d5f18e354c2ba71d5cc86819a745ff )  │
│  │ Version: 4                                                                                     │
│  │ Digest: 61CHCowywRjEwBY3ovUPWfq2VvCofUPNAPH1CAjStof5                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5bfbcf35be288a91b07badaf26ffffb6560cde0978a3a9a3b38fecceeb774b64                         │
│  │ Owner: Account Address ( 0xe6cf2dab8399f98aed5f63482c1c2f06d8d5f18e354c2ba71d5cc86819a745ff )  │
│  │ Version: 4                                                                                     │
│  │ Digest: DcBQoTrRostmRnQQ1RCBouQeJ43BPi3X5DkRhgeZnfD7                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x5bfbcf35be288a91b07badaf26ffffb6560cde0978a3a9a3b38fecceeb774b64                         │
│  │ Owner: Account Address ( 0xe6cf2dab8399f98aed5f63482c1c2f06d8d5f18e354c2ba71d5cc86819a745ff )  │
│  │ Version: 4                                                                                     │
│  │ Digest: DcBQoTrRostmRnQQ1RCBouQeJ43BPi3X5DkRhgeZnfD7                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8952800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    5oCdET9iZcsQEgVXBELKXbcShePzJyh4FEYvrJw446fT                                                   │
│    AgwWbVvUWN7wkqBwBpu4YpSsRM1M1REo5kDL2W2i2R41                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x8f3efda81d86e426e59d8934c1d45af9ca77b6f24d86de35936348a201f2122d                  │
│  │ Sender: 0xe6cf2dab8399f98aed5f63482c1c2f06d8d5f18e354c2ba71d5cc86819a745ff                    │
│  │ Owner: Account Address ( 0xe6cf2dab8399f98aed5f63482c1c2f06d8d5f18e354c2ba71d5cc86819a745ff ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 4                                                                                    │
│  │ Digest: BbmNyRHXhgQvFSvmrHsr3C6dQfZL3uU67QfKT1eBA6op                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0xaf7801d8d5061d71ef30cfa8a66ef5520a8128416d093bfab73373f6028ea112                  │
│  │ Sender: 0xe6cf2dab8399f98aed5f63482c1c2f06d8d5f18e354c2ba71d5cc86819a745ff                    │
│  │ Owner: Account Address ( 0xe6cf2dab8399f98aed5f63482c1c2f06d8d5f18e354c2ba71d5cc86819a745ff ) │
│  │ ObjectType: 0x2debc62dec95f1c3b8218de610df894c20cdd59679a3547a4e9f1af7859097c0::hello::Hello  │
│  │ Version: 4                                                                                    │
│  │ Digest: 61CHCowywRjEwBY3ovUPWfq2VvCofUPNAPH1CAjStof5                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x5bfbcf35be288a91b07badaf26ffffb6560cde0978a3a9a3b38fecceeb774b64                  │
│  │ Sender: 0xe6cf2dab8399f98aed5f63482c1c2f06d8d5f18e354c2ba71d5cc86819a745ff                    │
│  │ Owner: Account Address ( 0xe6cf2dab8399f98aed5f63482c1c2f06d8d5f18e354c2ba71d5cc86819a745ff ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 4                                                                                    │
│  │ Digest: DcBQoTrRostmRnQQ1RCBouQeJ43BPi3X5DkRhgeZnfD7                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x2debc62dec95f1c3b8218de610df894c20cdd59679a3547a4e9f1af7859097c0                 │
│  │ Version: 1                                                                                    │
│  │ Digest: Xu1FhQerFi9hk4YzU5zvAhVkJjj6Mt5nK2CDpfqXvkq                                           │
│  │ Modules: hello                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xe6cf2dab8399f98aed5f63482c1c2f06d8d5f18e354c2ba71d5cc86819a745ff )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8974680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
