<style>
pre {
    overflow-y:auto;
    max-height: 300px;
}
</style>

# task 3

### Build Package：

```bash
cd ../code/task3
sui move build
```

### Publish Package：

```bash
cd ../code/task3
sui client publish --gas-budget 50000000
```

* Publish Log:

```text
/opt/homebrew/bin/sui client publish --gas-budget 50000000
[warn] Client/Server api version mismatch, client api version : 1.23.1, server api version : 1.22.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3
Successfully verified dependencies on-chain against source.
Transaction Digest: 4RefBpUiNgqqFMCg1c5wAak7oegEsQ3M1R79vWo5kHLL
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
│  │ Version: 84858792                                                                                         │
│  │ Digest: HqEZU3BdwkQ3xjSWmhXKY4UMU7GDz48ak7FREhWysbuy                                                      │
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
│    9GkrmsPMdeGzBKNgCBUrFAfCCGQohFK4eYASMQbUKOPJXhDQM4eGpJJ5fZy05Y/DE3RiHArj4rEVRv9BPaDoAQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4RefBpUiNgqqFMCg1c5wAak7oegEsQ3M1R79vWo5kHLL                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 376                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x099c5e0c22ae80d9e8221cb7cf6e4272019bc76e8ab0133a8f585025282ea7f4                         │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )  │
│  │ Version: 84858793                                                                              │
│  │ Digest: 7tnSuNFknEwWtyeKHHsYXU1a14zBbiG4DRHwfL4wxN2v                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3eeada13fab8da6e97f42599e7e5adf8609b8a7a69ebd3f8002d2b513d598b6d                         │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )  │
│  │ Version: 84858793                                                                              │
│  │ Digest: BAs6CSMDF5pSGHBPGe3MK5nbsZZK4npHtNRee4qcQHf9                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x97f87c0552c3c8969b6e6c3cdb6164035072da61c338f418de9906dd8cea566b                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 84858793                                                                              │
│  │ Digest: dL3Xqy1wGyE1RmNY6pUY6xNXreb9uET44wYPiWiRajK                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9b1af4b31d517d812145342cbd5f6a5f416b0901eee33db8b70be7587d3a695e                         │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )  │
│  │ Version: 84858793                                                                              │
│  │ Digest: BpT5uhBkizCsPq5VGkx3RdtGRHxJVZx5iYJqesxnagTK                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb44730bac00679ca9babf827d140ad9154dbfd62470bb1f07b61b3a70a1f758b                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: B5E9q9MHvGU1nRHJ83jNF3rBxWWFeDHnxyturZRafWRu                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x060eab2fd8a59f2d4872a3d05339cb947111d51756fa7dc4295608ef470413d3                         │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )  │
│  │ Version: 84858793                                                                              │
│  │ Digest: C7VMhxHzC1HNSzenRJevvH1KWpRkGDGgqPsnoUQMtLRA                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x060eab2fd8a59f2d4872a3d05339cb947111d51756fa7dc4295608ef470413d3                         │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )  │
│  │ Version: 84858793                                                                              │
│  │ Digest: C7VMhxHzC1HNSzenRJevvH1KWpRkGDGgqPsnoUQMtLRA                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 25764000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    HZTw48iAJgnqysNqQ7sB7iqzXZ7ssGnd8VgNr3KkuuBh                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                              │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                                  │
│  │ EventID: 4RefBpUiNgqqFMCg1c5wAak7oegEsQ3M1R79vWo5kHLL:0                                                                            │
│  │ PackageID: 0xb44730bac00679ca9babf827d140ad9154dbfd62470bb1f07b61b3a70a1f758b                                                      │
│  │ Transaction Module: Kecson_NFT                                                                                                     │
│  │ Sender: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                                         │
│  │ EventType: 0x2::display::DisplayCreated<0xb44730bac00679ca9babf827d140ad9154dbfd62470bb1f07b61b3a70a1f758b::Kecson_NFT::KecsonNft> │
│  │ ParsedJSON:                                                                                                                        │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                                      │
│  │   │ id │ 0x3eeada13fab8da6e97f42599e7e5adf8609b8a7a69ebd3f8002d2b513d598b6d │                                                      │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                                      │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ EventID: 4RefBpUiNgqqFMCg1c5wAak7oegEsQ3M1R79vWo5kHLL:1                                                                            │
│  │ PackageID: 0xb44730bac00679ca9babf827d140ad9154dbfd62470bb1f07b61b3a70a1f758b                                                      │
│  │ Transaction Module: Kecson_NFT                                                                                                     │
│  │ Sender: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                                         │
│  │ EventType: 0x2::display::VersionUpdated<0xb44730bac00679ca9babf827d140ad9154dbfd62470bb1f07b61b3a70a1f758b::Kecson_NFT::KecsonNft> │
│  │ ParsedJSON:                                                                                                                        │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                                 │
│  │   │ fields  │ contents │ key   │ name                                            │                                                 │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                                 │
│  │   │         │          │ value │ {name}                                          │                                                 │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                                 │
│  │   │         │          │ key   │ image_url                                       │                                                 │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                                 │
│  │   │         │          │ value │ {image_url}                                     │                                                 │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                                 │
│  │   │         │          │ key   │ description                                     │                                                 │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                                 │
│  │   │         │          │ value │ letsmove task3 Kecson NFT                       │                                                 │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                                 │
│  │   │         │          │ key   │ creator                                         │                                                 │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                                 │
│  │   │         │          │ value │ {creator}                                       │                                                 │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                                 │
│  │   │ id      │ 0x3eeada13fab8da6e97f42599e7e5adf8609b8a7a69ebd3f8002d2b513d598b6d │                                                 │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                                 │
│  │   │ version │ 1                                                                  │                                                 │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                                 │
│  └──                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                 │
│  ┌──                                                                                                                             │
│  │ ObjectID: 0x099c5e0c22ae80d9e8221cb7cf6e4272019bc76e8ab0133a8f585025282ea7f4                                                  │
│  │ Sender: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                                    │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )                                 │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                          │
│  │ Version: 84858793                                                                                                             │
│  │ Digest: 7tnSuNFknEwWtyeKHHsYXU1a14zBbiG4DRHwfL4wxN2v                                                                          │
│  └──                                                                                                                             │
│  ┌──                                                                                                                             │
│  │ ObjectID: 0x3eeada13fab8da6e97f42599e7e5adf8609b8a7a69ebd3f8002d2b513d598b6d                                                  │
│  │ Sender: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                                    │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )                                 │
│  │ ObjectType: 0x2::display::Display<0xb44730bac00679ca9babf827d140ad9154dbfd62470bb1f07b61b3a70a1f758b::Kecson_NFT::KecsonNft>  │
│  │ Version: 84858793                                                                                                             │
│  │ Digest: BAs6CSMDF5pSGHBPGe3MK5nbsZZK4npHtNRee4qcQHf9                                                                          │
│  └──                                                                                                                             │
│  ┌──                                                                                                                             │
│  │ ObjectID: 0x97f87c0552c3c8969b6e6c3cdb6164035072da61c338f418de9906dd8cea566b                                                  │
│  │ Sender: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                                    │
│  │ Owner: Shared                                                                                                                 │
│  │ ObjectType: 0xb44730bac00679ca9babf827d140ad9154dbfd62470bb1f07b61b3a70a1f758b::Kecson_NFT::KecsonNftCap                      │
│  │ Version: 84858793                                                                                                             │
│  │ Digest: dL3Xqy1wGyE1RmNY6pUY6xNXreb9uET44wYPiWiRajK                                                                           │
│  └──                                                                                                                             │
│  ┌──                                                                                                                             │
│  │ ObjectID: 0x9b1af4b31d517d812145342cbd5f6a5f416b0901eee33db8b70be7587d3a695e                                                  │
│  │ Sender: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                                    │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )                                 │
│  │ ObjectType: 0x2::package::Publisher                                                                                           │
│  │ Version: 84858793                                                                                                             │
│  │ Digest: BpT5uhBkizCsPq5VGkx3RdtGRHxJVZx5iYJqesxnagTK                                                                          │
│  └──                                                                                                                             │
│ Mutated Objects:                                                                                                                 │
│  ┌──                                                                                                                             │
│  │ ObjectID: 0x060eab2fd8a59f2d4872a3d05339cb947111d51756fa7dc4295608ef470413d3                                                  │
│  │ Sender: 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed                                                    │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )                                 │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                    │
│  │ Version: 84858793                                                                                                             │
│  │ Digest: C7VMhxHzC1HNSzenRJevvH1KWpRkGDGgqPsnoUQMtLRA                                                                          │
│  └──                                                                                                                             │
│ Published Objects:                                                                                                               │
│  ┌──                                                                                                                             │
│  │ PackageID: 0xb44730bac00679ca9babf827d140ad9154dbfd62470bb1f07b61b3a70a1f758b                                                 │
│  │ Version: 1                                                                                                                    │
│  │ Digest: B5E9q9MHvGU1nRHJ83jNF3rBxWWFeDHnxyturZRafWRu                                                                          │
│  │ Modules: Kecson_NFT                                                                                                           │
│  └──                                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x16f6a28b51126e93227146928f00ace5b5db23468f867b198dcd2c98df63feed )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -25535880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

Process finished with exit code 0

```

### Mint NFT:

```bash
sui client call \
--gas-budget 5000000 \
--package 0xb44730bac00679ca9babf827d140ad9154dbfd62470bb1f07b61b3a70a1f758b \
--module Kecson_NFT \
--function mint_to \
--args \
"kecson NFT" \
"https://avatars.githubusercontent.com/u/10434414?v=4" \
0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \
0x97f87c0552c3c8969b6e6c3cdb6164035072da61c338f418de9906dd8cea566b
```