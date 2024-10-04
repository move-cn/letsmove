# task 1
上链网络: 测试网(testnet)
完成Sui钱包安装
完成Sui CLI安装
完成获取测试网络SUI学习
完成Sui浏览器学习
Hello Move 合约必须包含自己github id 输出内容是 github id
提交Hello Move合约发布package id

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
❯ sui client publish --gas-budget 500000000
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
Successfully verified dependencies on-chain against source.
Transaction Digest: 9rBDoaWBsAc2KcPsWCHmgDBsdTyAZdzFLohY4awHYgow
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                   │
│ Gas Owner: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                │
│ Gas Budget: 500000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                    │
│  │ Version: 13314986                                                                                         │
│  │ Digest: 4vMS7yp2nwJ99KvVwGobqS5MZMWa4Q9H9BeQE4LeTNvS                                                      │
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
│    6rQxF8E1WhXPgdnSL7h9CD+/9w32oIQN0kbw1jSQmVRZmRN1l5MxL3zle1kFskSN5kVWgTkqzkOWNQzP2HobAA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9rBDoaWBsAc2KcPsWCHmgDBsdTyAZdzFLohY4awHYgow                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb18cab59b28b14bafdfe85ff79b587096e22cef16b4d56d8d24f88b349e11d52                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: DcosYfNEq259DccArMzabSHD9o55aHkw5uLxNqtnHjfv                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc72c489da7645e6e81c626b7872325663fbc94dedc4ff04657615a1d703c1911                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13314987                                                                              │
│  │ Digest: 3SLrC5ytQBxRNrFMB2T3toQx4HbsWc3juktPvw12G8fB                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13314987                                                                              │
│  │ Digest: CwGyWZwRzgcDvMdLrRNVxV2Pt9UGypRbVHVcBVdK8mWb                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13314987                                                                              │
│  │ Digest: CwGyWZwRzgcDvMdLrRNVxV2Pt9UGypRbVHVcBVdK8mWb                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8018000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    FDxxi6mxBhCxC3XQSjQfNC6x4niozKLdX98iMKzznvQ4                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xc72c489da7645e6e81c626b7872325663fbc94dedc4ff04657615a1d703c1911                  │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                    │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 13314987                                                                             │
│  │ Digest: 3SLrC5ytQBxRNrFMB2T3toQx4HbsWc3juktPvw12G8fB                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                  │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                    │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 13314987                                                                             │
│  │ Digest: CwGyWZwRzgcDvMdLrRNVxV2Pt9UGypRbVHVcBVdK8mWb                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xb18cab59b28b14bafdfe85ff79b587096e22cef16b4d56d8d24f88b349e11d52                 │
│  │ Version: 1                                                                                    │
│  │ Digest: DcosYfNEq259DccArMzabSHD9o55aHkw5uLxNqtnHjfv                                          │
│  │ Modules: hello_word                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8039880                                                                               │
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
