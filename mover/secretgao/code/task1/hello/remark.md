
### 发布合约
* sui move build 
* sui client publish --gas-budget 800000000 --skip-dependency-verification --skip-fetch-latest-git-deps
* https://explorer.polymedia.app/object/0xe6a9b895fd1ff32f38ec805b105fcef8fd3b5583aa2999b217f100ebf1178666?module=hello&network=testnet
```
Transaction Digest: 4pKuvktWzi2UyG8C2SDABPsKsbyYpGwo1qx1h6VvG2u9
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a                                   │
│ Gas Owner: 0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a                                │
│ Gas Budget: 800000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x3136a7ce7db1d97c1446fc99f624afe15f30b9c8dea283b7b8e9867b29922995                                    │
│  │ Version: 177666696                                                                                        │
│  │ Digest: 2qP1Wncgb3DMZUzH3TPmwPKnEzrNYebyQUjHepiroX9W                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a" │ │
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
│    7qDfYFFaGLC5E6RksABf5bdd47yA5VVDrTm7b5VFMzRWv2JquDYYtnksvlc16dj8o/5mnszqexeCSobFlFVJAw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4pKuvktWzi2UyG8C2SDABPsKsbyYpGwo1qx1h6VvG2u9                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 546                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2b70bc57e5097c540be6caf197ca1a552a6ec9e76e3068f39e8528dc3833d76d                         │
│  │ Owner: Account Address ( 0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a )  │
│  │ Version: 177666697                                                                             │
│  │ Digest: 6YVFussiCuD5ATakNuEYN9qrNHFfRHxku2kxzb1EcZsG                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe6a9b895fd1ff32f38ec805b105fcef8fd3b5583aa2999b217f100ebf1178666                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 7uqxKZSqHnuSnRpC9U4Bv5EyGR3rt9U1RDj4DpPTFM9d                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3136a7ce7db1d97c1446fc99f624afe15f30b9c8dea283b7b8e9867b29922995                         │
│  │ Owner: Account Address ( 0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a )  │
│  │ Version: 177666697                                                                             │
│  │ Digest: BtJef7qHSdq54s1Fxw3DrNqxJyFENGDAcVWU8KgBKQUM                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3136a7ce7db1d97c1446fc99f624afe15f30b9c8dea283b7b8e9867b29922995                         │
│  │ Owner: Account Address ( 0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a )  │
│  │ Version: 177666697                                                                             │
│  │ Digest: BtJef7qHSdq54s1Fxw3DrNqxJyFENGDAcVWU8KgBKQUM                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7934400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    Az7fAdeLDLnUMBvvihZnr8N9m27qW4doufwhV8hznsDi                                                   │
│    GMBJA2gEEvtwv1wGGT7ZEDkQdrmUTKaE4TeinNGQ2feC                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x2b70bc57e5097c540be6caf197ca1a552a6ec9e76e3068f39e8528dc3833d76d                  │
│  │ Sender: 0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a                    │
│  │ Owner: Account Address ( 0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 177666697                                                                            │
│  │ Digest: 6YVFussiCuD5ATakNuEYN9qrNHFfRHxku2kxzb1EcZsG                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x3136a7ce7db1d97c1446fc99f624afe15f30b9c8dea283b7b8e9867b29922995                  │
│  │ Sender: 0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a                    │
│  │ Owner: Account Address ( 0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 177666697                                                                            │
│  │ Digest: BtJef7qHSdq54s1Fxw3DrNqxJyFENGDAcVWU8KgBKQUM                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xe6a9b895fd1ff32f38ec805b105fcef8fd3b5583aa2999b217f100ebf1178666                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 7uqxKZSqHnuSnRpC9U4Bv5EyGR3rt9U1RDj4DpPTFM9d                                          │
│  │ Modules: hello                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7bb8f8b7bb38ad37de7cdd4d9897245c8c85b886aed673b2962363433033908a )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7956280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

