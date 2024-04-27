# Prerequisite
I have two addresses:
1. Wallet Address: `0x5386d422ca6ea07e92f39c2293a2af009a2bd59682df4fdd1981e97b40ed8a54` — This is used to receive rewards and was created via the UI. Local Address (Alias: flamboyant-hematite): Used primarily for deployment and execution tasks.
2. Local Address (Alias: `flamboyant-hematite`): Used primarily for deployment and execution tasks.

After completing Task 1, rewards were received at the wallet address. Now, to deploy Task 2 to the `mainnet`, I need to transfer coins from my wallet address to my `flamboyant-hematite` address. To do this, simply use the UI: navigate to the sending options and click the 'Send' button.

# Testnet
my_coin: packageid: 0xfb5bcafe8b26d44528d357b814378bd03ccabc1099a17f85f6634a0d6962cdb9
faucet_coin:
```txt
Transaction Digest: 4fESSpcdv6BZp5mT3kgkriZiNty54rFJmco7wbaAWch3
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70                                   │
│ Gas Owner: 0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70                                │
│ Gas Budget: 40000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x108c331eb699443281256ecdc31263419d584a40ffaac927f39c5f266c76ac42                                    │
│  │ Version: 1102468                                                                                          │
│  │ Digest: 2sGQQa6GnSwpp2yNNktPKKf4ByCTD1JEFRZTxn553d73                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70" │ │
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
│    LxGXMh6zPrn1gpEW02gyMmYZwWMeUel1oAe24+XOMyOLC+JXONBMrjTrDD08Hy+ftSJfeu4KlJSfqJKi68yDAw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4fESSpcdv6BZp5mT3kgkriZiNty54rFJmco7wbaAWch3                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4f596d5d67332d0730027566cbe5a346ed7f15fc80c44ea30317455e1da088ec                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1102469                                                                               │
│  │ Digest: C5HQF5MuGiGYMMADx9ZQMRAtAj1U9R2fRfp3BNVemQf5                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5e278ba2c36f726e20d230c267ffe3647f464b2229f8e47064d25cd8038186d8                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 4zxDJ3eKRNVtyPSJRgnXZvZzwUZ4dKFSn6UH3zeGR3Cb                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa64afa4f28c5c89187eef180f4afd22bf64082d2a9539a679daaa8a6760203d1                         │
│  │ Owner: Account Address ( 0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70 )  │
│  │ Version: 1102469                                                                               │
│  │ Digest: HWw3BPGoLErdWWaUKwqHGAjsD3jF9zc9dALeQpn4srVp                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe6a539415c56d7df48bb5df121c9e87630a7a74e58960571dc7a8d1dccbc547b                         │
│  │ Owner: Account Address ( 0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70 )  │
│  │ Version: 1102469                                                                               │
│  │ Digest: 3qPxYzSDjC2gdxf3pcZj7eeBCRZHH8ML2CN61E3baP91                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x108c331eb699443281256ecdc31263419d584a40ffaac927f39c5f266c76ac42                         │
│  │ Owner: Account Address ( 0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70 )  │
│  │ Version: 1102469                                                                               │
│  │ Digest: 4nGsJvdsL3U1osW8e13uoNRtiw5VTbPgW1sAJu4grmAp                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x108c331eb699443281256ecdc31263419d584a40ffaac927f39c5f266c76ac42                         │
│  │ Owner: Account Address ( 0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70 )  │
│  │ Version: 1102469                                                                               │
│  │ Digest: 4nGsJvdsL3U1osW8e13uoNRtiw5VTbPgW1sAJu4grmAp                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 14972000 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    GZo3HmwM11sto5MVHaENhArVHFjbphfGmf4Kr5nZJUAt                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                    │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                  │
│  ┌──                                                                                                                                              │
│  │ ObjectID: 0x4f596d5d67332d0730027566cbe5a346ed7f15fc80c44ea30317455e1da088ec                                                                   │
│  │ Sender: 0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70                                                                     │
│  │ Owner: Immutable                                                                                                                               │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x5e278ba2c36f726e20d230c267ffe3647f464b2229f8e47064d25cd8038186d8::liushuyu6666_coin::LIUSHUYU6666_COIN>  │
│  │ Version: 1102469                                                                                                                               │
│  │ Digest: C5HQF5MuGiGYMMADx9ZQMRAtAj1U9R2fRfp3BNVemQf5                                                                                           │
│  └──                                                                                                                                              │
│  ┌──                                                                                                                                              │
│  │ ObjectID: 0xa64afa4f28c5c89187eef180f4afd22bf64082d2a9539a679daaa8a6760203d1                                                                   │
│  │ Sender: 0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70                                                                     │
│  │ Owner: Account Address ( 0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70 )                                                  │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                                           │
│  │ Version: 1102469                                                                                                                               │
│  │ Digest: HWw3BPGoLErdWWaUKwqHGAjsD3jF9zc9dALeQpn4srVp                                                                                           │
│  └──                                                                                                                                              │
│  ┌──                                                                                                                                              │
│  │ ObjectID: 0xe6a539415c56d7df48bb5df121c9e87630a7a74e58960571dc7a8d1dccbc547b                                                                   │
│  │ Sender: 0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70                                                                     │
│  │ Owner: Account Address ( 0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70 )                                                  │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x5e278ba2c36f726e20d230c267ffe3647f464b2229f8e47064d25cd8038186d8::liushuyu6666_coin::LIUSHUYU6666_COIN>   │
│  │ Version: 1102469                                                                                                                               │
│  │ Digest: 3qPxYzSDjC2gdxf3pcZj7eeBCRZHH8ML2CN61E3baP91                                                                                           │
│  └──                                                                                                                                              │
│ Mutated Objects:                                                                                                                                  │
│  ┌──                                                                                                                                              │
│  │ ObjectID: 0x108c331eb699443281256ecdc31263419d584a40ffaac927f39c5f266c76ac42                                                                   │
│  │ Sender: 0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70                                                                     │
│  │ Owner: Account Address ( 0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70 )                                                  │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                     │
│  │ Version: 1102469                                                                                                                               │
│  │ Digest: 4nGsJvdsL3U1osW8e13uoNRtiw5VTbPgW1sAJu4grmAp                                                                                           │
│  └──                                                                                                                                              │
│ Published Objects:                                                                                                                                │
│  ┌──                                                                                                                                              │
│  │ PackageID: 0x5e278ba2c36f726e20d230c267ffe3647f464b2229f8e47064d25cd8038186d8                                                                  │
│  │ Version: 1                                                                                                                                     │
│  │ Digest: 4zxDJ3eKRNVtyPSJRgnXZvZzwUZ4dKFSn6UH3zeGR3Cb                                                                                           │
│  │ Modules: liushuyu6666_coin                                                                                                                     │
│  └──                                                                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x05e6a0a63f33f814dcb793c95f20a07e9ef190cf8aaf71f0e61805c8ab2e9b70 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -14993880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
