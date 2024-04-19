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
❯ sui client publish --gas-budget 5000000000
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3
Successfully verified dependencies on-chain against source.
Transaction Digest: G4udbw1quwtXHjbF4qLb2qUaQaTsWe8EDgDabSMWssmF
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                   │
│ Gas Owner: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                │
│ Gas Budget: 5000000000 MIST                                                                                  │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                    │
│  │ Version: 13315006                                                                                         │
│  │ Digest: B25RxQRL9crpXCJX1AiMf1TA2YoNYpsREEaGa6DiSQzY                                                      │
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
│    FlLLtnJhdAh5PJBzT9WTKlRdxhD304N85Omc63s7tRNHu8MXMf1KzkzIt6aQlGmAHL/iCkIrIAl4m+6bMiITBA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: G4udbw1quwtXHjbF4qLb2qUaQaTsWe8EDgDabSMWssmF                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa45027cbdb3c61632e8de7548c701a081a7c723ffea8841bf3975c622b30d1ca                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13315007                                                                              │
│  │ Digest: 4U7YyX3y44tTA6KyvdySsNB7TCuh62YYYyiFtqvbVvBB                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb892e0ec07a14842f377a4dcbb11d3a88012b4500c20699784bb8c6a540b808b                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: uSBWPPYbajnj4n9Ctn2yBF3yT3fp6mT4ayPSBxjHWuS                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13315007                                                                              │
│  │ Digest: BpC7sX2BX7NkBiPW4A94e1kcwMjNxsrRky8EBPk5cx8F                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13315007                                                                              │
│  │ Digest: BpC7sX2BX7NkBiPW4A94e1kcwMjNxsrRky8EBPk5cx8F                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 10016800 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    CeJZT7pFvjZX1ZzXeBydXN2YkhQDfjRHDp5s9LakBgvP                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xa45027cbdb3c61632e8de7548c701a081a7c723ffea8841bf3975c622b30d1ca                  │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                    │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 13315007                                                                             │
│  │ Digest: 4U7YyX3y44tTA6KyvdySsNB7TCuh62YYYyiFtqvbVvBB                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                  │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                    │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 13315007                                                                             │
│  │ Digest: BpC7sX2BX7NkBiPW4A94e1kcwMjNxsrRky8EBPk5cx8F                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xb892e0ec07a14842f377a4dcbb11d3a88012b4500c20699784bb8c6a540b808b                 │
│  │ Version: 1                                                                                    │
│  │ Digest: uSBWPPYbajnj4n9Ctn2yBF3yT3fp6mT4ayPSBxjHWuS                                           │
│  │ Modules: movestuduentnft                                                                      │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -10038680                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

mint
```bash
❯ 
sui client call --package 0xb892e0ec07a14842f377a4dcbb11d3a88012b4500c20699784bb8c6a540b808b --module movestuduentnft --function mint --args "uvd1000" "Test" "https://www.duitang.com/blog/?id=1458729927" --gas-budget 50000000
Transaction Digest: GSMp4hxSRKY7UstMedejN2Ka3nJM6CNTZPPuGjBdPjQK
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                  │
│ Gas Owner: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6               │
│ Gas Budget: 50000000 MIST                                                                   │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                   │
│  │ Version: 13315007                                                                        │
│  │ Digest: BpC7sX2BX7NkBiPW4A94e1kcwMjNxsrRky8EBPk5cx8F                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│ ╭──────────────────────────────────────────────────────────────────────────────────────╮    │
│ │ Input Objects                                                                        │    │
│ ├──────────────────────────────────────────────────────────────────────────────────────┤    │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "uvd1000"                                     │    │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "Test"                                        │    │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "https://www.duitang.com/blog/?id=1458729927" │    │
│ ╰──────────────────────────────────────────────────────────────────────────────────────╯    │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  mint                                                               │        │
│ │  │ Module:    movestuduentnft                                                    │        │
│ │  │ Package:   0xb892e0ec07a14842f377a4dcbb11d3a88012b4500c20699784bb8c6a540b808b │        │
│ │  │ Arguments:                                                                    │        │
│ │  │   Input  0                                                                    │        │
│ │  │   Input  1                                                                    │        │
│ │  │   Input  2                                                                    │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    0qXMJYrIXv45f4p17yaOT8ecFuLph39ISE5Rc6WgGh4vWRFxYqkSU3pLuHYo+VPxYyYdfnEATnWc5j2dAD4fDw== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GSMp4hxSRKY7UstMedejN2Ka3nJM6CNTZPPuGjBdPjQK                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0104de133f713e5d13fe93332301c74e4ffc9de3fee3029d9871a437e962ef31                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13315008                                                                              │
│  │ Digest: 7t6Hy4h5iqtTKUv13iRz9TTjd4xZH2Qiu77irXRA3426                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13315008                                                                              │
│  │ Digest: 7U57uANeQYCHPaNR9LyK7PhAZJq4G1hMDdgopBktekGK                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13315008                                                                              │
│  │ Digest: 7U57uANeQYCHPaNR9LyK7PhAZJq4G1hMDdgopBktekGK                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2834800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    G4udbw1quwtXHjbF4qLb2qUaQaTsWe8EDgDabSMWssmF                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                   │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ EventID: GSMp4hxSRKY7UstMedejN2Ka3nJM6CNTZPPuGjBdPjQK:0                                                 │
│  │ PackageID: 0xb892e0ec07a14842f377a4dcbb11d3a88012b4500c20699784bb8c6a540b808b                           │
│  │ Transaction Module: movestuduentnft                                                                     │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                              │
│  │ EventType: 0xb892e0ec07a14842f377a4dcbb11d3a88012b4500c20699784bb8c6a540b808b::movestuduentnft::NFTMint │
│  │ ParsedJSON:                                                                                             │
│  │   ┌───────────┬────────────────────────────────────────────────────────────────────┐                    │
│  │   │ creater   │ 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 │                    │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                    │
│  │   │ name      │ uvd1000                                                            │                    │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                    │
│  │   │ object_id │ 0x0104de133f713e5d13fe93332301c74e4ffc9de3fee3029d9871a437e962ef31 │                    │
│  │   └───────────┴────────────────────────────────────────────────────────────────────┘                    │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                    │
│  ┌──                                                                                                                │
│  │ ObjectID: 0x0104de133f713e5d13fe93332301c74e4ffc9de3fee3029d9871a437e962ef31                                     │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                       │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                    │
│  │ ObjectType: 0xb892e0ec07a14842f377a4dcbb11d3a88012b4500c20699784bb8c6a540b808b::movestuduentnft::MoveStudentNFT  │
│  │ Version: 13315008                                                                                                │
│  │ Digest: 7t6Hy4h5iqtTKUv13iRz9TTjd4xZH2Qiu77irXRA3426                                                             │
│  └──                                                                                                                │
│ Mutated Objects:                                                                                                    │
│  ┌──                                                                                                                │
│  │ ObjectID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                     │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                       │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                       │
│  │ Version: 13315008                                                                                                │
│  │ Digest: 7U57uANeQYCHPaNR9LyK7PhAZJq4G1hMDdgopBktekGK                                                             │
│  └──                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2856680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```


mint
```bash
❯ sui client call --package 0xb892e0ec07a14842f377a4dcbb11d3a88012b4500c20699784bb8c6a540b808b --module movestuduentnft --function transfer --args 0x0104de133f713e5d13fe93332301c74e4ffc9de3fee3029d9871a437e962ef31 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000
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




transfer
```bash
❯ sui client call --package 0xb892e0ec07a14842f377a4dcbb11d3a88012b4500c20699784bb8c6a540b808b --module movestuduentnft --function transfer --args 0x0104de133f713e5d13fe93332301c74e4ffc9de3fee3029d9871a437e962ef31 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000
Transaction Digest: CkfL2NLq7GFfeKkmUxjVJ9BQFxtrmKTNMFohPnpvWnnd
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                   │
│ Gas Owner: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                    │
│  │ Version: 13315008                                                                                         │
│  │ Digest: 7U57uANeQYCHPaNR9LyK7PhAZJq4G1hMDdgopBktekGK                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x0104de133f713e5d13fe93332301c74e4ffc9de3fee3029d9871a437e962ef31              │ │
│ │ 1   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  transfer                                                           │                         │
│ │  │ Module:    movestuduentnft                                                    │                         │
│ │  │ Package:   0xb892e0ec07a14842f377a4dcbb11d3a88012b4500c20699784bb8c6a540b808b │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    fFCoBvCFlqv0kN2swxWzwZIi4flpqkS6PoCjbuxPZkoRGxSj5ENfZmkLttGcKIlVmoWQXXqKKToU4bDhnbkcCw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: CkfL2NLq7GFfeKkmUxjVJ9BQFxtrmKTNMFohPnpvWnnd                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0104de133f713e5d13fe93332301c74e4ffc9de3fee3029d9871a437e962ef31                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 13315009                                                                              │
│  │ Digest: 8FtKbDAWDT2Ms3F29WtmEVin35H75aJDr91Z4hdKmK84                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13315009                                                                              │
│  │ Digest: AX3N5vYspXQdd4xYm44GSkeZq7vV57C9GKMYWZnPAS9A                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13315009                                                                              │
│  │ Digest: AX3N5vYspXQdd4xYm44GSkeZq7vV57C9GKMYWZnPAS9A                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2834800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2806452 MIST                                                                   │
│    Non-refundable Storage Fee: 28348 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    G4udbw1quwtXHjbF4qLb2qUaQaTsWe8EDgDabSMWssmF                                                   │
│    GSMp4hxSRKY7UstMedejN2Ka3nJM6CNTZPPuGjBdPjQK                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                                    │
│  ┌──                                                                                                                │
│  │ ObjectID: 0x0104de133f713e5d13fe93332301c74e4ffc9de3fee3029d9871a437e962ef31                                     │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                       │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                    │
│  │ ObjectType: 0xb892e0ec07a14842f377a4dcbb11d3a88012b4500c20699784bb8c6a540b808b::movestuduentnft::MoveStudentNFT  │
│  │ Version: 13315009                                                                                                │
│  │ Digest: 8FtKbDAWDT2Ms3F29WtmEVin35H75aJDr91Z4hdKmK84                                                             │
│  └──                                                                                                                │
│  ┌──                                                                                                                │
│  │ ObjectID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                     │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                       │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                       │
│  │ Version: 13315009                                                                                                │
│  │ Digest: AX3N5vYspXQdd4xYm44GSkeZq7vV57C9GKMYWZnPAS9A                                                             │
│  └──                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1028348                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
