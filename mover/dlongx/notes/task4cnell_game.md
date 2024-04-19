PS D:\sui m\study\cnell_game> sui client publish --gas-budget=50000000 
[warn] Client/Server api version mismatch, client api version : 1.22.0, server api version : 1.23.0
UPDATING GIT DEPENDENCY https://gitee.com/WGB5445/sui.git
INCLUDING DEPENDENCY Sui       
INCLUDING DEPENDENCY MoveStdlib
BUILDING cnell_game
Successfully verified dependencies on-chain against source.
Transaction Digest: 5FEB8uzDFapjM5WXY6d8TcDqCmBRDS4Auk2XW4fbwow6
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                                   │
│ Gas Owner: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                                    │
│  │ Version: 636380                                                                                           │
│  │ Digest: 96DgkaykYBy8u7SGRoj4kn9vzV9dGbdnxuEMNiCkjUGN                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4" │ │
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
│    AN5LNU2a1qZJItPnnr98RrfPQCOGoUf2e0D4SlJEciggKLQEm6OaRqblGlKNRXz8t9WCiiAY10JuLj8nE/aCEg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5FEB8uzDFapjM5WXY6d8TcDqCmBRDS4Auk2XW4fbwow6                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 343                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0074817f39d5a5a9e3968eb3a32df0b9d3b5cac4fc68b0c0c145379807256c3d                         │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ Version: 636381                                                                                │
│  │ Digest: BYiroQevV2xGXERzS4E8bxzJkUdt17vMDufKvA6J4EfS                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x7df2eb4d0e57fd731a8eca34bb98c16c6f6f91a4912c3d074600fb9400704ca1                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 871todeiw5CfLHfpA26DuV9y4WZRTkZgnhjs7QY97Tog                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                         │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ Version: 636381                                                                                │
│  │ Digest: HpjqFvgX1MCT5d1Yo1mGvQGvxSVPkfgnAQUoQBvBUHCE                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                         │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ Version: 636381                                                                                │
│  │ Digest: HpjqFvgX1MCT5d1Yo1mGvQGvxSVPkfgnAQUoQBvBUHCE                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 10906000 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2jA43baApQ761R8B16z3f1WvoXTqjCw9CwcnUVVrxZR8                                                   │
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
│  │ ObjectID: 0x0074817f39d5a5a9e3968eb3a32df0b9d3b5cac4fc68b0c0c145379807256c3d                  │
│  │ Sender: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                    │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 636381                                                                               │
│  │ Digest: BYiroQevV2xGXERzS4E8bxzJkUdt17vMDufKvA6J4EfS                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                  │
│  │ Sender: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                    │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 636381                                                                               │
│  │ Digest: HpjqFvgX1MCT5d1Yo1mGvQGvxSVPkfgnAQUoQBvBUHCE                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  │ PackageID: 0x7df2eb4d0e57fd731a8eca34bb98c16c6f6f91a4912c3d074600fb9400704ca1                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 871todeiw5CfLHfpA26DuV9y4WZRTkZgnhjs7QY97Tog                                          │
│  │ Modules: cnell_game                                                                           │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -10927880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
PS D:\sui m\study\cnell_game> ^C
PS D:\sui m\study\cnell_game> ^C
PS D:\sui m\study\cnell_game> sui client call --gas-budget 7500000 --package 0x7df2eb4d0e57fd731a8eca34bb98c16c6f6f91a4912c3d074600fb9400704ca1 --module cnell_game --function play --args 2 0x6
[warn] Client/Server api version mismatch, client api version : 1.22.0, server api version : 1.23.0
Transaction Digest: 3JQEocNsn61ymbjSfvCJa6dNYf6BVFKx5gAMyMMMWuKK
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                      │
│ Gas Owner: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                   │
│ Gas Budget: 7500000 MIST                                                                        │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                       │
│  │ Version: 636381                                                                              │
│  │ Digest: HpjqFvgX1MCT5d1Yo1mGvQGvxSVPkfgnAQUoQBvBUHCE                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: u8, Value: 2                                                            │ │
│ │ 1   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  play                                                               │            │
│ │  │ Module:    cnell_game                                                         │            │
│ │  │ Package:   0x7df2eb4d0e57fd731a8eca34bb98c16c6f6f91a4912c3d074600fb9400704ca1 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    zpWeadIG5Z7PvF4Fb627mOdKsTwce4qIJ6j/ZaM58AdDas1xJowxiQT1HYmF4uiqzCpUvrohpb5StEzcuBeZmg==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3JQEocNsn61ymbjSfvCJa6dNYf6BVFKx5gAMyMMMWuKK                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 343                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                         │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ Version: 29517290                                                                              │
│  │ Digest: En5qR3y27dBktXVKULXSSDLNsLS9mgsgBDpS4PbcRR2X                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 29517289                                                                              │
│  │ Digest: GAzFE174Nty5D8PiyNxaLbfnzN5dTgdmF4dmhBTE8o9p                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                         │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ Version: 29517290                                                                              │
│  │ Digest: En5qR3y27dBktXVKULXSSDLNsLS9mgsgBDpS4PbcRR2X                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 988000 MIST                                                                      │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    5FEB8uzDFapjM5WXY6d8TcDqCmBRDS4Auk2XW4fbwow6                                                   │
│    DAnM2noBwkNbSbibQrZBiG3jqqaLNgNmW3v8hfX2FN26                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                          │
│  │ EventID: 3JQEocNsn61ymbjSfvCJa6dNYf6BVFKx5gAMyMMMWuKK:0                                                    │
│  │ PackageID: 0x7df2eb4d0e57fd731a8eca34bb98c16c6f6f91a4912c3d074600fb9400704ca1                              │
│  │ Transaction Module: cnell_game                                                                             │
│  │ Sender: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                                 │
│  │ EventType: 0x7df2eb4d0e57fd731a8eca34bb98c16c6f6f91a4912c3d074600fb9400704ca1::cnell_game::GameResultEvent │
│  │ ParsedJSON:                                                                                                │
│  │   ┌─────────────────┬──────────┐                                                                           │
│  │   │ computer_choice │ rock     │                                                                           │
│  │   ├─────────────────┼──────────┤                                                                           │
│  │   │ is_win          │ true     │                                                                           │
│  │   ├─────────────────┼──────────┤                                                                           │
│  │   │ result          │ Win      │                                                                           │
│  │   ├─────────────────┼──────────┤                                                                           │
│  │   │ your_choice     │ scissors │                                                                           │
│  │   └─────────────────┴──────────┘                                                                           │
│  └──                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  │ ObjectID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                  │
│  │ Sender: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                    │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 29517290                                                                             │
│  │ Digest: En5qR3y27dBktXVKULXSSDLNsLS9mgsgBDpS4PbcRR2X                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1009880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
PS D:\sui m\study\cnell_game> sui client call --gas-budget 7500000 --package 0x7df2eb4d0e57fd731a8eca34bb98c16c6f6f91a4912c3d074600fb9400704ca1 --module cnell_game --function play --args 0 0x6
[warn] Client/Server api version mismatch, client api version : 1.22.0, server api version : 1.23.0
Transaction Digest: A9gg7iDYcmwDQWjaUzQQrWZRbCidd7ACYxhTHxkkNTPB
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                      │
│ Gas Owner: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                   │
│ Gas Budget: 7500000 MIST                                                                        │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                       │
│  │ Version: 29517290                                                                            │
│  │ Digest: En5qR3y27dBktXVKULXSSDLNsLS9mgsgBDpS4PbcRR2X                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: u8, Value: 0                                                            │ │
│ │ 1   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  play                                                               │            │
│ │  │ Module:    cnell_game                                                         │            │
│ │  │ Package:   0x7df2eb4d0e57fd731a8eca34bb98c16c6f6f91a4912c3d074600fb9400704ca1 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    UIDO1Zqj3uCzZmEe6ilQI03XgJoYFj98EHsqPzMerhhB2M9L6Hh+sYMrzIntcd5wZQ9cYj1wqFgH2G0ktU9Fxg==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: A9gg7iDYcmwDQWjaUzQQrWZRbCidd7ACYxhTHxkkNTPB                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 343                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                         │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ Version: 29517314                                                                              │
│  │ Digest: CyBx1ScxGFe9zvYsWif3t9wdZjv1vs56eWReqBwJRzzQ                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 29517313                                                                              │
│  │ Digest: Akb3qhP6E7emg12c7YeKkqLaGyFwCETCnfGKUdeiPPHg                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                         │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ Version: 29517314                                                                              │
│  │ Digest: CyBx1ScxGFe9zvYsWif3t9wdZjv1vs56eWReqBwJRzzQ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 988000 MIST                                                                      │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3JQEocNsn61ymbjSfvCJa6dNYf6BVFKx5gAMyMMMWuKK                                                   │
│    5FEB8uzDFapjM5WXY6d8TcDqCmBRDS4Auk2XW4fbwow6                                                   │
│    6xidfEuKXApRysZKMQ5NnRroCAFumnYiitNENy4AbVx9                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                          │
│  │ EventID: A9gg7iDYcmwDQWjaUzQQrWZRbCidd7ACYxhTHxkkNTPB:0                                                    │
│  │ PackageID: 0x7df2eb4d0e57fd731a8eca34bb98c16c6f6f91a4912c3d074600fb9400704ca1                              │
│  │ Transaction Module: cnell_game                                                                             │
│  │ Sender: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                                 │
│  │ EventType: 0x7df2eb4d0e57fd731a8eca34bb98c16c6f6f91a4912c3d074600fb9400704ca1::cnell_game::GameResultEvent │
│  │ ParsedJSON:                                                                                                │
│  │   ┌─────────────────┬───────┐                                                                              │
│  │   │ computer_choice │ rock  │                                                                              │
│  │   ├─────────────────┼───────┤                                                                              │
│  │   │ is_win          │ false │                                                                              │
│  │   ├─────────────────┼───────┤                                                                              │
│  │   │ result          │ Draw  │                                                                              │
│  │   ├─────────────────┼───────┤                                                                              │
│  │   │ your_choice     │ rock  │                                                                              │
│  │   └─────────────────┴───────┘                                                                              │
│  └──                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                  │
│  │ Sender: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                    │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 29517314                                                                             │
│  │ Digest: CyBx1ScxGFe9zvYsWif3t9wdZjv1vs56eWReqBwJRzzQ                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1009880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯