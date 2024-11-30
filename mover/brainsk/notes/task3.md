sui client publish
[warning] Client/Server api version mismatch, client api version : 1.38.0, server api version : 1.37.3
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3
Please report feedback on the linter warnings at https://forums.sui.io

Successfully verified dependencies on-chain against source.
Transaction Digest: F5SvBVshGy694GgWWoido9YeARK2Sh6fFWjj5uidc6AK
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                   │
│ Gas Owner: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                │
│ Gas Budget: 13401600 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x7b3cea15957015caddf167891d7fd31bff6c164623475265c99c196e4cec71df                                    │
│  │ Version: 416792399                                                                                        │
│  │ Digest: CcFxTLcXSgq1oyTNh3rsJH5cQD9Fg89SBg3vdiMQsuA2                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc" │ │
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
│    0PIaxRULk2tVXraBxLvfVS3m0mglZFgIKAFwqBLbMYs03Ww2GVm1/O45CYh60Ve6PzlxN/lsNMTZSM6m2KdQAw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: F5SvBVshGy694GgWWoido9YeARK2Sh6fFWjj5uidc6AK                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 587                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x03defdabcae9c45534df08f5cdd4f119cd94fbbe80117a6179328ba45555b01d                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: AXqEvTo3SwGxmR3uNwzBNUWezoD53VtTQUifw23PAaVH                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf749478757f4c49882c75a5de44fd58fe26eb955e83eb017096ca82cf2bff205                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 416792400                                                                             │
│  │ Digest: B9ukaEQ2Cv6Lf2dJP5ghxSbU2VhcUtgTamdzeAuRU5Kv                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7b3cea15957015caddf167891d7fd31bff6c164623475265c99c196e4cec71df                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 416792400                                                                             │
│  │ Digest: Byk9rqiknnbEPyVvzjTCYCtz7rSAdngg74z5nFT5s2wC                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x7b3cea15957015caddf167891d7fd31bff6c164623475265c99c196e4cec71df                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 416792400                                                                             │
│  │ Digest: Byk9rqiknnbEPyVvzjTCYCtz7rSAdngg74z5nFT5s2wC                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 11901600 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    FPQJirZF6XaBX9wcmQbPUPPX9CzbpymnF3c8vtnpHqWt                                                   │
│    GKFKMYFRakcGNLEjqQR2TvekV4AGFPyhjhu9A6hwGBvr                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xf749478757f4c49882c75a5de44fd58fe26eb955e83eb017096ca82cf2bff205                  │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                    │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 416792400                                                                            │
│  │ Digest: B9ukaEQ2Cv6Lf2dJP5ghxSbU2VhcUtgTamdzeAuRU5Kv                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x7b3cea15957015caddf167891d7fd31bff6c164623475265c99c196e4cec71df                  │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                    │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 416792400                                                                            │
│  │ Digest: Byk9rqiknnbEPyVvzjTCYCtz7rSAdngg74z5nFT5s2wC                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x03defdabcae9c45534df08f5cdd4f119cd94fbbe80117a6179328ba45555b01d                 │
│  │ Version: 1                                                                                    │
│  │ Digest: AXqEvTo3SwGxmR3uNwzBNUWezoD53VtTQUifw23PAaVH                                          │
│  │ Modules: task3                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -11673480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

make mint
sui client call --package 0x03defdabcae9c45534df08f5cdd4f119cd94fbbe80117a6179328ba45555b01d --module task3 --function mint --args "BrainNFT" "BrainNFT sui mainnet" "https://avatars.githubusercontent.com/u/155890963?s=400&u=cae07c1efe9f327be4b959f35adea823c2354bc9&v=4"
[warning] Client/Server api version mismatch, client api version : 1.38.0, server api version : 1.37.3
Transaction Digest: 9N8MADLEMf3bRAHSaaKqBKN3hsuCwq4ey9QH2w9PZjzp
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                                                    │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                                                          │
│ Gas Owner: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                                                       │
│ Gas Budget: 4760400 MIST                                                                                                                            │
│ Gas Price: 750 MIST                                                                                                                                 │
│ Gas Payment:                                                                                                                                        │
│  ┌──                                                                                                                                                │
│  │ ID: 0x7b3cea15957015caddf167891d7fd31bff6c164623475265c99c196e4cec71df                                                                           │
│  │ Version: 416792401                                                                                                                               │
│  │ Digest: CZf1BXhd1ZM4k8Ye8M7QYn9MhpDMNTDJdghzigxssLNM                                                                                             │
│  └──                                                                                                                                                │
│                                                                                                                                                     │
│ Transaction Kind: Programmable                                                                                                                      │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                                                                   │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "BrainNFT"                                                                                               │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "BrainNFT sui mainnet"                                                                                   │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "https://avatars.githubusercontent.com/u/155890963?s=400&u=cae07c1efe9f327be4b959f35adea823c2354bc9&v=4" │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                                                                │
│ │ Commands                                                                         │                                                                │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                                                                │
│ │ 0  MoveCall:                                                                     │                                                                │
│ │  ┌                                                                               │                                                                │
│ │  │ Function:  mint                                                               │                                                                │
│ │  │ Module:    task3                                                              │                                                                │
│ │  │ Package:   0x03defdabcae9c45534df08f5cdd4f119cd94fbbe80117a6179328ba45555b01d │                                                                │
│ │  │ Arguments:                                                                    │                                                                │
│ │  │   Input  0                                                                    │                                                                │
│ │  │   Input  1                                                                    │                                                                │
│ │  │   Input  2                                                                    │                                                                │
│ │  └                                                                               │                                                                │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                                                                │
│                                                                                                                                                     │
│ Signatures:                                                                                                                                         │
│    0ihrf/kkM5RtXUabIkL4u1SUzbe5ivcJvJ1Mls9tQkbBb8Lfm0gAQpAw1GST/f1S5dSKIe2Na5AKDbA6sFjXDg==                                                         │
│                                                                                                                                                     │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9N8MADLEMf3bRAHSaaKqBKN3hsuCwq4ey9QH2w9PZjzp                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 587                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x95c4ad856bc9da78cc54d1183c5933f812e17ea913f01cda5be228bf08fcd8b4                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 416792402                                                                             │
│  │ Digest: GpfNv9o2jS4FrfMzfapPZe4AAhzkvuRp3EoGueKwXPG2                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7b3cea15957015caddf167891d7fd31bff6c164623475265c99c196e4cec71df                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 416792402                                                                             │
│  │ Digest: GEhnFuZZseD2PZqsWtB9XZ31Qu3c2XrBM6NipcwAfCST                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x7b3cea15957015caddf167891d7fd31bff6c164623475265c99c196e4cec71df                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 416792402                                                                             │
│  │ Digest: GEhnFuZZseD2PZqsWtB9XZ31Qu3c2XrBM6NipcwAfCST                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3260400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    9hxSYLtSrnnJdtti46r5S9zTrzQCySBewSSLjh2WqEvc                                                   │
│    F5SvBVshGy694GgWWoido9YeARK2Sh6fFWjj5uidc6AK                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                       │
├────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                           │
│  │ EventID: 9N8MADLEMf3bRAHSaaKqBKN3hsuCwq4ey9QH2w9PZjzp:0                                     │
│  │ PackageID: 0x03defdabcae9c45534df08f5cdd4f119cd94fbbe80117a6179328ba45555b01d               │
│  │ Transaction Module: task3                                                                   │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                  │
│  │ EventType: 0x3defdabcae9c45534df08f5cdd4f119cd94fbbe80117a6179328ba45555b01d::task3::Minted │
│  │ ParsedJSON:                                                                                 │
│  │   ┌───────────┬────────────────────────────────────────────────────────────────────┐        │
│  │   │ creator   │ 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc │        │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤        │
│  │   │ name      │ BrainNFT                                                           │        │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤        │
│  │   │ object_id │ 0x95c4ad856bc9da78cc54d1183c5933f812e17ea913f01cda5be228bf08fcd8b4 │        │
│  │   └───────────┴────────────────────────────────────────────────────────────────────┘        │
│  └──                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x95c4ad856bc9da78cc54d1183c5933f812e17ea913f01cda5be228bf08fcd8b4                  │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                    │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc ) │
│  │ ObjectType: 0x3defdabcae9c45534df08f5cdd4f119cd94fbbe80117a6179328ba45555b01d::task3::Miai    │
│  │ Version: 416792402                                                                            │
│  │ Digest: GpfNv9o2jS4FrfMzfapPZe4AAhzkvuRp3EoGueKwXPG2                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x7b3cea15957015caddf167891d7fd31bff6c164623475265c99c196e4cec71df                  │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                    │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 416792402                                                                            │
│  │ Digest: GEhnFuZZseD2PZqsWtB9XZ31Qu3c2XrBM6NipcwAfCST                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3032280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯



make transfer
sui client call --package 0x03defdabcae9c45534df08f5cdd4f119cd94fbbe80117a6179328ba45555b01d --module task3 --function transfer --args 0x95c4ad856bc9da78cc54d1183c5933f812e17ea913f01cda5be228bf08fcd8b4 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
[warning] Client/Server api version mismatch, client api version : 1.38.0, server api version : 1.37.3
Transaction Digest: 9TidEfi5awA7a8BwvkvhHguFkmR2ZBVCHT2FRLacVcrq
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                   │
│ Gas Owner: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                │
│ Gas Budget: 2510724 MIST                                                                                     │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x7b3cea15957015caddf167891d7fd31bff6c164623475265c99c196e4cec71df                                    │
│  │ Version: 416792402                                                                                        │
│  │ Digest: GEhnFuZZseD2PZqsWtB9XZ31Qu3c2XrBM6NipcwAfCST                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x95c4ad856bc9da78cc54d1183c5933f812e17ea913f01cda5be228bf08fcd8b4              │ │
│ │ 1   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  transfer                                                           │                         │
│ │  │ Module:    task3                                                              │                         │
│ │  │ Package:   0x03defdabcae9c45534df08f5cdd4f119cd94fbbe80117a6179328ba45555b01d │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    F+Ow/2klvBXDriZX4osla/xnkLWod+wcm1UwXf9rm8wA4FG12kVKB69MCkjeYICxP8iaIngAfWwfG1v4N2fbCw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9TidEfi5awA7a8BwvkvhHguFkmR2ZBVCHT2FRLacVcrq                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 587                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7b3cea15957015caddf167891d7fd31bff6c164623475265c99c196e4cec71df                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 416792403                                                                             │
│  │ Digest: 7pKNhtqpvdZrQK7UgCVhFEcsdNJgMvJZKn833dXUWCjZ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x95c4ad856bc9da78cc54d1183c5933f812e17ea913f01cda5be228bf08fcd8b4                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 416792403                                                                             │
│  │ Digest: FAFY5FCmE5yhVVNG5KdraT4MnwxkrUCuhvuCVGy6nV6v                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x7b3cea15957015caddf167891d7fd31bff6c164623475265c99c196e4cec71df                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 416792403                                                                             │
│  │ Digest: 7pKNhtqpvdZrQK7UgCVhFEcsdNJgMvJZKn833dXUWCjZ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3260400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 3227796 MIST                                                                   │
│    Non-refundable Storage Fee: 32604 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    9N8MADLEMf3bRAHSaaKqBKN3hsuCwq4ey9QH2w9PZjzp                                                   │
│    F5SvBVshGy694GgWWoido9YeARK2Sh6fFWjj5uidc6AK                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x7b3cea15957015caddf167891d7fd31bff6c164623475265c99c196e4cec71df                  │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                    │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 416792403                                                                            │
│  │ Digest: 7pKNhtqpvdZrQK7UgCVhFEcsdNJgMvJZKn833dXUWCjZ                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0x95c4ad856bc9da78cc54d1183c5933f812e17ea913f01cda5be228bf08fcd8b4                  │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                    │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 ) │
│  │ ObjectType: 0x3defdabcae9c45534df08f5cdd4f119cd94fbbe80117a6179328ba45555b01d::task3::Miai    │
│  │ Version: 416792403                                                                            │
│  │ Digest: FAFY5FCmE5yhVVNG5KdraT4MnwxkrUCuhvuCVGy6nV6v                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -782604                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
