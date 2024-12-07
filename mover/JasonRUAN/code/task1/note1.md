# Task1学习笔记

## 编译
```bash
$ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
```

## 部署
```bash
$ sui client publish
[warn] Client/Server api version mismatch, client api version : 1.37.1, server api version : 1.38.3
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
Successfully verified dependencies on-chain against source.
Transaction Digest: 66vepWYjCYEzGwWKZVh135dzUmXA3Uw2PZ1HHc77m6s6
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27                                   │
│ Gas Owner: 0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27                                │
│ Gas Budget: 11925600 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x3d9ef475bc87cebda7146803d737efa905070a9c33f15f6d1fda28451ba78cb5                                    │
│  │ Version: 266310105                                                                                        │
│  │ Digest: 2ucTLb89PaEchy4CsCXfR5e4anQ5FmGNUZ3vh9sYWK61                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27" │ │
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
│    rgy3Qw5YFpLkyWpfNM2CazrTsIdc0KHzm8zfT7oTC/5J2C5rwaRQnIlT9CMB0/YBTwliYpWiQ9OKNUpPKjyEDA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 66vepWYjCYEzGwWKZVh135dzUmXA3Uw2PZ1HHc77m6s6                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 572                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x971982a042baf8619b1ac6901afa5f315a7412fab1bfb8a35ae1f25dd8b2c189                         │
│  │ Owner: Account Address ( 0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27 )  │
│  │ Version: 266310106                                                                             │
│  │ Digest: 7f8Bm6BTbUzXgrsZmT4q5MuCyFD9C7Z75SwoP1X49ntD                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa81975ce5222f861b95b518715e3a1e7510cb753b02586a69f3cb45b879bd32c                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 7b259PFT6DHXorZR2vtXfFJVsRc1oiproD8tgrbZDRxb                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf5d3dd430455c7a45f69eb0b6768350f10699b6a8f9e1c314eb9d99b1aa5ed15                         │
│  │ Owner: Account Address ( 0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27 )  │
│  │ Version: 266310106                                                                             │
│  │ Digest: 2F1CKHCffYa2V6KGkXL9AWi7Vw2FYzGn1S723XZFympw                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3d9ef475bc87cebda7146803d737efa905070a9c33f15f6d1fda28451ba78cb5                         │
│  │ Owner: Account Address ( 0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27 )  │
│  │ Version: 266310106                                                                             │
│  │ Digest: C2FFpjS25QDvRhr7NU6imRifxyKHmz1sKKYA8rxYsuLZ                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3d9ef475bc87cebda7146803d737efa905070a9c33f15f6d1fda28451ba78cb5                         │
│  │ Owner: Account Address ( 0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27 )  │
│  │ Version: 266310106                                                                             │
│  │ Digest: C2FFpjS25QDvRhr7NU6imRifxyKHmz1sKKYA8rxYsuLZ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9925600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    5gKAWexxs41fvMWA6KXNGKJBCSk7Enh7KgHt6f3rqGwT                                                   │
│    GMBJA2gEEvtwv1wGGT7ZEDkQdrmUTKaE4TeinNGQ2feC                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                     │
│  │ EventID: 66vepWYjCYEzGwWKZVh135dzUmXA3Uw2PZ1HHc77m6s6:0                                               │
│  │ PackageID: 0xa81975ce5222f861b95b518715e3a1e7510cb753b02586a69f3cb45b879bd32c                         │
│  │ Transaction Module: hello_move                                                                        │
│  │ Sender: 0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27                            │
│  │ EventType: 0xa81975ce5222f861b95b518715e3a1e7510cb753b02586a69f3cb45b879bd32c::hello_move::HelloEvent │
│  │ ParsedJSON:                                                                                           │
│  │   ┌──────┬───────────┐                                                                                │
│  │   │ text │ JasonRUAN │                                                                                │
│  │   └──────┴───────────┘                                                                                │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x971982a042baf8619b1ac6901afa5f315a7412fab1bfb8a35ae1f25dd8b2c189                       │
│  │ Sender: 0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27                         │
│  │ Owner: Account Address ( 0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27 )      │
│  │ ObjectType: 0xa81975ce5222f861b95b518715e3a1e7510cb753b02586a69f3cb45b879bd32c::hello_move::Hello  │
│  │ Version: 266310106                                                                                 │
│  │ Digest: 7f8Bm6BTbUzXgrsZmT4q5MuCyFD9C7Z75SwoP1X49ntD                                               │
│  └──                                                                                                  │
│  ┌──                                                                                                  │
│  │ ObjectID: 0xf5d3dd430455c7a45f69eb0b6768350f10699b6a8f9e1c314eb9d99b1aa5ed15                       │
│  │ Sender: 0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27                         │
│  │ Owner: Account Address ( 0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27 )      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                               │
│  │ Version: 266310106                                                                                 │
│  │ Digest: 2F1CKHCffYa2V6KGkXL9AWi7Vw2FYzGn1S723XZFympw                                               │
│  └──                                                                                                  │
│ Mutated Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x3d9ef475bc87cebda7146803d737efa905070a9c33f15f6d1fda28451ba78cb5                       │
│  │ Sender: 0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27                         │
│  │ Owner: Account Address ( 0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27 )      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                         │
│  │ Version: 266310106                                                                                 │
│  │ Digest: C2FFpjS25QDvRhr7NU6imRifxyKHmz1sKKYA8rxYsuLZ                                               │
│  └──                                                                                                  │
│ Published Objects:                                                                                    │
│  ┌──                                                                                                  │
│  │ PackageID: 0xa81975ce5222f861b95b518715e3a1e7510cb753b02586a69f3cb45b879bd32c                      │
│  │ Version: 1                                                                                         │
│  │ Digest: 7b259PFT6DHXorZR2vtXfFJVsRc1oiproD8tgrbZDRxb                                               │
│  │ Modules: hello_move                                                                                │
│  └──                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x8589fe4bc45bc9d188db47d78686f51e546674e88d58a8d7b15d85178d009c27 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -9947480                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```