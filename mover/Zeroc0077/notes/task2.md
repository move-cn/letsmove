# Task2

## my coin

Deploy:
```bash
❯ sui client publish --gas-budget 50000000 .
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mycoin
Successfully verified dependencies on-chain against source.
Transaction Digest: 2CMfx8QFH4u1jaqehHFYFbkmyPn4M31t5uNXuKVRSacS
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                   │
│ Gas Owner: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976                                    │
│  │ Version: 80080974                                                                                         │
│  │ Digest: 3svrBYXZ15r4jZiSTdiMvbJswh7tgqjSo9GU1xug1QNP                                                      │
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
│    mNxzEsIK1DOzPo0swIMrmT4bmJVBiZXFpJz5eBH2taxwkjmBmG13Yt9CAMqP9koX9nfVeyDbnsYWPSbPVTLnCw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2CMfx8QFH4u1jaqehHFYFbkmyPn4M31t5uNXuKVRSacS                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 347                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x10573af7e1415ea0945d20bc596da69658d8befbb0ad08f14c68755ef1f6693c                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 80080975                                                                              │
│  │ Digest: 6NG3t6xpaBFwCHBJgxBUuLxLGByu2NqpeLASc9nD81Vs                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5077c96a8187676f13050075e54ece545bc540a73734dc028650ca753f444d35                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 5cMFAthMp9nYad2vy9BEB3iPnYzNfaPrnY33ZNaL17CR                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x536f7a7489c52c62d06e0ab37a14c44bb54d3fa043a746f096a81803091d2389                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 80080975                                                                              │
│  │ Digest: 6ewpLzv4Hh5RfWGrRsm9rt8qS1kwFNhD1eCPzMoyZ7Lh                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8e113ddfd2aa8c01ebcfbf73031eba9df23eaf542d2ea13b9931ad6c9de8f6eb                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 80080975                                                                              │
│  │ Digest: FwFAYVDNcgct8Q2WvpVJqP8Akdy69hxMAB1E13FGFZLE                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 80080975                                                                              │
│  │ Digest: 88m7RX1RukpNfSNxWyREYuvDWZcyPGdaPGhy11Z8vnhZ                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 80080975                                                                              │
│  │ Digest: 88m7RX1RukpNfSNxWyREYuvDWZcyPGdaPGhy11Z8vnhZ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 13368400 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    4wUSjETFcvDECu9dGsS9DG4Uz6QLB9aL5DiWoR4M9LZ7                                                   │
│    7FtUuSqeZ9VRGbrMs38To5Qf4qd9nuVf43Xo4G6YL8Sz                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x10573af7e1415ea0945d20bc596da69658d8befbb0ad08f14c68755ef1f6693c                                             │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                               │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )                            │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x5077c96a8187676f13050075e54ece545bc540a73734dc028650ca753f444d35::mycoin::MYCOIN>   │
│  │ Version: 80080975                                                                                                        │
│  │ Digest: 6NG3t6xpaBFwCHBJgxBUuLxLGByu2NqpeLASc9nD81Vs                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x536f7a7489c52c62d06e0ab37a14c44bb54d3fa043a746f096a81803091d2389                                             │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                               │
│  │ Owner: Immutable                                                                                                         │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x5077c96a8187676f13050075e54ece545bc540a73734dc028650ca753f444d35::mycoin::MYCOIN>  │
│  │ Version: 80080975                                                                                                        │
│  │ Digest: 6ewpLzv4Hh5RfWGrRsm9rt8qS1kwFNhD1eCPzMoyZ7Lh                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x8e113ddfd2aa8c01ebcfbf73031eba9df23eaf542d2ea13b9931ad6c9de8f6eb                                             │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                               │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )                            │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                     │
│  │ Version: 80080975                                                                                                        │
│  │ Digest: FwFAYVDNcgct8Q2WvpVJqP8Akdy69hxMAB1E13FGFZLE                                                                     │
│  └──                                                                                                                        │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976                                             │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                               │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 80080975                                                                                                        │
│  │ Digest: 88m7RX1RukpNfSNxWyREYuvDWZcyPGdaPGhy11Z8vnhZ                                                                     │
│  └──                                                                                                                        │
│ Published Objects:                                                                                                          │
│  ┌──                                                                                                                        │
│  │ PackageID: 0x5077c96a8187676f13050075e54ece545bc540a73734dc028650ca753f444d35                                            │
│  │ Version: 1                                                                                                               │
│  │ Digest: 5cMFAthMp9nYad2vy9BEB3iPnYzNfaPrnY33ZNaL17CR                                                                     │
│  │ Modules: mycoin                                                                                                          │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -13140280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

Transfer:
```bash
sui client call --package 0x5077c96a8187676f13050075e54ece545bc540a73734dc028650ca753f444d35 --module mycoin --function mint --args 0x10573af7e1415ea0945d20bc596da69658d8befbb0ad08f14c68755ef1f6693c 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000
Transaction Digest: SNbo25kjXmmpoLm1PtHLiXmwiEmS6RvBUFj3nPGPfyr
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                   │
│ Gas Owner: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976                                    │
│  │ Version: 80080976                                                                                         │
│  │ Digest: 46hcRho9W3SjKzWAqvaEq12yGWrFCUu7aQudEzHAQ9rh                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x10573af7e1415ea0945d20bc596da69658d8befbb0ad08f14c68755ef1f6693c              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000000"                                                                │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mycoin                                                             │                         │
│ │  │ Package:   0x5077c96a8187676f13050075e54ece545bc540a73734dc028650ca753f444d35 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    AM1rMlawm8PveY4v3MMYWP7D9QJINAZbEFmI/1Ob3o+9bFXdTBzsYffNpNzfO4fBEDKG9uB2WFeuscffUtU1DA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: SNbo25kjXmmpoLm1PtHLiXmwiEmS6RvBUFj3nPGPfyr                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 347                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6a0f2bf453f10154391f87f7e98b04b30cd40524eae2c38cfb34c67d4b5e72d3                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 80080977                                                                              │
│  │ Digest: BveM6drHSYyhhY9QNUKfFEeAgz9R5axQta8Mkev4gfUL                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x10573af7e1415ea0945d20bc596da69658d8befbb0ad08f14c68755ef1f6693c                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 80080977                                                                              │
│  │ Digest: 3Gepy2ajqDTmpRiwxrkb2t6gu2q6ZR1SU1w325uxJTfg                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 80080977                                                                              │
│  │ Digest: Dcy6XNKcAszZ9oGVTmi6qnugV83WBCy1hq7WdKVbXZfp                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 80080977                                                                              │
│  │ Digest: Dcy6XNKcAszZ9oGVTmi6qnugV83WBCy1hq7WdKVbXZfp                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2CMfx8QFH4u1jaqehHFYFbkmyPn4M31t5uNXuKVRSacS                                                   │
│    5YsbaQMVUBMTh5i1jNzzTrkpaRC3UYst5TBCtJ6xsx3s                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x6a0f2bf453f10154391f87f7e98b04b30cd40524eae2c38cfb34c67d4b5e72d3                                            │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                              │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                           │
│  │ ObjectType: 0x2::coin::Coin<0x5077c96a8187676f13050075e54ece545bc540a73734dc028650ca753f444d35::mycoin::MYCOIN>         │
│  │ Version: 80080977                                                                                                       │
│  │ Digest: BveM6drHSYyhhY9QNUKfFEeAgz9R5axQta8Mkev4gfUL                                                                    │
│  └──                                                                                                                       │
│ Mutated Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x10573af7e1415ea0945d20bc596da69658d8befbb0ad08f14c68755ef1f6693c                                            │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                              │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )                           │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x5077c96a8187676f13050075e54ece545bc540a73734dc028650ca753f444d35::mycoin::MYCOIN>  │
│  │ Version: 80080977                                                                                                       │
│  │ Digest: 3Gepy2ajqDTmpRiwxrkb2t6gu2q6ZR1SU1w325uxJTfg                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976                                            │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                              │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                              │
│  │ Version: 80080977                                                                                                       │
│  │ Digest: Dcy6XNKcAszZ9oGVTmi6qnugV83WBCy1hq7WdKVbXZfp                                                                    │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2130008                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ CoinType: 0x5077c96a8187676f13050075e54ece545bc540a73734dc028650ca753f444d35::mycoin::MYCOIN   │
│  │ Amount: 1000000                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## faucet coin

Deploy:
```bash
❯ sui client publish --gas-budget 50000000 .
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING faucetcoin
Successfully verified dependencies on-chain against source.
Transaction Digest: EsRzt2aN3c1X6CqFbZCTL46WFr9UhAPA6gPJnrjwaAqx
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                   │
│ Gas Owner: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976                                    │
│  │ Version: 80080977                                                                                         │
│  │ Digest: Dcy6XNKcAszZ9oGVTmi6qnugV83WBCy1hq7WdKVbXZfp                                                      │
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
│    p9YZ6OvL6h5/b+HLLH89Bf6nInAai2Ni8DI9Nx4GMQlSuVyk6DZyWnorjsJUD35xvGGGpnaqIEfPSRNpIWDbCA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EsRzt2aN3c1X6CqFbZCTL46WFr9UhAPA6gPJnrjwaAqx                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 347                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x00466b29b10ea8627f47b340c27b02018f0a42badd1e19e3bd3fc77cb398eef0                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 80080978                                                                              │
│  │ Digest: A26PJpxkVeiT7xPYFT8K8p6DKCismWRB6LNYZEkaFHiX                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x11cff194896890897fd838d94f11ba868f44696e8f1381658c4c7e0602aad63b                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 80080978                                                                              │
│  │ Digest: 556UZJtG1LmuiaG4vh8d946Y7busqvdrakD2bf27zqr1                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6495492d02ba57680550e6b6e84754dc89390bc5078d0a862d114507a2cf5074                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 80080978                                                                              │
│  │ Digest: 7v29Y1oMdmyijKtxBCzcHfJwwfTGWRUmUwT5x4KinHVo                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x746a00502d8e4dd0d9500fb029febab2419f91cf776e25e4442d488ae513d244                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Dv2uU3BiLzJgqNC1kxbhozqJKMdVjVK2sCmrGhBqt9D9                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 80080978                                                                              │
│  │ Digest: 6tAr4J4nxb4UWns3o9j5gqQsXBEK8XiLbs3iNSSU1PkT                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976                         │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ Version: 80080978                                                                              │
│  │ Digest: 6tAr4J4nxb4UWns3o9j5gqQsXBEK8XiLbs3iNSSU1PkT                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 13391200 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    SNbo25kjXmmpoLm1PtHLiXmwiEmS6RvBUFj3nPGPfyr                                                    │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    7FtUuSqeZ9VRGbrMs38To5Qf4qd9nuVf43Xo4G6YL8Sz                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                            │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                          │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x00466b29b10ea8627f47b340c27b02018f0a42badd1e19e3bd3fc77cb398eef0                                           │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                             │
│  │ Owner: Immutable                                                                                                       │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x746a00502d8e4dd0d9500fb029febab2419f91cf776e25e4442d488ae513d244::fcoin::FCOIN>  │
│  │ Version: 80080978                                                                                                      │
│  │ Digest: A26PJpxkVeiT7xPYFT8K8p6DKCismWRB6LNYZEkaFHiX                                                                   │
│  └──                                                                                                                      │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x11cff194896890897fd838d94f11ba868f44696e8f1381658c4c7e0602aad63b                                           │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                             │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )                          │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                   │
│  │ Version: 80080978                                                                                                      │
│  │ Digest: 556UZJtG1LmuiaG4vh8d946Y7busqvdrakD2bf27zqr1                                                                   │
│  └──                                                                                                                      │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x6495492d02ba57680550e6b6e84754dc89390bc5078d0a862d114507a2cf5074                                           │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                             │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )                          │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x746a00502d8e4dd0d9500fb029febab2419f91cf776e25e4442d488ae513d244::fcoin::FCOIN>   │
│  │ Version: 80080978                                                                                                      │
│  │ Digest: 7v29Y1oMdmyijKtxBCzcHfJwwfTGWRUmUwT5x4KinHVo                                                                   │
│  └──                                                                                                                      │
│ Mutated Objects:                                                                                                          │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0xde0784919cebfe3794a8a1a653b56c667b887d840536cc675bda732d1cb3d976                                           │
│  │ Sender: 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6                                             │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )                          │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                             │
│  │ Version: 80080978                                                                                                      │
│  │ Digest: 6tAr4J4nxb4UWns3o9j5gqQsXBEK8XiLbs3iNSSU1PkT                                                                   │
│  └──                                                                                                                      │
│ Published Objects:                                                                                                        │
│  ┌──                                                                                                                      │
│  │ PackageID: 0x746a00502d8e4dd0d9500fb029febab2419f91cf776e25e4442d488ae513d244                                          │
│  │ Version: 1                                                                                                             │
│  │ Digest: Dv2uU3BiLzJgqNC1kxbhozqJKMdVjVK2sCmrGhBqt9D9                                                                   │
│  │ Modules: fcoin                                                                                                         │
│  └──                                                                                                                      │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x2304af6276efc0fd1c794d84aa2e3c7497a02e505421e72f6911caef9f02bde6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -13163080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```