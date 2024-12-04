<style>
pre {
    overflow-y:auto;
    max-height: 300px;
}
</style>

# task 2

* Build Package：

```bash
cd ../code/task2
sui move build
```

* Publish Package：

```bash
cd ../code/task2
sui client publish --gas-budget 50000000
```

Publish Log:

```text
➜  task2 git:(main) ✗ sui client publish --gas-budget 50000000
[warn] Client/Server api version mismatch, client api version : 1.23.1, server api version : 1.22.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
Total number of linter warnings suppressed: 1 (filtered categories: 1)
Successfully verified dependencies on-chain against source.
Transaction Digest: BruPMmCTck9HjnzLWvqvfat58rDZYGRXrFTfck7mfHbp
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                   │
│ Gas Owner: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x060eab2fd8a59f2d4872a3d05339cb947111d51756fa7dc4295608ef470413d3                                    │
│  │ Version: 82054379                                                                                         │
│  │ Digest: FU1XCudKCLno3QSByiLbADjKqEE1rCsAm83YnB9iaSVC                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed" │ │
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
│    Cq3pCp7nkwTM0b3Le7gvQr9wDEWxkm69RtIrEfIt02gfqipf99huAyoazsZAckNkEyZ0RTAqC1sEKWi2TmfmCg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BruPMmCTck9HjnzLWvqvfat58rDZYGRXrFTfck7mfHbp                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 376                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x02f95db2ca9966e1af26148e17daa3dd0e4c65407563f08ff1c2f6a439265966                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 82054380                                                                              │
│  │ Digest: GTxfmL5aaCiGtCaW3uz1yKp9GV2hNH5EjMeYH4dkmRnf                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x0b448e42436e03e8cfbb03a597941351fb406719f62b6ea1e5f3ea1cb661d247                         │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )  │
│  │ Version: 82054380                                                                              │
│  │ Digest: 2F8M2fsWs43eHQEN9tFLc7wMZgnntZoXYHAZ1xYbbrCb                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x555c830518938afbe86ce571c0d171e762e0e27222f6bd11ef016950d994e1dd                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 82054380                                                                              │
│  │ Digest: BKQ1wmXSpx6ReU4horPBQoDHyp6ufqbnfudSnrqQo92Y                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbf300a6a94dae1de312def6c59e35b0863316770262e2275005b74b001ea7760                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 82054380                                                                              │
│  │ Digest: 6mfApYDe2AvTqZUUbrK66p6PEQaBbZAbTiei3SpqL4ta                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe1fb6293d4461f3a443b8a484c70bde344ce239def4f6412abeae531e3f4a38e                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 9sapHE9WhDu7jgYubewUuqpRWQLjFQgcFYrCdosj8ery                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe36cac7347052ec8e4641ca0d220fff8055561f21e96dc9d88cd83ae3e691ead                         │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )  │
│  │ Version: 82054380                                                                              │
│  │ Digest: FAnJHWVdQHgLKAyxVVkynktqPCzWa37uujzQE7W3FJLP                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x060eab2fd8a59f2d4872a3d05339cb947111d51756fa7dc4295608ef470413d3                         │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )  │
│  │ Version: 82054380                                                                              │
│  │ Digest: GDXYzhCUKDnVWfDENrJsaFZosYoKTvrdaNfcgAcc2c3W                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x060eab2fd8a59f2d4872a3d05339cb947111d51756fa7dc4295608ef470413d3                         │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )  │
│  │ Version: 82054380                                                                              │
│  │ Digest: GDXYzhCUKDnVWfDENrJsaFZosYoKTvrdaNfcgAcc2c3W                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 28994000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    9fUVv8Bsq3fuDCeeSyXrz7vUPg61Um1Ww4pTwMwhbnLj                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                    │
│  ┌──                                                                                                                                                │
│  │ ObjectID: 0x02f95db2ca9966e1af26148e17daa3dd0e4c65407563f08ff1c2f6a439265966                                                                     │
│  │ Sender: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                                                       │
│  │ Owner: Shared                                                                                                                                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xe1fb6293d4461f3a443b8a484c70bde344ce239def4f6412abeae531e3f4a38e::Kecson_Faucet_Coin::KECSON_FAUCET_COIN>   │
│  │ Version: 82054380                                                                                                                                │
│  │ Digest: GTxfmL5aaCiGtCaW3uz1yKp9GV2hNH5EjMeYH4dkmRnf                                                                                             │
│  └──                                                                                                                                                │
│  ┌──                                                                                                                                                │
│  │ ObjectID: 0x0b448e42436e03e8cfbb03a597941351fb406719f62b6ea1e5f3ea1cb661d247                                                                     │
│  │ Sender: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                                                       │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )                                                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xe1fb6293d4461f3a443b8a484c70bde344ce239def4f6412abeae531e3f4a38e::Kecson_Coin::KECSON_COIN>                 │
│  │ Version: 82054380                                                                                                                                │
│  │ Digest: 2F8M2fsWs43eHQEN9tFLc7wMZgnntZoXYHAZ1xYbbrCb                                                                                             │
│  └──                                                                                                                                                │
│  ┌──                                                                                                                                                │
│  │ ObjectID: 0x555c830518938afbe86ce571c0d171e762e0e27222f6bd11ef016950d994e1dd                                                                     │
│  │ Sender: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                                                       │
│  │ Owner: Immutable                                                                                                                                 │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xe1fb6293d4461f3a443b8a484c70bde344ce239def4f6412abeae531e3f4a38e::Kecson_Faucet_Coin::KECSON_FAUCET_COIN>  │
│  │ Version: 82054380                                                                                                                                │
│  │ Digest: BKQ1wmXSpx6ReU4horPBQoDHyp6ufqbnfudSnrqQo92Y                                                                                             │
│  └──                                                                                                                                                │
│  ┌──                                                                                                                                                │
│  │ ObjectID: 0xbf300a6a94dae1de312def6c59e35b0863316770262e2275005b74b001ea7760                                                                     │
│  │ Sender: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                                                       │
│  │ Owner: Immutable                                                                                                                                 │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xe1fb6293d4461f3a443b8a484c70bde344ce239def4f6412abeae531e3f4a38e::Kecson_Coin::KECSON_COIN>                │
│  │ Version: 82054380                                                                                                                                │
│  │ Digest: 6mfApYDe2AvTqZUUbrK66p6PEQaBbZAbTiei3SpqL4ta                                                                                             │
│  └──                                                                                                                                                │
│  ┌──                                                                                                                                                │
│  │ ObjectID: 0xe36cac7347052ec8e4641ca0d220fff8055561f21e96dc9d88cd83ae3e691ead                                                                     │
│  │ Sender: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                                                       │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )                                                    │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                                             │
│  │ Version: 82054380                                                                                                                                │
│  │ Digest: FAnJHWVdQHgLKAyxVVkynktqPCzWa37uujzQE7W3FJLP                                                                                             │
│  └──                                                                                                                                                │
│ Mutated Objects:                                                                                                                                    │
│  ┌──                                                                                                                                                │
│  │ ObjectID: 0x060eab2fd8a59f2d4872a3d05339cb947111d51756fa7dc4295608ef470413d3                                                                     │
│  │ Sender: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                                                       │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )                                                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                       │
│  │ Version: 82054380                                                                                                                                │
│  │ Digest: GDXYzhCUKDnVWfDENrJsaFZosYoKTvrdaNfcgAcc2c3W                                                                                             │
│  └──                                                                                                                                                │
│ Published Objects:                                                                                                                                  │
│  ┌──                                                                                                                                                │
│  │ PackageID: 0xe1fb6293d4461f3a443b8a484c70bde344ce239def4f6412abeae531e3f4a38e                                                                    │
│  │ Version: 1                                                                                                                                       │
│  │ Digest: 9sapHE9WhDu7jgYubewUuqpRWQLjFQgcFYrCdosj8ery                                                                                             │
│  │ Modules: Kecson_Coin, Kecson_Faucet_Coin                                                                                                         │
│  └──                                                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -28765880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```