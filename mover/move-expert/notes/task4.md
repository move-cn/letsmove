# task 3

build：
```bash
❯ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task4
```

发布合约：
```bash
❯ sui client publish --gas-budget 5000000000
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.22.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task4
Successfully verified dependencies on-chain against source.
Transaction Digest: 2WgRN1aNbi14SN15L2UG7iTH54FxtXyc3NWMfh5s5Akn
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                   │
│ Gas Owner: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                │
│ Gas Budget: 5000000000 MIST                                                                                  │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                                    │
│  │ Version: 29276893                                                                                         │
│  │ Digest: 8JewjmpQvmorFTphQPAt8sKwPNt4f1HqQH2Xzhm3jqwd                                                      │
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
│    K7i/oPA5wkMX0cBnDfA8uauBtHJpmsDIZ9JHO+mSoX23IR//4MinAajEVE89Nmd77sDNNRhKAeyy7FCXmDM3DA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2WgRN1aNbi14SN15L2UG7iTH54FxtXyc3NWMfh5s5Akn                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 340                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa60a639c551602acb7811f8db4881fbb04d0cec4a4ba0101867fa601febf5aa7                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29276894                                                                              │
│  │ Digest: GiVWCQQyNmx9bZM4cesW81ZjsrVU42fSVy4mnKV2ZYoP                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe907905df7fbfc6430124c72fd0747b53df4fbc72a2adb4fae448645906428c9                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: E2jMLgkqNkmKmTQ8fRRDk3feuQf5whLzrcZd4JQ92hfS                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29276894                                                                              │
│  │ Digest: HdsRZ1wa9SPFE835FSMiBe6cCcJCkiyDFb9uWkn3aKdi                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29276894                                                                              │
│  │ Digest: HdsRZ1wa9SPFE835FSMiBe6cCcJCkiyDFb9uWkn3aKdi                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8945200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    KgD6TfGVrduUX8dPWDRp5NraKdw6uvnPJCgExyEBNu9                                                    │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xa60a639c551602acb7811f8db4881fbb04d0cec4a4ba0101867fa601febf5aa7                  │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                    │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 29276894                                                                             │
│  │ Digest: GiVWCQQyNmx9bZM4cesW81ZjsrVU42fSVy4mnKV2ZYoP                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                  │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                    │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 29276894                                                                             │
│  │ Digest: HdsRZ1wa9SPFE835FSMiBe6cCcJCkiyDFb9uWkn3aKdi                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xe907905df7fbfc6430124c72fd0747b53df4fbc72a2adb4fae448645906428c9                 │
│  │ Version: 1                                                                                    │
│  │ Digest: E2jMLgkqNkmKmTQ8fRRDk3feuQf5whLzrcZd4JQ92hfS                                          │
│  │ Modules: guess_number_game                                                                    │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8967080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

mint：
```bash
❯ sui client call  --function run --module guess_number_game --package 0xe907905df7fbfc6430124c72fd0747b53df4fbc72a2adb4fae448645906428c9 --args 1  0x6 --gas-budget 50000000
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.22.0
Transaction Digest: 2DcxBJDsBFynfcDFLSHLwxD37xP2J7faBKMiCFGe8Dmc
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                      │
│ Gas Owner: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                   │
│ Gas Budget: 50000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                       │
│  │ Version: 29276894                                                                            │
│  │ Digest: HdsRZ1wa9SPFE835FSMiBe6cCcJCkiyDFb9uWkn3aKdi                                         │
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
│ │  │ Function:  run                                                                │            │
│ │  │ Module:    guess_number_game                                                  │            │
│ │  │ Package:   0xe907905df7fbfc6430124c72fd0747b53df4fbc72a2adb4fae448645906428c9 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    19WKwg6QDvTui9yRpdWgq7xqIBaBGWsv3xrtSFN1cV6aeX4LzBxbKElBmu+LgmUHz4ZAFozaJ4+ARMn5UNHSAQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2DcxBJDsBFynfcDFLSHLwxD37xP2J7faBKMiCFGe8Dmc                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 340                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277191                                                                              │
│  │ Digest: 4zJbbE4FmpgWGSZehAe1PpRjzxM72o1LdMgJ6kv4vWV8                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 29277190                                                                              │
│  │ Digest: 4m9tKSeYPx1NjW8QG7NVCqKq1KqWyqLqPqw9PjEQvuG7                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                         │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ Version: 29277191                                                                              │
│  │ Digest: 4zJbbE4FmpgWGSZehAe1PpRjzxM72o1LdMgJ6kv4vWV8                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 988000 MIST                                                                      │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2WgRN1aNbi14SN15L2UG7iTH54FxtXyc3NWMfh5s5Akn                                                   │
│    CRLRswiph3FEzE2NjxtGtc75gTGrYgu8irzHCKeHKqbC                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                             │
│  │ EventID: 2DcxBJDsBFynfcDFLSHLwxD37xP2J7faBKMiCFGe8Dmc:0                                                       │
│  │ PackageID: 0xe907905df7fbfc6430124c72fd0747b53df4fbc72a2adb4fae448645906428c9                                 │
│  │ Transaction Module: guess_number_game                                                                         │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                                    │
│  │ EventType: 0xe907905df7fbfc6430124c72fd0747b53df4fbc72a2adb4fae448645906428c9::guess_number_game::RecordModel │
│  │ ParsedJSON:                                                                                                   │
│  │   ┌───────────────┬─────────────┐                                                                             │
│  │   │ action        │ Wrong       │                                                                             │
│  │   ├───────────────┼─────────────┤                                                                             │
│  │   │ github        │ move-expert │                                                                             │
│  │   ├───────────────┼─────────────┤                                                                             │
│  │   │ random_number │ 0           │                                                                             │
│  │   ├───────────────┼─────────────┤                                                                             │
│  │   │ result        │ false       │                                                                             │
│  │   ├───────────────┼─────────────┤                                                                             │
│  │   │ user_number   │ 1           │                                                                             │
│  │   └───────────────┴─────────────┘                                                                             │
│  └──                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x46d6a63f7de42290051fd446c622834e4eb9fff907384062cd8973c2351e1b50                  │
│  │ Sender: 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc                    │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 29277191                                                                             │
│  │ Digest: 4zJbbE4FmpgWGSZehAe1PpRjzxM72o1LdMgJ6kv4vWV8                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1009880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
