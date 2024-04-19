# task 3

build：
```bash
❯ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task4
```

publush：
```bash
❯ sui client publish --gas-budget 50000000000 
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task4
Successfully verified dependencies on-chain against source.
Transaction Digest: FfCtrsZvNeHKb8gzfxxdRsVHtJBybhYSJpqH9L5x6xDN
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
│  │ Version: 13315012                                                                                         │
│  │ Digest: DYh77HCRaVcmFy46fQ5PGss2SxoPd2JVDc8DMau1RbhJ                                                      │
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
│    UYPLhyC8zIcNPajhaA375VmcjnUqQSghIcFmtrnti8KjpaGctuPnOrgBJnVjjB7uKRI0s6xZrbScxEvaDObTBw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: FfCtrsZvNeHKb8gzfxxdRsVHtJBybhYSJpqH9L5x6xDN                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4fe08569da20b91b0784c014be62f35fcaf372b0457adfaeba3ffa32949342ab                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 49svobHq2hdTUeocnhdgG7fuNV7sif8pRaiPHfQmusCH                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xdd201ed3dfa5fa2644767ccfb8fe37f68b90dd8417b66772c8bc3802ef344bb1                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13315013                                                                              │
│  │ Digest: DU7jnmXF4QJxjSk5AnGD1NVgjBRdZm8kXbQNrLGuGofF                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13315013                                                                              │
│  │ Digest: 4qW7kAmrTnUYJ1phF8JyGTDawwXNUmRn45HQaWVLg8X8                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 13315013                                                                              │
│  │ Digest: 4qW7kAmrTnUYJ1phF8JyGTDawwXNUmRn45HQaWVLg8X8                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9135200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    ndqgTWcVwvu9AZbKqvbwVjnbSky4dTqNx8YTzrAaX7u                                                    │
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
│  │ ObjectID: 0xdd201ed3dfa5fa2644767ccfb8fe37f68b90dd8417b66772c8bc3802ef344bb1                  │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                    │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 13315013                                                                             │
│  │ Digest: DU7jnmXF4QJxjSk5AnGD1NVgjBRdZm8kXbQNrLGuGofF                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                  │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                    │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 13315013                                                                             │
│  │ Digest: 4qW7kAmrTnUYJ1phF8JyGTDawwXNUmRn45HQaWVLg8X8                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x4fe08569da20b91b0784c014be62f35fcaf372b0457adfaeba3ffa32949342ab                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 49svobHq2hdTUeocnhdgG7fuNV7sif8pRaiPHfQmusCH                                          │
│  │ Modules: guess_dice_game                                                                      │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -9157080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

mint：
```bash
❯ sui client call  --function run --module guess_dice_game --package 0x4fe08569da20b91b0784c014be62f35fcaf372b0457adfaeba3ffa32949342ab --args 3  0x6 --gas-budget 50000000
Transaction Digest: vSRPM88UDiqUYPiqviCYYwXQ2z4XaTJcDwYm3aZj3hQ
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                      │
│ Gas Owner: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                   │
│ Gas Budget: 50000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                       │
│  │ Version: 29618224                                                                            │
│  │ Digest: Bwp3s1YEoAD5VpMg94LrxtP6CeCGGkX1E1PY48KY4Rk1                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: u64, Value: "3"                                                         │ │
│ │ 1   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  run                                                                │            │
│ │  │ Module:    guess_dice_game                                                    │            │
│ │  │ Package:   0x4fe08569da20b91b0784c014be62f35fcaf372b0457adfaeba3ffa32949342ab │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    GGpDdtZR0veXCVEnlLi4OF1Uvn+CfN8gWi1rs9qpjai+T7u1M1ZH3hbSnMWjlox/OBUoo11VQP+BV9jxsKBuBQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: vSRPM88UDiqUYPiqviCYYwXQ2z4XaTJcDwYm3aZj3hQ                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618237                                                                              │
│  │ Digest: EKAb2Kqpk3aahRon8kWbHJdvzCCBfhJjp9Wd5o8HvpVn                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 29618236                                                                              │
│  │ Digest: AcKy9YZE4LNKxZdn1FUEmEXagZkDvnMUq2Xz94u4qDVm                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                         │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ Version: 29618237                                                                              │
│  │ Digest: EKAb2Kqpk3aahRon8kWbHJdvzCCBfhJjp9Wd5o8HvpVn                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 988000 MIST                                                                      │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2vxdhS9Prn42dc4gKG5SYDLmGyGJJTzkDJnpn5MYfknT                                                   │
│    9b7Z6C83x1rN9B7A75LqBbNVNoKFCtt5oJxX79fiPaDZ                                                   │
│    FfCtrsZvNeHKb8gzfxxdRsVHtJBybhYSJpqH9L5x6xDN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                           │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                               │
│  │ EventID: vSRPM88UDiqUYPiqviCYYwXQ2z4XaTJcDwYm3aZj3hQ:0                                                          │
│  │ PackageID: 0x4fe08569da20b91b0784c014be62f35fcaf372b0457adfaeba3ffa32949342ab                                   │
│  │ Transaction Module: guess_dice_game                                                                             │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                                      │
│  │ EventType: 0x4fe08569da20b91b0784c014be62f35fcaf372b0457adfaeba3ffa32949342ab::guess_dice_game::RecordDiceModel │
│  │ ParsedJSON:                                                                                                     │
│  │   ┌───────────────┬────────────────────┐                                                                        │
│  │   │ action        │ movestudent failed │                                                                        │
│  │   ├───────────────┼────────────────────┤                                                                        │
│  │   │ github        │ movestudent        │                                                                        │
│  │   ├───────────────┼────────────────────┤                                                                        │
│  │   │ random_number │ 1                  │                                                                        │
│  │   ├───────────────┼────────────────────┤                                                                        │
│  │   │ result        │ false              │                                                                        │
│  │   ├───────────────┼────────────────────┤                                                                        │
│  │   │ user_number   │ 3                  │                                                                        │
│  │   └───────────────┴────────────────────┘                                                                        │
│  └──                                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xb658a418c800df11c887dcc72e1b69e85f4a66b48a97af49d9410c1717172377                  │
│  │ Sender: 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6                    │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 29618237                                                                             │
│  │ Digest: EKAb2Kqpk3aahRon8kWbHJdvzCCBfhJjp9Wd5o8HvpVn                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9891246a61d18b8de7005fcaee0cbe2d4a43e23aef176c7cdb5dc659e4c882a6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1009880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
