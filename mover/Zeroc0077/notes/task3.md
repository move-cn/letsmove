# Task3

Deploy:
```bash
❯ sui client publish --gas-budget 50000000 .
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING nft
Successfully verified dependencies on-chain against source.
Transaction Digest: 9DSBMBsg5M5nNVCK8qC7VMeX8mnSXtS6VepjuVAPmZdp
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                   │
│ Gas Owner: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                                    │
│  │ Version: 81601566                                                                                         │
│  │ Digest: 7E7EffZL9Jm3RZUUAq3jy2nZy8cCu1Ej1NfsaJhSDBm4                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6" │ │
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
│    cee6CiDMOV3ppEkJZTRsrMspu2Ald/WbwRl7cwWt6XvQ0b7REV3uXt8LnoDlThjmzuBoRJ0naWeszqTQ52H1Dg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9DSBMBsg5M5nNVCK8qC7VMeX8mnSXtS6VepjuVAPmZdp                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 348                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x18afe75a134aecb6c4ae7da558c33586ffa755e0afe04d64a02bf2e5b7f4271c                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601567                                                                              │
│  │ Digest: 8GuzyadSnj3HpiQz9KQURfFWhHrbK6iefWkuqMAA5UDy                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x476f64d10937fa395cb9e1d2985ae1cafaed35fcf1d4195d613bbee9208c464e                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Dan8FK92cDcv5xiLX8eDd8vuqGQWbujvQM7LSfp34Cdm                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6a4b020633b352dbbc22f9692c45f8e9664297215ce9e97a6c90c527e6d6fd09                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601567                                                                              │
│  │ Digest: BMDsjfioezKwySwqxiCF8H7kRqmArcEH7kwcMLftMDVA                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xfc15561cf62ddba57ee2631f48ced334a51d97b69918b1dfad8def0af7b31667                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601567                                                                              │
│  │ Digest: Bw93PZ72GnZ22W2qKj29CNV9b3c3492abrMGUo2XpPHB                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601567                                                                              │
│  │ Digest: DrbiijBbKSRdwETkgEa5c6fG1EaUBfkjDzBuHBsdmuAv                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601567                                                                              │
│  │ Digest: DrbiijBbKSRdwETkgEa5c6fG1EaUBfkjDzBuHBsdmuAv                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 15488800 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    7FtUuSqeZ9VRGbrMs38To5Qf4qd9nuVf43Xo4G6YL8Sz                                                   │
│    GWo7ijVNgDW7vY68Z54PRVfvVChUTwUrjA7ecLi14uwY                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                         │
│  │ EventID: 9DSBMBsg5M5nNVCK8qC7VMeX8mnSXtS6VepjuVAPmZdp:0                                                                   │
│  │ PackageID: 0x476f64d10937fa395cb9e1d2985ae1cafaed35fcf1d4195d613bbee9208c464e                                             │
│  │ Transaction Module: mynft                                                                                                 │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                                │
│  │ EventType: 0x2::display::DisplayCreated<0x476f64d10937fa395cb9e1d2985ae1cafaed35fcf1d4195d613bbee9208c464e::mynft::Zeroc> │
│  │ ParsedJSON:                                                                                                               │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                             │
│  │   │ id │ 0x18afe75a134aecb6c4ae7da558c33586ffa755e0afe04d64a02bf2e5b7f4271c │                                             │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                             │
│  └──                                                                                                                         │
│  ┌──                                                                                                                         │
│  │ EventID: 9DSBMBsg5M5nNVCK8qC7VMeX8mnSXtS6VepjuVAPmZdp:1                                                                   │
│  │ PackageID: 0x476f64d10937fa395cb9e1d2985ae1cafaed35fcf1d4195d613bbee9208c464e                                             │
│  │ Transaction Module: mynft                                                                                                 │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                                │
│  │ EventType: 0x2::display::VersionUpdated<0x476f64d10937fa395cb9e1d2985ae1cafaed35fcf1d4195d613bbee9208c464e::mynft::Zeroc> │
│  │ ParsedJSON:                                                                                                               │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                        │
│  │   │ fields  │ contents │ key   │ name                                            │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ value │ zeroc                                           │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ key   │ description                                     │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ value │ A sample NFT for zeroc                          │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ key   │ image_url                                       │                                        │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                        │
│  │   │         │          │ value │ https://img.zeroc0077.cn/avatar.png             │                                        │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                        │
│  │   │ id      │ 0x18afe75a134aecb6c4ae7da558c33586ffa755e0afe04d64a02bf2e5b7f4271c │                                        │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                        │
│  │   │ version │ 1                                                                  │                                        │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                        │
│  └──                                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                          │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                        │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0x18afe75a134aecb6c4ae7da558c33586ffa755e0afe04d64a02bf2e5b7f4271c                                         │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                           │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )                        │
│  │ ObjectType: 0x2::display::Display<0x476f64d10937fa395cb9e1d2985ae1cafaed35fcf1d4195d613bbee9208c464e::mynft::Zeroc>  │
│  │ Version: 81601567                                                                                                    │
│  │ Digest: 8GuzyadSnj3HpiQz9KQURfFWhHrbK6iefWkuqMAA5UDy                                                                 │
│  └──                                                                                                                    │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0x6a4b020633b352dbbc22f9692c45f8e9664297215ce9e97a6c90c527e6d6fd09                                         │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                           │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )                        │
│  │ ObjectType: 0x2::package::Publisher                                                                                  │
│  │ Version: 81601567                                                                                                    │
│  │ Digest: BMDsjfioezKwySwqxiCF8H7kRqmArcEH7kwcMLftMDVA                                                                 │
│  └──                                                                                                                    │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0xfc15561cf62ddba57ee2631f48ced334a51d97b69918b1dfad8def0af7b31667                                         │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                           │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )                        │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                 │
│  │ Version: 81601567                                                                                                    │
│  │ Digest: Bw93PZ72GnZ22W2qKj29CNV9b3c3492abrMGUo2XpPHB                                                                 │
│  └──                                                                                                                    │
│ Mutated Objects:                                                                                                        │
│  ┌──                                                                                                                    │
│  │ ObjectID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                                         │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                           │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )                        │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                           │
│  │ Version: 81601567                                                                                                    │
│  │ Digest: DrbiijBbKSRdwETkgEa5c6fG1EaUBfkjDzBuHBsdmuAv                                                                 │
│  └──                                                                                                                    │
│ Published Objects:                                                                                                      │
│  ┌──                                                                                                                    │
│  │ PackageID: 0x476f64d10937fa395cb9e1d2985ae1cafaed35fcf1d4195d613bbee9208c464e                                        │
│  │ Version: 1                                                                                                           │
│  │ Digest: Dan8FK92cDcv5xiLX8eDd8vuqGQWbujvQM7LSfp34Cdm                                                                 │
│  │ Modules: mynft                                                                                                       │
│  └──                                                                                                                    │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -15260680                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

Transfer:
```bash
❯ sui client call --package 0x476f64d10937fa395cb9e1d2985ae1cafaed35fcf1d4195d613bbee9208c464e --module mynft --function mint --args "Sample NFT" "Test" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000
Transaction Digest: 5Ygh15qx5vn4FSPAU75z27oWaZUrxAZMQay8JwufmPxL
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                   │
│ Gas Owner: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                                    │
│  │ Version: 81601567                                                                                         │
│  │ Digest: DrbiijBbKSRdwETkgEa5c6fG1EaUBfkjDzBuHBsdmuAv                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "Sample NFT"                                                      │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "Test"                                                            │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mynft                                                              │                         │
│ │  │ Package:   0x476f64d10937fa395cb9e1d2985ae1cafaed35fcf1d4195d613bbee9208c464e │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    s63JcbjxaBakpyEm9QgVjm+ugctTPk1pp3nFjWD4IB4jgxA3e8Fwfn/zfLNy0VH89wUUFWDvDKI4YJHri7uGAw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5Ygh15qx5vn4FSPAU75z27oWaZUrxAZMQay8JwufmPxL                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 348                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x224b9de17af57c4258867219b7da4463cacb57f99f17ab43e613bdc44e71065f                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 81601568                                                                              │
│  │ Digest: ZUv5mzQDTZwadkiQttA8v8Ud5pU2DiTBtfjjsst4kMR                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601568                                                                              │
│  │ Digest: 6zRy8Ahj4MpgBj97GcwuSCJekK72UAa2kUoGTyyc1Wjj                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 81601568                                                                              │
│  │ Digest: 6zRy8Ahj4MpgBj97GcwuSCJekK72UAa2kUoGTyyc1Wjj                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2378800 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    9DSBMBsg5M5nNVCK8qC7VMeX8mnSXtS6VepjuVAPmZdp                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x224b9de17af57c4258867219b7da4463cacb57f99f17ab43e613bdc44e71065f                  │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                    │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 ) │
│  │ ObjectType: 0x476f64d10937fa395cb9e1d2985ae1cafaed35fcf1d4195d613bbee9208c464e::mynft::Zeroc  │
│  │ Version: 81601568                                                                             │
│  │ Digest: ZUv5mzQDTZwadkiQttA8v8Ud5pU2DiTBtfjjsst4kMR                                           │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x6a2704b6c81c15f78a114e6840e1464267e812f06639da74fd7f24fddddcb14a                  │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                    │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 81601568                                                                             │
│  │ Digest: 6zRy8Ahj4MpgBj97GcwuSCJekK72UAa2kUoGTyyc1Wjj                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2150680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```