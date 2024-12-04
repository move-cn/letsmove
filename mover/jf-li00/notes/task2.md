## Deployment
```bash
sui client publish --gas-budget 500000000
```

```
Transaction Digest: 6q9tw1k9gRHAF8PcUVQZyGELBtHk11sgZqhjCUfPUEU3
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28                                   │
│ Gas Owner: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28                                │
│ Gas Budget: 500000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72                                    │
│  │ Version: 960148                                                                                           │
│  │ Digest: 6UMdQ6CD7qPxS3doRpL3HFYHUFPE6g4dmvbHBwrSh5sD                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28" │ │
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
│    p35IZEYmmk8h5MWPR7RkActPn24FFERl/zRCxQp/Q0zqBjDI2Roh4zyWk4azlfZNs+/E5P6Zgm79LLomuMOUBQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6q9tw1k9gRHAF8PcUVQZyGELBtHk11sgZqhjCUfPUEU3                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 333                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0f6de449ee68a42134c33a60592f9aca315e85f822ca02daa16f7399eb9eb5d3                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 960149                                                                                │
│  │ Digest: D2QLugs3v1xJP9UWGYkCtE6iMdqcZAvS294nZbBM6VSF                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3ba933a489d00db521914d7d3265b3aa901b37f86c2d241d4f7ea8feb0835fc5                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: DhqS5nMvojYLbTap1diJQG7jwXSDLEZWVhAEbdkcZZjQ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3e78062579421ab4d5aac552bcaa644f204aea01fa8ccd5c3caef131147ceb15                         │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ Version: 960149                                                                                │
│  │ Digest: 3AcmcACDMWySNNz8kBVQeQHc58hn2xDJjGQS6PvZsgzR                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5c65ac3ef69b0a3fec4707d85307002666ee521024b2fbd455808795421558ea                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 960149                                                                                │
│  │ Digest: Gq8XUMshwLW3rzXe36XR5362ryGQQkqdgDqL9jvpThWk                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xef7606f2eca815e6dcf6f2f2c8da5e90b2ae06d01d87241fc06bcfb9997d5f30                         │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ Version: 960149                                                                                │
│  │ Digest: 6N6gMUhygCPwrs9cuxtJ1ugWmqw6Tz1axoFnE4vkZLqs                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf05da11d63f6a1ff871387a739cbfec05743f7cdf8e284f09ba5df9e4669a804                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 960149                                                                                │
│  │ Digest: 3DE1SJAuz6T1x8HDoXwF1yipUQNLmUD7hsNbcFwSQr1y                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72                         │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ Version: 960149                                                                                │
│  │ Digest: BSi4n2bd1tEqndPUXgZdAYio96tqZQLkYaZj3SKrMHL                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72                         │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ Version: 960149                                                                                │
│  │ Digest: BSi4n2bd1tEqndPUXgZdAYio96tqZQLkYaZj3SKrMHL                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 21530800 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3uUoCHQoaSDarVzUE4Ug69G8ahvQtY1CtZHnJu2kJ2rk                                                   │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes
                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:
                │
│  ┌──
                │
│  │ ObjectID: 0x0f6de449ee68a42134c33a60592f9aca315e85f822ca02daa16f7399eb9eb5d3
                │
│  │ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28
                │
│  │ Owner: Immutable
                │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x3ba933a489d00db521914d7d3265b3aa901b37f86c2d241d4f7ea8feb0835fc5::my_coin::MY_COIN>          │
│  │ Version: 960149
                │
│  │ Digest: D2QLugs3v1xJP9UWGYkCtE6iMdqcZAvS294nZbBM6VSF
                │
│  └──
                │
│  ┌──
                │
│  │ ObjectID: 0x3e78062579421ab4d5aac552bcaa644f204aea01fa8ccd5c3caef131147ceb15
                │
│  │ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28
                │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )
                │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x3ba933a489d00db521914d7d3265b3aa901b37f86c2d241d4f7ea8feb0835fc5::my_coin::MY_COIN>           │
│  │ Version: 960149
                │
│  │ Digest: 3AcmcACDMWySNNz8kBVQeQHc58hn2xDJjGQS6PvZsgzR
                │
│  └──
                │
│  ┌──
                │
│  │ ObjectID: 0x5c65ac3ef69b0a3fec4707d85307002666ee521024b2fbd455808795421558ea
                │
│  │ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28
                │
│  │ Owner: Immutable
                │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x3ba933a489d00db521914d7d3265b3aa901b37f86c2d241d4f7ea8feb0835fc5::faucet_coin::FAUCET_COIN>  │
│  │ Version: 960149
                │
│  │ Digest: Gq8XUMshwLW3rzXe36XR5362ryGQQkqdgDqL9jvpThWk
                │
│  └──
                │
│  ┌──
                │
│  │ ObjectID: 0xef7606f2eca815e6dcf6f2f2c8da5e90b2ae06d01d87241fc06bcfb9997d5f30
                │
│  │ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28
                │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )
                │
│  │ ObjectType: 0x2::package::UpgradeCap
                │
│  │ Version: 960149
                │
│  │ Digest: 6N6gMUhygCPwrs9cuxtJ1ugWmqw6Tz1axoFnE4vkZLqs
                │
│  └──
                │
│  ┌──
                │
│  │ ObjectID: 0xf05da11d63f6a1ff871387a739cbfec05743f7cdf8e284f09ba5df9e4669a804
                │
│  │ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28
                │
│  │ Owner: Shared
                │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x3ba933a489d00db521914d7d3265b3aa901b37f86c2d241d4f7ea8feb0835fc5::faucet_coin::FAUCET_COIN>   │
│  │ Version: 960149
                │
│  │ Digest: 3DE1SJAuz6T1x8HDoXwF1yipUQNLmUD7hsNbcFwSQr1y
                │
│  └──
                │
│ Mutated Objects:
                │
│  ┌──
                │
│  │ ObjectID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72
                │
│  │ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28
                │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )
                │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>
                │
│  │ Version: 960149
                │
│  │ Digest: BSi4n2bd1tEqndPUXgZdAYio96tqZQLkYaZj3SKrMHL
                │
│  └──
                │
│ Published Objects:
                │
│  ┌──
                │
│  │ PackageID: 0x3ba933a489d00db521914d7d3265b3aa901b37f86c2d241d4f7ea8feb0835fc5
                │
│  │ Version: 1
                │
│  │ Digest: DhqS5nMvojYLbTap1diJQG7jwXSDLEZWVhAEbdkcZZjQ
                │
│  │ Modules: faucet_coin, my_coin
                │
│  └──
                │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -21552680                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

### Transfer to certain address
```bash
sui client call --function mint_for --module my_coin --package $PACKAGE_ID --args 0x3e78062579421ab4d5aac552bcaa644f204aea01fa8ccd5c3caef131147ceb15 100000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 
```

Output:
```
Transaction Digest: HD3aBrnZPZsP6oHAQsfKY38Q7dRevf9XQc7HHocG9TUX
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28                                   │
│ Gas Owner: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72                                    │
│  │ Version: 960150                                                                                           │
│  │ Digest: 4EumJXEMkBDUXYbRzY3qM7MvYzUDmAJ5RkSdNdf7GVRc                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x3e78062579421ab4d5aac552bcaa644f204aea01fa8ccd5c3caef131147ceb15              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100000"                                                                 │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint_for                                                           │                         │
│ │  │ Module:    my_coin                                                            │                         │
│ │  │ Package:   0x3ba933a489d00db521914d7d3265b3aa901b37f86c2d241d4f7ea8feb0835fc5 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    JqC6pj/CH+GlBZXGvAjvHL1PXTY0/gIUCwWSLT7eKe5se0KugGr0H5SYcQ0KBM5Iz8zccucdY6rqDGaJ0cn5Cg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HD3aBrnZPZsP6oHAQsfKY38Q7dRevf9XQc7HHocG9TUX                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 333                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8d3dce9d3d7838f7b2399d6a804fd2e7fc5083689cda18e91d2ff9fbb7b951b4                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 960151                                                                                │
│  │ Digest: AoQZehSMdyur8SWTPcTQ81CqQcsPhj2NZ8gCW2CxQqXN                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3e78062579421ab4d5aac552bcaa644f204aea01fa8ccd5c3caef131147ceb15                         │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ Version: 960151                                                                                │
│  │ Digest: BkZXtJBTC4jQiHmRBUB5gVriY4PrMUAJq1V1KMnMgcah                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72                         │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ Version: 960151                                                                                │
│  │ Digest: HusRtzZK369Fqdu7wVwsKpV9aHbe3XdYheeXoFofR2gY                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72                         │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )  │
│  │ Version: 960151                                                                                │
│  │ Digest: HusRtzZK369Fqdu7wVwsKpV9aHbe3XdYheeXoFofR2gY                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4104000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2708640 MIST                                                                   │
│    Non-refundable Storage Fee: 27360 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6q9tw1k9gRHAF8PcUVQZyGELBtHk11sgZqhjCUfPUEU3                                                   │
│    E3uinBUjyhSPJhUK1j8avdB7BvkFmS3ySqj9LCHauctg                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes
       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:
       │
│  ┌──
       │
│  │ ObjectID: 0x8d3dce9d3d7838f7b2399d6a804fd2e7fc5083689cda18e91d2ff9fbb7b951b4
       │
│  │ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28
       │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )
       │
│  │ ObjectType: 0x2::coin::Coin<0x3ba933a489d00db521914d7d3265b3aa901b37f86c2d241d4f7ea8feb0835fc5::my_coin::MY_COIN>         │
│  │ Version: 960151
       │
│  │ Digest: AoQZehSMdyur8SWTPcTQ81CqQcsPhj2NZ8gCW2CxQqXN
       │
│  └──
       │
│ Mutated Objects:
       │
│  ┌──
       │
│  │ ObjectID: 0x3e78062579421ab4d5aac552bcaa644f204aea01fa8ccd5c3caef131147ceb15
       │
│  │ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28
       │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )
       │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x3ba933a489d00db521914d7d3265b3aa901b37f86c2d241d4f7ea8feb0835fc5::my_coin::MY_COIN>  │
│  │ Version: 960151
       │
│  │ Digest: BkZXtJBTC4jQiHmRBUB5gVriY4PrMUAJq1V1KMnMgcah
       │
│  └──
       │
│  ┌──
       │
│  │ ObjectID: 0x833e3be3457d42b94eeaf5372c9180eff19ed933d03ba16faeb0dd035f82ef72
       │
│  │ Sender: 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28
       │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )
       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>
       │
│  │ Version: 960151
       │
│  │ Digest: HusRtzZK369Fqdu7wVwsKpV9aHbe3XdYheeXoFofR2gY
       │
│  └──
       │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                    │
├────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                               │
│  │ Owner: Account Address ( 0x10b290db74fa60decffc2f94d173013f668e316c00807328517c007c5d76bb28 )   │
│  │ CoinType: 0x2::sui::SUI                                                                         │
│  │ Amount: -2395360                                                                                │
│  └──                                                                                               │
│  ┌──                                                                                               │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )   │
│  │ CoinType: 0x3ba933a489d00db521914d7d3265b3aa901b37f86c2d241d4f7ea8feb0835fc5::my_coin::MY_COIN  │
│  │ Amount: 100000                                                                                  │
│  └──                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────╯

```