1. 

2. deploy
```
 sui client publish     --gas-budget 200000000 sources/my_coin.move
[warn] Client/Server api version mismatch, client api version : 1.20.0, server api version : 1.21.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task_two
warning[W09001]: unused alias
  ┌─ sources/my_coin.move:3:27
  │
3 │     use sui::coin::{Self, Coin, TreasuryCap};
  │                           ^^^^ Unused 'use' of alias 'Coin'. Consider removing it
  │
  = This warning can be suppressed with '#[allow(unused_use)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

Successfully verified dependencies on-chain against source.
Transaction Digest: 5hVb79SHjVDRiEecykR57TBxWiQ6NGBqbdBXYEvi7aPW
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                   │
│ Gas Owner: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                │
│ Gas Budget: 200000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x219dcb6bbe7722f2d982bab17ebeb9375ad8d4cad8e4e3c2aa034c53ad744691                                    │
│  │ Version: 26346002                                                                                         │
│  │ Digest: awv3uaBTzPMgyQvRg811abBFVy8eMz2mw3GvUKmbMcH                                                       │
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
│    JN6NlM5XZbaVwWT+fwGVHV8Wnc2RulAbYrjInVO2ggSH+2pO3fPpOjDpcR3sKYXpsEdI2RtVrOpz/YJ2PrFQAA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5hVb79SHjVDRiEecykR57TBxWiQ6NGBqbdBXYEvi7aPW                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 313                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1474d33ae9171970a5312281c043b2ac7eff476e6cee33fa903086f8d90e0a5e                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 5AwketpbmWhJBpjoVxP1AjdmtGWRF7iXn5KUfYCVCUo9                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x166afc49140ced3e0aff14b5aa623ee4819edc3c800a33f3871c96b84df377c3                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 26346003                                                                              │
│  │ Digest: 4wQnENm2EaV4Bi3ivjApAkPeycppFfvtvDTAN3UMyrDN                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb1e2dccb940c7a371c85ad5416d60a0d9145e69f79c45136962f7e4ea4ac1e06                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 26346003                                                                              │
│  │ Digest: 3oi7Xjjsf7YCTmJKj7yYpcKXj1KJCMe2SfQYBM9fajAg                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe5c71100edadcfaa9b138546da703ddd297a61b589fe1fa6c8059913191016d5                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 26346003                                                                              │
│  │ Digest: 2ucA9Trrp4L26hFPBojyY8zDyfFkyKVJebxhBLwY1Hvx                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x219dcb6bbe7722f2d982bab17ebeb9375ad8d4cad8e4e3c2aa034c53ad744691                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 26346003                                                                              │
│  │ Digest: ArSzvZXM1X9ry76FRpRkFvMNb6ApVSqh44jBt4E4N3WL                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x219dcb6bbe7722f2d982bab17ebeb9375ad8d4cad8e4e3c2aa034c53ad744691                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 26346003                                                                              │
│  │ Digest: ArSzvZXM1X9ry76FRpRkFvMNb6ApVSqh44jBt4E4N3WL                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 13148000 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6LXfXXK9Eyc6kd6eh2kHAsrMuNM2kuA1WwZ78K63k2s8                                                   │
│    6ZzHxoNgMSgMsshxxJY6AabCWnEheT7pNFAuLTqAtL7K                                                   │
│    GZcMfNx5jvGHsfSKEHJD7jZss7yCHqEGfhVk8Jx8a2N1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x166afc49140ced3e0aff14b5aa623ee4819edc3c800a33f3871c96b84df377c3                                               │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                 │
│  │ Owner: Immutable                                                                                                           │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x1474d33ae9171970a5312281c043b2ac7eff476e6cee33fa903086f8d90e0a5e::my_coin::MY_COIN>  │
│  │ Version: 26346003                                                                                                          │
│  │ Digest: 4wQnENm2EaV4Bi3ivjApAkPeycppFfvtvDTAN3UMyrDN                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xb1e2dccb940c7a371c85ad5416d60a0d9145e69f79c45136962f7e4ea4ac1e06                                               │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                 │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                              │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                       │
│  │ Version: 26346003                                                                                                          │
│  │ Digest: 3oi7Xjjsf7YCTmJKj7yYpcKXj1KJCMe2SfQYBM9fajAg                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xe5c71100edadcfaa9b138546da703ddd297a61b589fe1fa6c8059913191016d5                                               │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                 │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                              │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x1474d33ae9171970a5312281c043b2ac7eff476e6cee33fa903086f8d90e0a5e::my_coin::MY_COIN>   │
│  │ Version: 26346003                                                                                                          │
│  │ Digest: 2ucA9Trrp4L26hFPBojyY8zDyfFkyKVJebxhBLwY1Hvx                                                                       │
│  └──                                                                                                                          │
│ Mutated Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x219dcb6bbe7722f2d982bab17ebeb9375ad8d4cad8e4e3c2aa034c53ad744691                                               │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                 │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                 │
│  │ Version: 26346003                                                                                                          │
│  │ Digest: ArSzvZXM1X9ry76FRpRkFvMNb6ApVSqh44jBt4E4N3WL                                                                       │
│  └──                                                                                                                          │
│ Published Objects:                                                                                                            │
│  ┌──                                                                                                                          │
│  │ PackageID: 0x1474d33ae9171970a5312281c043b2ac7eff476e6cee33fa903086f8d90e0a5e                                              │
│  │ Version: 1                                                                                                                 │
│  │ Digest: 5AwketpbmWhJBpjoVxP1AjdmtGWRF7iXn5KUfYCVCUo9                                                                       │
│  │ Modules: my_coin                                                                                                           │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -13169880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
3. mint
```
sui client call --function mint --module my_coin --package 0x1474d33ae9171970a5312281c043b2ac7eff476e6cee33fa903086f8d90e0a5e --args 0xe5c71100edadcfaa9b138546da703ddd297a61b589fe1fa6c8059913191016d5 952700000000 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 --gas-budget 90000000
[warn] Client/Server api version mismatch, client api version : 1.20.0, server api version : 1.21.0
Transaction Digest: GtaCJZ5FbvW1YEXnCq1cYjpmrYyJT3CiXu5Li2kVWyLH
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                   │
│ Gas Owner: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                │
│ Gas Budget: 90000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x219dcb6bbe7722f2d982bab17ebeb9375ad8d4cad8e4e3c2aa034c53ad744691                                    │
│  │ Version: 26346003                                                                                         │
│  │ Digest: ArSzvZXM1X9ry76FRpRkFvMNb6ApVSqh44jBt4E4N3WL                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xe5c71100edadcfaa9b138546da703ddd297a61b589fe1fa6c8059913191016d5              │ │
│ │ 1   Pure Arg: Type: u64, Value: "952700000000"                                                           │ │
│ │ 2   Pure Arg: Type: address, Value: "0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    my_coin                                                            │                         │
│ │  │ Package:   0x1474d33ae9171970a5312281c043b2ac7eff476e6cee33fa903086f8d90e0a5e │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    KifMEM/uEQru59xKQ9GE/nY+b2BGXamOI3fQJm1B3lzogeEc+sY25l8NAP1VaEDi+sCeoRRFg4XefvW7FchJBA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GtaCJZ5FbvW1YEXnCq1cYjpmrYyJT3CiXu5Li2kVWyLH                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 313                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x82cae6bf497df80a5bae9f61fd73b8105910cec15364f6d7f963cd88ed886b67                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 26346004                                                                              │
│  │ Digest: Hjzqp4SsaiiYWzzHkrJNbr4GDFA5tmsgxe8EYRFaZgNg                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x219dcb6bbe7722f2d982bab17ebeb9375ad8d4cad8e4e3c2aa034c53ad744691                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 26346004                                                                              │
│  │ Digest: 5mMjKAEqS6WBSECdZUeo5xmHr2umSX7ZuSePBZxHjNPz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe5c71100edadcfaa9b138546da703ddd297a61b589fe1fa6c8059913191016d5                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 26346004                                                                              │
│  │ Digest: 7ivgZaXGe6UEurzmLuSHBGaJzx5wrzTdqRdRjMUumuxD                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x219dcb6bbe7722f2d982bab17ebeb9375ad8d4cad8e4e3c2aa034c53ad744691                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 26346004                                                                              │
│  │ Digest: 5mMjKAEqS6WBSECdZUeo5xmHr2umSX7ZuSePBZxHjNPz                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4104000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2708640 MIST                                                                   │
│    Non-refundable Storage Fee: 27360 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    5hVb79SHjVDRiEecykR57TBxWiQ6NGBqbdBXYEvi7aPW                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                             │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0x82cae6bf497df80a5bae9f61fd73b8105910cec15364f6d7f963cd88ed886b67                                              │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                             │
│  │ ObjectType: 0x2::coin::Coin<0x1474d33ae9171970a5312281c043b2ac7eff476e6cee33fa903086f8d90e0a5e::my_coin::MY_COIN>         │
│  │ Version: 26346004                                                                                                         │
│  │ Digest: Hjzqp4SsaiiYWzzHkrJNbr4GDFA5tmsgxe8EYRFaZgNg                                                                      │
│  └──                                                                                                                         │
│ Mutated Objects:                                                                                                             │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0x219dcb6bbe7722f2d982bab17ebeb9375ad8d4cad8e4e3c2aa034c53ad744691                                              │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                             │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                │
│  │ Version: 26346004                                                                                                         │
│  │ Digest: 5mMjKAEqS6WBSECdZUeo5xmHr2umSX7ZuSePBZxHjNPz                                                                      │
│  └──                                                                                                                         │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0xe5c71100edadcfaa9b138546da703ddd297a61b589fe1fa6c8059913191016d5                                              │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                             │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x1474d33ae9171970a5312281c043b2ac7eff476e6cee33fa903086f8d90e0a5e::my_coin::MY_COIN>  │
│  │ Version: 26346004                                                                                                         │
│  │ Digest: 7ivgZaXGe6UEurzmLuSHBGaJzx5wrzTdqRdRjMUumuxD                                                                      │
│  └──                                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                    │
├────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                               │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )   │
│  │ CoinType: 0x2::sui::SUI                                                                         │
│  │ Amount: -2395360                                                                                │
│  └──                                                                                               │
│  ┌──                                                                                               │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )   │
│  │ CoinType: 0x1474d33ae9171970a5312281c043b2ac7eff476e6cee33fa903086f8d90e0a5e::my_coin::MY_COIN  │
│  │ Amount: 952700000000                                                                            │
│  └──                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────╯
```