# task 5

build:
```bash
❯ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task5
```

publish:
```bash
❯ sui client publish --gas-budget 5000000000
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task5
Successfully verified dependencies on-chain against source.
Transaction Digest: 2eb8moPgrqC5itqfFAxuVCEKn9TX1ezMaKFYYu34j47s
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
│  │ Version: 29618238                                                                                         │
│  │ Digest: 9ttbZTjK2LhxJMu4hHebPxRsP335UPwTNozQhRjqr88n                                                      │
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
│    i4QrUGUi7hriZXC1TeJO47xdxKZR8YCCezlIEYI/dcRFuUP2rbfvxNwr0BLZn4nSi1GnMpqylv48z3YHF9rpAQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2eb8moPgrqC5itqfFAxuVCEKn9TX1ezMaKFYYu34j47s                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1689b7149d2c9ec028fdfa0d75dde79b945f91d3c0a6634901479db05a245535                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: CyFUE2Rce5eerSjTTQw4gcYnXzw92CuiwhtR7NPcs13h                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb877dd92d4a32b828049e7667f43ccecc4d4aec50f16111cdbc8a2a913ab4f70                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 29618239                                                                              │
│  │ Digest: 6nSP2jH1TWqGM6myFpB7UVT53K7RGdD7bVZnMYsY6nr3                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbbaa3bcc0e4efa6ef2e4f568bc929b2b59637acb2c05fa5756a399dd8850de98                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618239                                                                              │
│  │ Digest: 64AHNinC7SgdpWXf437sHKfJvkTAwpLYBW4oZy7E5xLG                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618239                                                                              │
│  │ Digest: 9gnJGicbp5JSGojQifjBRN9RhVUTiSE5LhaUGgEYHQxB                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618239                                                                              │
│  │ Digest: 9gnJGicbp5JSGojQifjBRN9RhVUTiSE5LhaUGgEYHQxB                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 20375600 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4qLBDdK3Si3cbuSj9M2NtNTM6yC5CFkX3bRnZ8MkAMqe                                                   │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                             │
│  ┌──                                                                                                         │
│  │ ObjectID: 0xb877dd92d4a32b828049e7667f43ccecc4d4aec50f16111cdbc8a2a913ab4f70                              │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                │
│  │ Owner: Shared                                                                                             │
│  │ ObjectType: 0x1689b7149d2c9ec028fdfa0d75dde79b945f91d3c0a6634901479db05a245535::swap_movestudent::Pocket  │
│  │ Version: 29618239                                                                                         │
│  │ Digest: 6nSP2jH1TWqGM6myFpB7UVT53K7RGdD7bVZnMYsY6nr3                                                      │
│  └──                                                                                                         │
│  ┌──                                                                                                         │
│  │ ObjectID: 0xbbaa3bcc0e4efa6ef2e4f568bc929b2b59637acb2c05fa5756a399dd8850de98                              │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )             │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                      │
│  │ Version: 29618239                                                                                         │
│  │ Digest: 64AHNinC7SgdpWXf437sHKfJvkTAwpLYBW4oZy7E5xLG                                                      │
│  └──                                                                                                         │
│ Mutated Objects:                                                                                             │
│  ┌──                                                                                                         │
│  │ ObjectID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                              │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )             │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                │
│  │ Version: 29618239                                                                                         │
│  │ Digest: 9gnJGicbp5JSGojQifjBRN9RhVUTiSE5LhaUGgEYHQxB                                                      │
│  └──                                                                                                         │
│ Published Objects:                                                                                           │
│  ┌──                                                                                                         │
│  │ PackageID: 0x1689b7149d2c9ec028fdfa0d75dde79b945f91d3c0a6634901479db05a245535                             │
│  │ Version: 1                                                                                                │
│  │ Digest: CyFUE2Rce5eerSjTTQw4gcYnXzw92CuiwhtR7NPcs13h                                                      │
│  │ Modules: swap_movestudent                                                                                 │
│  └──                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -20397480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

mint movestudent1coin:
```bash
❯ sui client call --package 0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae --module movestudent1coin --function mint --gas-budget 100000000 --args 0x0073f601aa01d69f86658ee19d1fc03881dc57990accbab0cdda96711ee15251 1000000000000 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6
Transaction Digest: 6DzBDJDrMj97VnGMojqaqgmWzAGskGJUfCWAwvgDD7CT
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                   │
│ Gas Owner: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                    │
│  │ Version: 29618239                                                                                         │
│  │ Digest: 9gnJGicbp5JSGojQifjBRN9RhVUTiSE5LhaUGgEYHQxB                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x0073f601aa01d69f86658ee19d1fc03881dc57990accbab0cdda96711ee15251              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000000000000"                                                          │ │
│ │ 2   Pure Arg: Type: address, Value: "0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6" │ │
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
│    NJX1FYQwL7FVwS350xnIGe28JVpwES73QL8/1iyJ6bbg2Pvqsn1fDpxUKJPoSPNI+V/pAORdiL9HzpS5VIPgBA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6DzBDJDrMj97VnGMojqaqgmWzAGskGJUfCWAwvgDD7CT                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1412d19dc626afade247c86658d8129e6fcef108606c8cfae642147c724ceaf4                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618240                                                                              │
│  │ Digest: Lhw4v9aTHdeFpMPrdBocWL2jTrK9Do6Cxt7s31mpjmV                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0073f601aa01d69f86658ee19d1fc03881dc57990accbab0cdda96711ee15251                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618240                                                                              │
│  │ Digest: Hf2MLrsKetfhwXyRwgdDoWLfEdBhRPSFhGSVakGBm7qA                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618240                                                                              │
│  │ Digest: GTCUu4qVcP2jbN2f6DwJVNJmkQUQBD3LmhTMpMPagTQT                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618240                                                                              │
│  │ Digest: GTCUu4qVcP2jbN2f6DwJVNJmkQUQBD3LmhTMpMPagTQT                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4377600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2844072 MIST                                                                   │
│    Non-refundable Storage Fee: 28728 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2eb8moPgrqC5itqfFAxuVCEKn9TX1ezMaKFYYu34j47s                                                   │
│    635hSkxB7dAYEh5eCcr7xvvWuexRWNXAcZ6z81rpM2x7                                                   │
│    AhrDMrqBhRte5P6DNCEpt9NxbHwP1g8UMimem9ZGSAEv                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                 │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                               │
│  ┌──                                                                                                                                           │
│  │ ObjectID: 0x1412d19dc626afade247c86658d8129e6fcef108606c8cfae642147c724ceaf4                                                                │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                  │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                                               │
│  │ ObjectType: 0x2::coin::Coin<0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent1coin::MOVESTUDENT1COIN>         │
│  │ Version: 29618240                                                                                                                           │
│  │ Digest: Lhw4v9aTHdeFpMPrdBocWL2jTrK9Do6Cxt7s31mpjmV                                                                                         │
│  └──                                                                                                                                           │
│ Mutated Objects:                                                                                                                               │
│  ┌──                                                                                                                                           │
│  │ ObjectID: 0x0073f601aa01d69f86658ee19d1fc03881dc57990accbab0cdda96711ee15251                                                                │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                  │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                                               │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent1coin::MOVESTUDENT1COIN>  │
│  │ Version: 29618240                                                                                                                           │
│  │ Digest: Hf2MLrsKetfhwXyRwgdDoWLfEdBhRPSFhGSVakGBm7qA                                                                                        │
│  └──                                                                                                                                           │
│  ┌──                                                                                                                                           │
│  │ ObjectID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                                                │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                  │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                                               │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                  │
│  │ Version: 29618240                                                                                                                           │
│  │ Digest: GTCUu4qVcP2jbN2f6DwJVNJmkQUQBD3LmhTMpMPagTQT                                                                                        │
│  └──                                                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                      │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                 │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                     │
│  │ CoinType: 0x2::sui::SUI                                                                                           │
│  │ Amount: -2533528                                                                                                  │
│  └──                                                                                                                 │
│  ┌──                                                                                                                 │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                     │
│  │ CoinType: 0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent1coin::MOVESTUDENT1COIN  │
│  │ Amount: 1000000000000                                                                                             │
│  └──                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

mint movestudent2coin:
```bash
❯ sui client call --package 0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae --module movestudent2coin --function mint --gas-budget 100000000 --args 0xe9b1a8ea455d5d8d833718ad282e8976a8560962dbfd292141b085a314394c1e 1000000000000 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6
Transaction Digest: 4Hf7jDayLA5cVeMMabHJ5meLQnH4rJ5e12N6GVLMiKNL
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                   │
│ Gas Owner: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                    │
│  │ Version: 29618241                                                                                         │
│  │ Digest: HDeNWtnhuuDzLzAVZju52A3ys7wxWZk1bcwLJWiVdXSG                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xe9b1a8ea455d5d8d833718ad282e8976a8560962dbfd292141b085a314394c1e              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000000000000"                                                          │ │
│ │ 2   Pure Arg: Type: address, Value: "0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    movestudent2coin                                                   │                         │
│ │  │ Package:   0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    G9mzuhXQIG95474iKYJUTKxjlgNq20edlDo/0xZGKp3CLTGPBKOwbCr/Jf1+Vpl9ccRiSskEc4G51g2lGn0LDA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4Hf7jDayLA5cVeMMabHJ5meLQnH4rJ5e12N6GVLMiKNL                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xf1f99841c29594cd21d95e8f4b45035130e474eb2130b4f904f533cf72a7ca6b                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618242                                                                              │
│  │ Digest: 3dBmKXp3VYM5Jt2GzvetuhtJZDaT7yBnfr2nnTjyscWd                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618242                                                                              │
│  │ Digest: CtkTdreJm4bhzq4QKux4DoV67oJnLz1w3QUtTzrankTA                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe9b1a8ea455d5d8d833718ad282e8976a8560962dbfd292141b085a314394c1e                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618242                                                                              │
│  │ Digest: 6rsCxpdiaMPgHkMR72eUHJTQUkSzzG2WZXLUTgSCKi7z                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618242                                                                              │
│  │ Digest: CtkTdreJm4bhzq4QKux4DoV67oJnLz1w3QUtTzrankTA                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4377600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2844072 MIST                                                                   │
│    Non-refundable Storage Fee: 28728 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    AhrDMrqBhRte5P6DNCEpt9NxbHwP1g8UMimem9ZGSAEv                                                   │
│    E3sgmPjvFjyrXZgcFydtea6LuqygQitau4Qond46wypw                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                 │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                               │
│  ┌──                                                                                                                                           │
│  │ ObjectID: 0xf1f99841c29594cd21d95e8f4b45035130e474eb2130b4f904f533cf72a7ca6b                                                                │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                  │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                                               │
│  │ ObjectType: 0x2::coin::Coin<0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent2coin::MOVESTUDENT2COIN>         │
│  │ Version: 29618242                                                                                                                           │
│  │ Digest: 3dBmKXp3VYM5Jt2GzvetuhtJZDaT7yBnfr2nnTjyscWd                                                                                        │
│  └──                                                                                                                                           │
│ Mutated Objects:                                                                                                                               │
│  ┌──                                                                                                                                           │
│  │ ObjectID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                                                │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                  │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                                               │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                  │
│  │ Version: 29618242                                                                                                                           │
│  │ Digest: CtkTdreJm4bhzq4QKux4DoV67oJnLz1w3QUtTzrankTA                                                                                        │
│  └──                                                                                                                                           │
│  ┌──                                                                                                                                           │
│  │ ObjectID: 0xe9b1a8ea455d5d8d833718ad282e8976a8560962dbfd292141b085a314394c1e                                                                │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                  │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                                               │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent2coin::MOVESTUDENT2COIN>  │
│  │ Version: 29618242                                                                                                                           │
│  │ Digest: 6rsCxpdiaMPgHkMR72eUHJTQUkSzzG2WZXLUTgSCKi7z                                                                                        │
│  └──                                                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                      │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                 │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                     │
│  │ CoinType: 0x2::sui::SUI                                                                                           │
│  │ Amount: -2533528                                                                                                  │
│  └──                                                                                                                 │
│  ┌──                                                                                                                 │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                     │
│  │ CoinType: 0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent2coin::MOVESTUDENT2COIN  │
│  │ Amount: 1000000000000                                                                                             │
│  └──                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```



create pool:
```bash
❯ sui client call --package 0x1689b7149d2c9ec028fdfa0d75dde79b945f91d3c0a6634901479db05a245535 --module swap_movestudent --function create_pool --type-args 0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent1coin::MOVESTUDENT1COIN 0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent2coin::MOVESTUDENT2COIN --gas-budget 10000000
Transaction Digest: DFs3qi7GujNALa5Z2ujhKcUZctodTCBgPaqRf1dLc7Zc
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                      │
│ Gas Owner: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                   │
│ Gas Budget: 10000000 MIST                                                                                       │
│ Gas Price: 1000 MIST                                                                                            │
│ Gas Payment:                                                                                                    │
│  ┌──                                                                                                            │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                       │
│  │ Version: 29618245                                                                                            │
│  │ Digest: 6PheCTy5dKontmFRf5biAnp2acwobwx4W5pnAoNNGyxK                                                         │
│  └──                                                                                                            │
│                                                                                                                 │
│ Transaction Kind: Programmable                                                                                  │
│   No input objects for this transaction                                                                         │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                                    │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                                │ │
│ │  ┌                                                                                                          │ │
│ │  │ Function:  create_pool                                                                                   │ │
│ │  │ Module:    swap_movestudent                                                                              │ │
│ │  │ Package:   0x1689b7149d2c9ec028fdfa0d75dde79b945f91d3c0a6634901479db05a245535                            │ │
│ │  │ Type Arguments:                                                                                          │ │
│ │  │   0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent1coin::MOVESTUDENT1COIN │ │
│ │  │   0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent2coin::MOVESTUDENT2COIN │ │
│ │  └                                                                                                          │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                                 │
│ Signatures:                                                                                                     │
│    iMaxps/cQqNJBdYz65lOxenxgpXjPrLMWN/FsCjhZuzFFU1waTE8dZd5Ai9QNNL9iVPo1W3CpbvYHNIaOyb0DA==                     │
│                                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DFs3qi7GujNALa5Z2ujhKcUZctodTCBgPaqRf1dLc7Zc                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xea60d1331d5aa5691d86527dd0f7d365ea9c81ece2395a8236fe16059a9d1a38                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 29618246                                                                              │
│  │ Digest: 493pG95pPjY6Fzb6FnKbEuAoF84oh2Np1iSR9LFkrgc4                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618246                                                                              │
│  │ Digest: HpxUar7TEmEv5iMZofK2HoiHLFbRGfVe6ewqjyi3bpM3                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618246                                                                              │
│  │ Digest: HpxUar7TEmEv5iMZofK2HoiHLFbRGfVe6ewqjyi3bpM3                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3549200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2eb8moPgrqC5itqfFAxuVCEKn9TX1ezMaKFYYu34j47s                                                   │
│    5VucVGemNBMoGKjBvBLBj24FRK4WTtqpfYn1oReQPMYi                                                   │
│    AhrDMrqBhRte5P6DNCEpt9NxbHwP1g8UMimem9ZGSAEv                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                                                           │
│  ┌──                                                                                                                                                                                                                                                                                                                       │
│  │ ObjectID: 0xea60d1331d5aa5691d86527dd0f7d365ea9c81ece2395a8236fe16059a9d1a38                                                                                                                                                                                                                                            │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                                                                                                                                                                                              │
│  │ Owner: Shared                                                                                                                                                                                                                                                                                                           │
│  │ ObjectType: 0x1689b7149d2c9ec028fdfa0d75dde79b945f91d3c0a6634901479db05a245535::swap_movestudent::Pool<0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent1coin::MOVESTUDENT1COIN, 0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent2coin::MOVESTUDENT2COIN>  │
│  │ Version: 29618246                                                                                                                                                                                                                                                                                                       │
│  │ Digest: 493pG95pPjY6Fzb6FnKbEuAoF84oh2Np1iSR9LFkrgc4                                                                                                                                                                                                                                                                    │
│  └──                                                                                                                                                                                                                                                                                                                       │
│ Mutated Objects:                                                                                                                                                                                                                                                                                                           │
│  ┌──                                                                                                                                                                                                                                                                                                                       │
│  │ ObjectID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                                                                                                                                                                                                                                            │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                                                                                                                                                                                                                              │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )                                                                                                                                                                                                                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                                                              │
│  │ Version: 29618246                                                                                                                                                                                                                                                                                                       │
│  │ Digest: HpxUar7TEmEv5iMZofK2HoiHLFbRGfVe6ewqjyi3bpM3                                                                                                                                                                                                                                                                    │
│  └──                                                                                                                                                                                                                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3571080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

sui client call --package 0x1689b7149d2c9ec028fdfa0d75dde79b945f91d3c0a6634901479db05a245535 --module swap_movestudent --function add_liquidity --args pool地址(swap_movestudent::Pool) 代币1地址(::movestudent1coin::MOVESTUDENT1COIN>) 代币2地址(::movestudent2coin::MOVESTUDENT2COIN>) pocket地址(swap_movestudent::Pocket) 
 --type-args  0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent1coin::MOVESTUDENT1COIN  0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent2coin::MOVESTUDENT2COIN --gas-budget 5000000000



add liquidity:
```bash
❯ sui client call --package 0x1689b7149d2c9ec028fdfa0d75dde79b945f91d3c0a6634901479db05a245535 --module swap_movestudent --function add_liquidity --args 0x5e93e026cc375f94f975e614f4e940540655fc94132a491d82445b8129645fff 0x1412d19dc626afade247c86658d8129e6fcef108606c8cfae642147c724ceaf4 0xf1f99841c29594cd21d95e8f4b45035130e474eb2130b4f904f533cf72a7ca6b 0xb877dd92d4a32b828049e7667f43ccecc4d4aec50f16111cdbc8a2a913ab4f70 --type-args 0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent1coin::MOVESTUDENT1COIN 0x9914b81a878cc9eed106347ee7c27aeb688b0c8877468d3ebb96049f49e6feae::movestudent2coin::MOVESTUDENT2COIN --gas-budget 50000000000

Transaction Digest: 6HPsgY8zoXQ4ggMqKMjEfiFEckicvwk8Ptj8kYoouVgP

```


movestudent1coin swap to movestudent2coin:
```bash
❯ sui client call --package 0x5004c3640cf73ef1daaa80ffc1d708fddd02bf34a6ea5b3d4a5e507c6d47e557 --module swap_moveexpert --function sui_swap_to_to --args 0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265 0x0882670328b87ac3621cca898e6abd149c5821f4c4212d7a81cc04802461758f --type-args 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::move410coin::MOVE410COIN 0xe0d020485b78bb3a7b8f6352fcb4b4253f4843384dd5330d33ff9fad882a4e5f::sui410coin::SUI410COIN --gas-budget 5000000000
Transaction Digest: HkcsXWePN9dPW4FZ1hFvsHQqe8d6jnxu1bheQuab47xL

```

ps：在验证过程中有几个误区，需要澄清一下。
1. 我的合约账号是0x7c5b23487cf42f99d980913cdc812f07c720d5da039ca89336e8d1d5253e7bfc，所以我铸币时要转给我的合约地址，否则就要获取接收地址的操作权限，会比较麻烦。
2. 我创建池子的地址是 https://suiscan.xyz/testnet/object/0xe9a641b3a5c476002f68261bd404eca53e2635e905048673861e2c595f13e265，当我添加流动性的时候，我可以看到分别存进去了move410coin和sui410coin，目前是从钱包里把两种代币的全部余额转进去的，当然也可以设定金额。
3. 接下来验证的时候，我在参数上一直出错，我以为swap的第二个参数，是我刚才铸币并转入池子时的代币objectID，其实不是，这里应该是我钱包里面准备要去池子里兑换的代币的objectID，就好比池子是小卖部，前面只是把商品放入小卖部，这些商品暂时就不属于我了，接下来我要用我需要拿来操作的钱包里的代币的objectId来操作，所以我又给我的钱包重新mint了代币，替换参数后，成功了。






\