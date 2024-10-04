1. deploy
```
sui client publish     --gas-budget 200000000 sources/mygame.move  --skip-dependency-verification
[warn] Client/Server api version mismatch, client api version : 1.20.0, server api version : 1.20.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING game
Skipping dependency verification
Transaction Digest: 4dbBYbYeodB1cwt37aRjtu8uqNgRiuADfuis67ewMk91
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                   │
│ Gas Owner: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                │
│ Gas Budget: 200000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                                    │
│  │ Version: 79749911                                                                                         │
│  │ Digest: 5dRk75zjFgkxEV8wciDdqM7mRFsA2eTh3WM9CpChppvi                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85" │ │
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
│    BKnTS9dvitnVs11IyNKkga0aW24uRjB5BRfZUGTEMcwaDRZYRr1erVlg6yWAXWnLF2u1IrnPHnEEspZSh/kzAA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4dbBYbYeodB1cwt37aRjtu8uqNgRiuADfuis67ewMk91                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 343                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5e36cc91758e7843829f232b16015471e7ff1ef053407b3a7e3085580eae16f5                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749912                                                                              │
│  │ Digest: 4htZ6Xff2WAWXAbM69ofWXjkYGDDAxzceeoQcZNGaiwn                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9d0546da0d1ff569ff9cac280d817016cf5be1b22070b4be7be9fcdf334f2336                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 9RVAvcnTPuKBcRKXFiaeafAVWMiMcpSrkxwger7TjasX                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749912                                                                              │
│  │ Digest: 6P7BfQ3BZaiVQ6fjBekB7kSpdKjQLCvGSksUeSNogH6D                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749912                                                                              │
│  │ Digest: 6P7BfQ3BZaiVQ6fjBekB7kSpdKjQLCvGSksUeSNogH6D                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8922400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    7FtUuSqeZ9VRGbrMs38To5Qf4qd9nuVf43Xo4G6YL8Sz                                                   │
│    CPjiAuoB6s1DGhoTwyF6r5AsuRH6mwf4eq6rkspu1Gbe                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x5e36cc91758e7843829f232b16015471e7ff1ef053407b3a7e3085580eae16f5                  │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                    │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 79749912                                                                             │
│  │ Digest: 4htZ6Xff2WAWXAbM69ofWXjkYGDDAxzceeoQcZNGaiwn                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                  │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                    │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 79749912                                                                             │
│  │ Digest: 6P7BfQ3BZaiVQ6fjBekB7kSpdKjQLCvGSksUeSNogH6D                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x9d0546da0d1ff569ff9cac280d817016cf5be1b22070b4be7be9fcdf334f2336                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 9RVAvcnTPuKBcRKXFiaeafAVWMiMcpSrkxwger7TjasX                                          │
│  │ Modules: mygame                                                                               │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8694280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
2. play
```
sui client call --function play --module mygame --package 0x9d0546da0d1ff569ff9cac280d817016cf5be1b22070b4be7be9fcdf334f2336 --args 1 0x6 --gas-budget 90000000
[warn] Client/Server api version mismatch, client api version : 1.20.0, server api version : 1.20.1
Transaction Digest: BJbih1r6Zj4EuFxYZrvLzkzSZrSko9FKAs68kCV1XivT
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                      │
│ Gas Owner: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                   │
│ Gas Budget: 90000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                       │
│  │ Version: 79749912                                                                            │
│  │ Digest: 6P7BfQ3BZaiVQ6fjBekB7kSpdKjQLCvGSksUeSNogH6D                                         │
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
│ │  │ Function:  play                                                               │            │
│ │  │ Module:    mygame                                                             │            │
│ │  │ Package:   0x9d0546da0d1ff569ff9cac280d817016cf5be1b22070b4be7be9fcdf334f2336 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    nM2WWCPLLQ33yfdn//a8WCuV/mnQPRAgtA/eqI/bMSa5+8WuEwJg3NJwcDH/Qi95ETIVM5uePFIulK8eQvf1Cw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BJbih1r6Zj4EuFxYZrvLzkzSZrSko9FKAs68kCV1XivT                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 343                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749913                                                                              │
│  │ Digest: G8hTRDvyEdsGm984NonFCwdzFSp8vyWmiVn3ci6uqn2w                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 29337382                                                                              │
│  │ Digest: 9r8PcMpspnGj8MpkWpVrPo4oUPVk2LCWZSyaGjs6U7ju                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749913                                                                              │
│  │ Digest: G8hTRDvyEdsGm984NonFCwdzFSp8vyWmiVn3ci6uqn2w                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 988000 MIST                                                                      │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4dbBYbYeodB1cwt37aRjtu8uqNgRiuADfuis67ewMk91                                                   │
│    BuiyfHZHn5mSCiFzHDwys8BgDzsYtNx3Ym6Du8NqVuDd                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                 │
│  │ EventID: BJbih1r6Zj4EuFxYZrvLzkzSZrSko9FKAs68kCV1XivT:0                                           │
│  │ PackageID: 0x9d0546da0d1ff569ff9cac280d817016cf5be1b22070b4be7be9fcdf334f2336                     │
│  │ Transaction Module: mygame                                                                        │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                        │
│  │ EventType: 0x9d0546da0d1ff569ff9cac280d817016cf5be1b22070b4be7be9fcdf334f2336::mygame::GameResult │
│  │ ParsedJSON:                                                                                       │
│  │   ┌─────────────────┬──────────┐                                                                  │
│  │   │ computer_number │ 5        │                                                                  │
│  │   ├─────────────────┼──────────┤                                                                  │
│  │   │ result          │ you lose │                                                                  │
│  │   ├─────────────────┼──────────┤                                                                  │
│  │   │ your_number     │ 1        │                                                                  │
│  │   └─────────────────┴──────────┘                                                                  │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                  │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                    │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 79749913                                                                             │
│  │ Digest: G8hTRDvyEdsGm984NonFCwdzFSp8vyWmiVn3ci6uqn2w                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -759880                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```