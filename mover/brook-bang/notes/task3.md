# Task3 NFT
package链接: https://suiscan.xyz/testnet/object/0x32b0aafff83891785f76d98f48c6888576f127f42b58200d916cf1fdd526db62/contracts

```
PS F:\sui_project\418\task3> sui client publish --gas-budget 30000000
[warn] Client/Server api version mismatch, client api version : 1.22.0, server api version : 1.23.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3

Successfully verified dependencies on-chain against source.
Transaction Digest: 13QQZkX43o9fL6TkyEysgkXR7uwHCNaht2f9UC8YfVHc
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                   │
│ Gas Owner: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                │
│ Gas Budget: 30000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                                    │
│  │ Version: 870969                                                                                           │
│  │ Digest: 8dj713tG9GZQUwhx1Q54cqrkqpSNJPhnRxoPty2TDvEP                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669" │ │
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
│    SRXFyeh5O+bC9i5FyRfX+qUbBbeJHCYjZr5V7Bm0O0OZrKb3RRM60AmX5g6MpiKgLa9CTRp1mIHqCL0ld21fCw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 13QQZkX43o9fL6TkyEysgkXR7uwHCNaht2f9UC8YfVHc                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 343                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x32b0aafff83891785f76d98f48c6888576f127f42b58200d916cf1fdd526db62                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: GE6C9j546rgZaPfRwLPrNMeUeg2tWVUbqVdGNwZpBAHr                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6f7bbd8d14c419bfbbcbba99d35ea755ba214886ffe9b5e39d8378f1acdb5f8c                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870970                                                                                │
│  │ Digest: 96Aftk4nLAydp6Hd6mThmKLdKoDYJ9Zmidrj1AjHvZk7                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa7440b5c3494f8e273d0ad08556dd2a1ba6568e9383a363a5867a6f1cbb3cb2f                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870970                                                                                │
│  │ Digest: 9LAyRLjJD9W2aHwCNbesiFmdpR4g8nwLmdcaq3yYp3ka                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf4b3940df20f4ec9ff5628fbb0dc0d90249de008d137d6ccdd92ff7d9dffb289                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870970                                                                                │
│  │ Digest: Fj77qfA8pDHkhZtxwQS5tZ75kqd2rVo154937rY3obn8                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870970                                                                                │
│  │ Digest: ABEbchjY2cTxZmYxdb3RrVmWDMHTeb2gPyGkEUg3h8EF                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ Version: 870970                                                                                │
│  │ Digest: ABEbchjY2cTxZmYxdb3RrVmWDMHTeb2gPyGkEUg3h8EF                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 15238000 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    GS55bJa6YJtdw87AjykrKvkP7EwhdMfJEKV98q1NF2sS                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                   │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                       │
│  │ EventID: 13QQZkX43o9fL6TkyEysgkXR7uwHCNaht2f9UC8YfVHc:0                                                                 │
│  │ PackageID: 0x32b0aafff83891785f76d98f48c6888576f127f42b58200d916cf1fdd526db62                                           │
│  │ Transaction Module: nft                                                                                                 │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                              │
│  │ EventType: 0x2::display::DisplayCreated<0x32b0aafff83891785f76d98f48c6888576f127f42b58200d916cf1fdd526db62::nft::MyNFT> │
│  │ ParsedJSON:                                                                                                             │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                           │
│  │   │ id │ 0xa7440b5c3494f8e273d0ad08556dd2a1ba6568e9383a363a5867a6f1cbb3cb2f │                                           │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                           │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ EventID: 13QQZkX43o9fL6TkyEysgkXR7uwHCNaht2f9UC8YfVHc:1                                                                 │
│  │ PackageID: 0x32b0aafff83891785f76d98f48c6888576f127f42b58200d916cf1fdd526db62                                           │
│  │ Transaction Module: nft                                                                                                 │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                              │
│  │ EventType: 0x2::display::VersionUpdated<0x32b0aafff83891785f76d98f48c6888576f127f42b58200d916cf1fdd526db62::nft::MyNFT> │
│  │ ParsedJSON:                                                                                                             │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                      │
│  │   │ fields  │ contents │ key   │ github_id                                       │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ {github_id}                                     │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ key   │ image_url                                       │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ {image_url}                                     │                                      │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                      │
│  │   │ id      │ 0xa7440b5c3494f8e273d0ad08556dd2a1ba6568e9383a363a5867a6f1cbb3cb2f │                                      │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                      │
│  │   │ version │ 1                                                                  │                                      │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                      │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x6f7bbd8d14c419bfbbcbba99d35ea755ba214886ffe9b5e39d8378f1acdb5f8c                                       │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                      │
│  │ ObjectType: 0x2::package::Publisher                                                                                │
│  │ Version: 870970                                                                                                    │
│  │ Digest: 96Aftk4nLAydp6Hd6mThmKLdKoDYJ9Zmidrj1AjHvZk7                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0xa7440b5c3494f8e273d0ad08556dd2a1ba6568e9383a363a5867a6f1cbb3cb2f                                       │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                      │
│  │ ObjectType: 0x2::display::Display<0x32b0aafff83891785f76d98f48c6888576f127f42b58200d916cf1fdd526db62::nft::MyNFT>  │
│  │ Version: 870970                                                                                                    │
│  │ Digest: 9LAyRLjJD9W2aHwCNbesiFmdpR4g8nwLmdcaq3yYp3ka                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0xf4b3940df20f4ec9ff5628fbb0dc0d90249de008d137d6ccdd92ff7d9dffb289                                       │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                               │
│  │ Version: 870970                                                                                                    │
│  │ Digest: Fj77qfA8pDHkhZtxwQS5tZ75kqd2rVo154937rY3obn8                                                               │
│  └──                                                                                                                  │
│ Mutated Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0xaa981f6724fd38c1588f9577c48cf7cbc971119065127aa8394c3f69d4f485d4                                       │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                         │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                         │
│  │ Version: 870970                                                                                                    │
│  │ Digest: ABEbchjY2cTxZmYxdb3RrVmWDMHTeb2gPyGkEUg3h8EF                                                               │
│  └──                                                                                                                  │
│ Published Objects:                                                                                                    │
│  ┌──                                                                                                                  │
│  │ PackageID: 0x32b0aafff83891785f76d98f48c6888576f127f42b58200d916cf1fdd526db62                                      │
│  │ Version: 1                                                                                                         │
│  │ Digest: GE6C9j546rgZaPfRwLPrNMeUeg2tWVUbqVdGNwZpBAHr                                                               │
│  │ Modules: nft                                                                                                       │
│  └──                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -15259880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```