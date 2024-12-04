# Task3

```bash
> sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3
```

```bash
> sui client publish --gas-budget 50000000 --skip-dependency-verification
sui client publish --gas-budget 50000000 --skip-dependency-verification
[warn] Client/Server api version mismatch, client api version : 1.28.0, server api version : 1.29.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3
Skipping dependency verification
Transaction Digest: 3f9t4LyByvMf9PtufDNHb9Q16bNQk9EfbmPrKu5rdJUc
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                   │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                                    │
│  │ Version: 84                                                                                               │
│  │ Digest: HpHhN8wNedo4jMpkQquEyeWJuv2RDWCznJgH1aJ3UwFP                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc" │ │
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
│    aILrilGY6VQUfWefY9fDhEpuMJTOOGj0obpWi2+3641oQTtwLed37WGlBfRjSmKQy3Anz/gFurpU2dcLilOHDA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3f9t4LyByvMf9PtufDNHb9Q16bNQk9EfbmPrKu5rdJUc                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 129                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6b17762b14b53e52a0b1dae1a8a4fe406b312bc04928abdd9d89752e849a7ca9                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 85                                                                                    │
│  │ Digest: 9tkmDbQY8RCuPFHCxygtGQgTEgBkK28baCe7PenA5So7                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9a1b725175fdabd8f98febd957c9be9706cd4562c33b11a985cfb2b9dcdd9391                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 8itLnMREJWbpQ5dvotxKqiP28dKhXYiKxXLQ4HoJKutY                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 85                                                                                    │
│  │ Digest: 2C7aPV6o8c1TncPZK1t21shny1j6xFLhawutYSic91GN                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 85                                                                                    │
│  │ Digest: 2C7aPV6o8c1TncPZK1t21shny1j6xFLhawutYSic91GN                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 11172000 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4SW7smWcZp4sKS5o9vaSAUEjMojpsbkWQmxNrBbfnbUp                                                   │
│    E4KEoBaW3osvyMtt8H11XTND1pPmX32e4d4RPgfZU3p7                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x6b17762b14b53e52a0b1dae1a8a4fe406b312bc04928abdd9d89752e849a7ca9                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                    │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 85                                                                                   │
│  │ Digest: 9tkmDbQY8RCuPFHCxygtGQgTEgBkK28baCe7PenA5So7                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                    │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 85                                                                                   │
│  │ Digest: 2C7aPV6o8c1TncPZK1t21shny1j6xFLhawutYSic91GN                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x9a1b725175fdabd8f98febd957c9be9706cd4562c33b11a985cfb2b9dcdd9391                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 8itLnMREJWbpQ5dvotxKqiP28dKhXYiKxXLQ4HoJKutY                                          │
│  │ Modules: move_nft                                                                             │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -11193880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


```bash
sui client call --function mint_to_sender --module move_nft --package 0x9a1b725175fdabd8f98febd957c9be9706cd4562c33b11a985cfb2b9dcdd9391 --gas-budget 4000000 --args RustBetaNFT "rustbeta MoveNFT in the World" "https://avatars.githubusercontent.com/u/174920020?v=4" 

[warn] Client/Server api version mismatch, client api version : 1.28.0, server api version : 1.29.0
Transaction Digest: 33eno8wurS5CFYFwNFUoA6YJV2KAPGFBP7Hmy6M3T8K6
╭────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                   │
├────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                         │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                      │
│ Gas Budget: 4000000 MIST                                                                           │
│ Gas Price: 1000 MIST                                                                               │
│ Gas Payment:                                                                                       │
│  ┌──                                                                                               │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                          │
│  │ Version: 85                                                                                     │
│  │ Digest: 2C7aPV6o8c1TncPZK1t21shny1j6xFLhawutYSic91GN                                            │
│  └──                                                                                               │
│                                                                                                    │
│ Transaction Kind: Programmable                                                                     │
│ ╭────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                  │ │
│ ├────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "RustBetaNFT"                                           │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "rustbeta MoveNFT in the World"                         │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "https://avatars.githubusercontent.com/u/174920020?v=4" │ │
│ ╰────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮               │
│ │ Commands                                                                         │               │
│ ├──────────────────────────────────────────────────────────────────────────────────┤               │
│ │ 0  MoveCall:                                                                     │               │
│ │  ┌                                                                               │               │
│ │  │ Function:  mint_to_sender                                                     │               │
│ │  │ Module:    move_nft                                                           │               │
│ │  │ Package:   0x9a1b725175fdabd8f98febd957c9be9706cd4562c33b11a985cfb2b9dcdd9391 │               │
│ │  │ Arguments:                                                                    │               │
│ │  │   Input  0                                                                    │               │
│ │  │   Input  1                                                                    │               │
│ │  │   Input  2                                                                    │               │
│ │  └                                                                               │               │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯               │
│                                                                                                    │
│ Signatures:                                                                                        │
│    zzIVOquou+WxGQpHKhqYJVidewnJYD4cqmF6/R6ql9noMkPTaQ7qKzZQmmmdg/Mo9l8zMCxnYYvfWFT5R8CqAQ==        │
│                                                                                                    │
╰────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 33eno8wurS5CFYFwNFUoA6YJV2KAPGFBP7Hmy6M3T8K6                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 129                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0960adc5b398f3fbbceee4a00561a31a418636fa64e95047bff3813d79a3d467                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 86                                                                                    │
│  │ Digest: 8VM7NAzLC3zBA1HnTHB451MhtU2o2oADAPq7oV89YWzA                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 86                                                                                    │
│  │ Digest: 7pwxBPQUBV1PvHeqUph48gifWP4BoUzfF2Q2PrSTr549                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 86                                                                                    │
│  │ Digest: 7pwxBPQUBV1PvHeqUph48gifWP4BoUzfF2Q2PrSTr549                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3024800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3f9t4LyByvMf9PtufDNHb9Q16bNQk9EfbmPrKu5rdJUc                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                             │
│  │ EventID: 33eno8wurS5CFYFwNFUoA6YJV2KAPGFBP7Hmy6M3T8K6:0                                                       │
│  │ PackageID: 0x9a1b725175fdabd8f98febd957c9be9706cd4562c33b11a985cfb2b9dcdd9391                                 │
│  │ Transaction Module: move_nft                                                                                  │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                    │
│  │ EventType: 0x9a1b725175fdabd8f98febd957c9be9706cd4562c33b11a985cfb2b9dcdd9391::move_nft::MoveNFTTransferEvent │
│  │ ParsedJSON:                                                                                                   │
│  │   ┌───────────┬────────────────────────────────────────────────────────────────────┐                          │
│  │   │ creator   │ 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc │                          │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                          │
│  │   │ name      │ RustBetaNFT                                                        │                          │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                          │
│  │   │ object_id │ 0x0960adc5b398f3fbbceee4a00561a31a418636fa64e95047bff3813d79a3d467 │                          │
│  │   └───────────┴────────────────────────────────────────────────────────────────────┘                          │
│  └──                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x0960adc5b398f3fbbceee4a00561a31a418636fa64e95047bff3813d79a3d467                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )      │
│  │ ObjectType: 0x9a1b725175fdabd8f98febd957c9be9706cd4562c33b11a985cfb2b9dcdd9391::move_nft::MoveNFT  │
│  │ Version: 86                                                                                        │
│  │ Digest: 8VM7NAzLC3zBA1HnTHB451MhtU2o2oADAPq7oV89YWzA                                               │
│  └──                                                                                                  │
│ Mutated Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                         │
│  │ Version: 86                                                                                        │
│  │ Digest: 7pwxBPQUBV1PvHeqUph48gifWP4BoUzfF2Q2PrSTr549                                               │
│  └──                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3046680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


```bash
sui client call --function transfer --module move_nft --package 0x9a1b725175fdabd8f98febd957c9be9706cd4562c33b11a985cfb2b9dcdd9391 --gas-budget 2000000 --args 0x0960adc5b398f3fbbceee4a00561a31a418636fa64e95047bff3813d79a3d467 0xb2886490b40668a555515fa7faa9de0b590464a0868ef2876202b494ac9ccdb9

[warn] Client/Server api version mismatch, client api version : 1.28.0, server api version : 1.29.0
Transaction Digest: 45w1YqnmYC7meR6iya4ehQKEH8k6bYouGFzKZ5Fn34WD
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                   │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                │
│ Gas Budget: 2000000 MIST                                                                                     │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                                    │
│  │ Version: 86                                                                                               │
│  │ Digest: 7pwxBPQUBV1PvHeqUph48gifWP4BoUzfF2Q2PrSTr549                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x0960adc5b398f3fbbceee4a00561a31a418636fa64e95047bff3813d79a3d467              │ │
│ │ 1   Pure Arg: Type: address, Value: "0xb2886490b40668a555515fa7faa9de0b590464a0868ef2876202b494ac9ccdb9" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  transfer                                                           │                         │
│ │  │ Module:    move_nft                                                           │                         │
│ │  │ Package:   0x9a1b725175fdabd8f98febd957c9be9706cd4562c33b11a985cfb2b9dcdd9391 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    9d6s4n8cHp0bxvW/JDC/tMtGXvIYsVafepr0VlRQeANCN0wTdkTEhBmDzKuud/md0jGHlphCefvi2a0BhmhbBg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 45w1YqnmYC7meR6iya4ehQKEH8k6bYouGFzKZ5Fn34WD                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 129                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0960adc5b398f3fbbceee4a00561a31a418636fa64e95047bff3813d79a3d467                         │
│  │ Owner: Account Address ( 0xb2886490b40668a555515fa7faa9de0b590464a0868ef2876202b494ac9ccdb9 )  │
│  │ Version: 87                                                                                    │
│  │ Digest: 7osENyNDCeheWxrpqEA3Xypyqm5Tp5Ee5KVKsEaFXZbu                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 87                                                                                    │
│  │ Digest: GEWbwekzTuiqZvYcUAa3xpXxVSUAy2KnqgBPNM5i3DgD                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 87                                                                                    │
│  │ Digest: GEWbwekzTuiqZvYcUAa3xpXxVSUAy2KnqgBPNM5i3DgD                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3024800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2994552 MIST                                                                   │
│    Non-refundable Storage Fee: 30248 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    33eno8wurS5CFYFwNFUoA6YJV2KAPGFBP7Hmy6M3T8K6                                                   │
│    3f9t4LyByvMf9PtufDNHb9Q16bNQk9EfbmPrKu5rdJUc                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x0960adc5b398f3fbbceee4a00561a31a418636fa64e95047bff3813d79a3d467                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                         │
│  │ Owner: Account Address ( 0xb2886490b40668a555515fa7faa9de0b590464a0868ef2876202b494ac9ccdb9 )      │
│  │ ObjectType: 0x9a1b725175fdabd8f98febd957c9be9706cd4562c33b11a985cfb2b9dcdd9391::move_nft::MoveNFT  │
│  │ Version: 87                                                                                        │
│  │ Digest: 7osENyNDCeheWxrpqEA3Xypyqm5Tp5Ee5KVKsEaFXZbu                                               │
│  └──                                                                                                  │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                         │
│  │ Version: 87                                                                                        │
│  │ Digest: GEWbwekzTuiqZvYcUAa3xpXxVSUAy2KnqgBPNM5i3DgD                                               │
│  └──                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1030248                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```