INCLUDING DEPENDENCY faucetcoin
INCLUDING DEPENDENCY mycoin
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING brainsk
warning[W02021]: duplicate alias
┌─ /Users/tm/Documents/project/rust/letsmove/mover/brainsk/code/task5/brainsk/sources/brainsk.move:6:25
│
6 │     use sui::transfer::{Self, transfer, share_object, public_transfer};
│                         ^^^^ Unnecessary alias 'transfer' for module 'sui::transfer'. This alias is provided by default
│
= This warning can be suppressed with '#[allow(duplicate_alias)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W09001]: unused alias
┌─ /Users/tm/Documents/project/rust/letsmove/mover/brainsk/code/task5/brainsk/sources/brainsk.move:6:25
│
6 │     use sui::transfer::{Self, transfer, share_object, public_transfer};
│                         ^^^^ Unused 'use' of alias 'transfer'. Consider removing it
│
= This warning can be suppressed with '#[allow(unused_use)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

Successfully verified dependencies on-chain against source.
Transaction Digest: DR6YACGqTRmgcoX82tHbKytcMiMo6tfDSwv6LRsp6a8Q
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                   │
│ Gas Owner: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                │
│ Gas Budget: 19732400 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xbf03beac2f0712cd5f950bd957ec06dc6efd420e04866ea0af2f9c06320a36a1                                    │
│  │ Version: 422681860                                                                                        │
│  │ Digest: 9V1TeY8ifFaxDnuPkistSFz83B2YbJxXfXLzWq1LRTY6                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  │   0xf55b7f267fbf88f6e195bdb979316293ec492882273e7deffc078a6615ec2bfd │                                  │
│ │  │   0x6873544ffc55c257a31c4fac905c730ed5f69c6340528314580b0c499a23c6fb │                                  │
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
│    hzhLL8T9mDbEx/vwJnu7xTZ/8mDH5eP2yA2CWgwpS3oqOmfIiXTP8wLhQ0/jkhGmS0boFajnY8mPyPOgh5mDAQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DR6YACGqTRmgcoX82tHbKytcMiMo6tfDSwv6LRsp6a8Q                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 589                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x38c79f4b37e56ec98cfdd56c72faea011d4dab9eae0775c399ff975ac003a1c8                         │
│  │ Owner: Shared( 422681861 )                                                                     │
│  │ Version: 422681861                                                                             │
│  │ Digest: BRjZkh15HgGVYq8RBpokvpcYhXT9m8JQ4eb7W7zpyhMo                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8084ba0b80164530fe2c3df1d7c95238ca6c59f32c96f52a6167732b951c0f5b                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 422681861                                                                             │
│  │ Digest: GYEcihqPrnCvDvAohK2rK8S5nh3Sv2AS65m7KcddTN3Q                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8fce92f5a9044de1b3b19a622c2f2beb74c080321612ca546a8ddfbae089c264                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 7FuztekmgNYBqvmWXKzk6zEAr2ZxRY9jBJe2y6yGvtkH                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb9c7d85062fc8b29182c85761d9886b6ecec91c61dc8872bcae022e17e2e02f2                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 422681861                                                                             │
│  │ Digest: 2Brjgc6GMMbBYaKqSuyfCjeRn1Qe4sCjnL2AwtEMiZKo                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbf03beac2f0712cd5f950bd957ec06dc6efd420e04866ea0af2f9c06320a36a1                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 422681861                                                                             │
│  │ Digest: CWnTFNj1g2GHfEeWFoBYY8mKwednSyBLR2p5UCyWQ3fy                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbf03beac2f0712cd5f950bd957ec06dc6efd420e04866ea0af2f9c06320a36a1                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 422681861                                                                             │
│  │ Digest: CWnTFNj1g2GHfEeWFoBYY8mKwednSyBLR2p5UCyWQ3fy                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 18232400 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2eAquiKg3vGPAmS6khNTttxiYgpLSnKGSMLqWQorRqui                                                   │
│    AwbRrs46HSRGTA4cveqF8JceQFJodqijT4QhjFtntVj3                                                   │
│    FPQJirZF6XaBX9wcmQbPUPPX9CzbpymnF3c8vtnpHqWt                                                   │
│    Hiybm73HN9n8UWMHNc6K63cTNtqdPz2jphpfckaZjNpW                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                             │
│  ┌──                                                                                                         │
│  │ ObjectID: 0x38c79f4b37e56ec98cfdd56c72faea011d4dab9eae0775c399ff975ac003a1c8                              │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                │
│  │ Owner: Shared( 422681861 )                                                                                │
│  │ ObjectType: 0x8fce92f5a9044de1b3b19a622c2f2beb74c080321612ca546a8ddfbae089c264::brainsk::BrainskSwapBank  │
│  │ Version: 422681861                                                                                        │
│  │ Digest: BRjZkh15HgGVYq8RBpokvpcYhXT9m8JQ4eb7W7zpyhMo                                                      │
│  └──                                                                                                         │
│  ┌──                                                                                                         │
│  │ ObjectID: 0x8084ba0b80164530fe2c3df1d7c95238ca6c59f32c96f52a6167732b951c0f5b                              │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )             │
│  │ ObjectType: 0x8fce92f5a9044de1b3b19a622c2f2beb74c080321612ca546a8ddfbae089c264::brainsk::AdaminCap        │
│  │ Version: 422681861                                                                                        │
│  │ Digest: GYEcihqPrnCvDvAohK2rK8S5nh3Sv2AS65m7KcddTN3Q                                                      │
│  └──                                                                                                         │
│  ┌──                                                                                                         │
│  │ ObjectID: 0xb9c7d85062fc8b29182c85761d9886b6ecec91c61dc8872bcae022e17e2e02f2                              │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )             │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                      │
│  │ Version: 422681861                                                                                        │
│  │ Digest: 2Brjgc6GMMbBYaKqSuyfCjeRn1Qe4sCjnL2AwtEMiZKo                                                      │
│  └──                                                                                                         │
│ Mutated Objects:                                                                                             │
│  ┌──                                                                                                         │
│  │ ObjectID: 0xbf03beac2f0712cd5f950bd957ec06dc6efd420e04866ea0af2f9c06320a36a1                              │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )             │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                │
│  │ Version: 422681861                                                                                        │
│  │ Digest: CWnTFNj1g2GHfEeWFoBYY8mKwednSyBLR2p5UCyWQ3fy                                                      │
│  └──                                                                                                         │
│ Published Objects:                                                                                           │
│  ┌──                                                                                                         │
│  │ PackageID: 0x8fce92f5a9044de1b3b19a622c2f2beb74c080321612ca546a8ddfbae089c264                             │
│  │ Version: 1                                                                                                │
│  │ Digest: 7FuztekmgNYBqvmWXKzk6zEAr2ZxRY9jBJe2y6yGvtkH                                                      │
│  │ Modules: brainsk                                                                                          │
│  └──                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -18004280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯



--- mycoin
make deposit_mycoin
sui client call --package 0x8fce92f5a9044de1b3b19a622c2f2beb74c080321612ca546a8ddfbae089c264 --module brainsk --function deposit_mycoin --args 0x38c79f4b37e56ec98cfdd56c72faea011d4dab9eae0775c399ff975ac003a1c8 0x05f29334ed951b1748ddd65e502056175a83582b077949ad4299670449f3a430
[warning] Client/Server api version mismatch, client api version : 1.38.0, server api version : 1.37.3
Transaction Digest: JBZA3U5a3grRFdCBBjv8wpy5TDn6D4npe1fpWEUy1CDN
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                      │
│ Gas Owner: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                   │
│ Gas Budget: 1500000 MIST                                                                        │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xbf03beac2f0712cd5f950bd957ec06dc6efd420e04866ea0af2f9c06320a36a1                       │
│  │ Version: 422681862                                                                           │
│  │ Digest: 6UwEgJUECA8FS5HBJGrUdStqWpQWJE6e2BXPXh7HmB4w                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x38c79f4b37e56ec98cfdd56c72faea011d4dab9eae0775c399ff975ac003a1c8 │ │
│ │ 1   Imm/Owned Object ID: 0x05f29334ed951b1748ddd65e502056175a83582b077949ad4299670449f3a430 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  deposit_mycoin                                                     │            │
│ │  │ Module:    brainsk                                                            │            │
│ │  │ Package:   0x8fce92f5a9044de1b3b19a622c2f2beb74c080321612ca546a8ddfbae089c264 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    lI0tzzD542qCIlPT3oHPcc0N1QjnwHAbaLOon15q3exbqwYTe4qynjeCXPsgw0w90QFn1BH7ac4ZawZNZXPkCA==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: JBZA3U5a3grRFdCBBjv8wpy5TDn6D4npe1fpWEUy1CDN                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 589                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x38c79f4b37e56ec98cfdd56c72faea011d4dab9eae0775c399ff975ac003a1c8                         │
│  │ Owner: Shared( 422681861 )                                                                     │
│  │ Version: 422681863                                                                             │
│  │ Digest: 3vufCGUoEL9e4Cv44qwf73RRMsudukMTe5AdGQQGdTX7                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbf03beac2f0712cd5f950bd957ec06dc6efd420e04866ea0af2f9c06320a36a1                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 422681863                                                                             │
│  │ Digest: 2Ts72JFVAx6ix57E2gfrPmZM1r25vnveby3gQoRdWmAJ                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x38c79f4b37e56ec98cfdd56c72faea011d4dab9eae0775c399ff975ac003a1c8                         │
│  │ Version: 422681861                                                                             │
│  │ Digest: BRjZkh15HgGVYq8RBpokvpcYhXT9m8JQ4eb7W7zpyhMo                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x05f29334ed951b1748ddd65e502056175a83582b077949ad4299670449f3a430                         │
│  │ Version: 422681863                                                                             │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbf03beac2f0712cd5f950bd957ec06dc6efd420e04866ea0af2f9c06320a36a1                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 422681863                                                                             │
│  │ Digest: 2Ts72JFVAx6ix57E2gfrPmZM1r25vnveby3gQoRdWmAJ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2591600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 3904956 MIST                                                                   │
│    Non-refundable Storage Fee: 39444 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    DR6YACGqTRmgcoX82tHbKytcMiMo6tfDSwv6LRsp6a8Q                                                   │
│    FFTzzSwfjLYR8YiLKT8khRCfWNZhbUJkeTq4bqXag3JH                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                             │
│  ┌──                                                                                                         │
│  │ ObjectID: 0x38c79f4b37e56ec98cfdd56c72faea011d4dab9eae0775c399ff975ac003a1c8                              │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                │
│  │ Owner: Shared( 422681861 )                                                                                │
│  │ ObjectType: 0x8fce92f5a9044de1b3b19a622c2f2beb74c080321612ca546a8ddfbae089c264::brainsk::BrainskSwapBank  │
│  │ Version: 422681863                                                                                        │
│  │ Digest: 3vufCGUoEL9e4Cv44qwf73RRMsudukMTe5AdGQQGdTX7                                                      │
│  └──                                                                                                         │
│  ┌──                                                                                                         │
│  │ ObjectID: 0xbf03beac2f0712cd5f950bd957ec06dc6efd420e04866ea0af2f9c06320a36a1                              │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )             │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                │
│  │ Version: 422681863                                                                                        │
│  │ Digest: 2Ts72JFVAx6ix57E2gfrPmZM1r25vnveby3gQoRdWmAJ                                                      │
│  └──                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: 563356                                                                                 │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ CoinType: 0x6873544ffc55c257a31c4fac905c730ed5f69c6340528314580b0c499a23c6fb::mycoin::MYCOIN   │
│  │ Amount: -80000                                                                                 │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
make deposit_faucetcoin
sui client call --package 0x8fce92f5a9044de1b3b19a622c2f2beb74c080321612ca546a8ddfbae089c264 --module brainsk --function deposit_faucetcoin --args 0x38c79f4b37e56ec98cfdd56c72faea011d4dab9eae0775c399ff975ac003a1c8 0xa404c780507a31981dc02c3ed95cf63965f78a66c3963c6065d432ca7b71971f
[warning] Client/Server api version mismatch, client api version : 1.38.0, server api version : 1.37.3
Transaction Digest: H7U7wcq1xTJzaGJ751hsktxwDzU8qaVYNpWAqqTN58DA
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                      │
│ Gas Owner: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                   │
│ Gas Budget: 1500000 MIST                                                                        │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xbf03beac2f0712cd5f950bd957ec06dc6efd420e04866ea0af2f9c06320a36a1                       │
│  │ Version: 422681864                                                                           │
│  │ Digest: H3w2rXmUoJ1bSNqBW5YeF7Wv9D7T4jVKc71MGBHmfbKP                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x38c79f4b37e56ec98cfdd56c72faea011d4dab9eae0775c399ff975ac003a1c8 │ │
│ │ 1   Imm/Owned Object ID: 0xa404c780507a31981dc02c3ed95cf63965f78a66c3963c6065d432ca7b71971f │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  deposit_faucetcoin                                                 │            │
│ │  │ Module:    brainsk                                                            │            │
│ │  │ Package:   0x8fce92f5a9044de1b3b19a622c2f2beb74c080321612ca546a8ddfbae089c264 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    jQJh9t5jUKBVA+9EzufE1cIBD782YA31dTKYJzebIoyvtw0mVFpLgxST6Xa0wL22R7r/uDWCNz7DcKEpXvHEBw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: H7U7wcq1xTJzaGJ751hsktxwDzU8qaVYNpWAqqTN58DA                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 589                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x38c79f4b37e56ec98cfdd56c72faea011d4dab9eae0775c399ff975ac003a1c8                         │
│  │ Owner: Shared( 422681861 )                                                                     │
│  │ Version: 422681865                                                                             │
│  │ Digest: Bxxp8u1m6QsJsHGoiA52CMCpDJNZW9K1aQnwvBAZZGL                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbf03beac2f0712cd5f950bd957ec06dc6efd420e04866ea0af2f9c06320a36a1                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 422681865                                                                             │
│  │ Digest: 7M93HXEnjL27dUBS3UtTWz2fV9pCjskUpAP8kUHNpTT8                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x38c79f4b37e56ec98cfdd56c72faea011d4dab9eae0775c399ff975ac003a1c8                         │
│  │ Version: 422681863                                                                             │
│  │ Digest: 3vufCGUoEL9e4Cv44qwf73RRMsudukMTe5AdGQQGdTX7                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa404c780507a31981dc02c3ed95cf63965f78a66c3963c6065d432ca7b71971f                         │
│  │ Version: 422681865                                                                             │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbf03beac2f0712cd5f950bd957ec06dc6efd420e04866ea0af2f9c06320a36a1                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 422681865                                                                             │
│  │ Digest: 7M93HXEnjL27dUBS3UtTWz2fV9pCjskUpAP8kUHNpTT8                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2591600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 3965148 MIST                                                                   │
│    Non-refundable Storage Fee: 40052 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    21j4KxbEG1hnWUcgAf2PcUmMmf3ZEYEVDhtee5ASGZYv                                                   │
│    DR6YACGqTRmgcoX82tHbKytcMiMo6tfDSwv6LRsp6a8Q                                                   │
│    JBZA3U5a3grRFdCBBjv8wpy5TDn6D4npe1fpWEUy1CDN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                             │
│  ┌──                                                                                                         │
│  │ ObjectID: 0x38c79f4b37e56ec98cfdd56c72faea011d4dab9eae0775c399ff975ac003a1c8                              │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                │
│  │ Owner: Shared( 422681861 )                                                                                │
│  │ ObjectType: 0x8fce92f5a9044de1b3b19a622c2f2beb74c080321612ca546a8ddfbae089c264::brainsk::BrainskSwapBank  │
│  │ Version: 422681865                                                                                        │
│  │ Digest: Bxxp8u1m6QsJsHGoiA52CMCpDJNZW9K1aQnwvBAZZGL                                                       │
│  └──                                                                                                         │
│  ┌──                                                                                                         │
│  │ ObjectID: 0xbf03beac2f0712cd5f950bd957ec06dc6efd420e04866ea0af2f9c06320a36a1                              │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )             │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                │
│  │ Version: 422681865                                                                                        │
│  │ Digest: 7M93HXEnjL27dUBS3UtTWz2fV9pCjskUpAP8kUHNpTT8                                                      │
│  └──                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )         │
│  │ CoinType: 0x2::sui::SUI                                                                               │
│  │ Amount: 623548                                                                                        │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )         │
│  │ CoinType: 0xf55b7f267fbf88f6e195bdb979316293ec492882273e7deffc078a6615ec2bfd::faucetcoin::FAUCETCOIN  │
│  │ Amount: -100000                                                                                       │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
