# NFT Ticket Draw
	•	create: 创建游戏。
	•	buy_ticket: 用户购买门票。
	•	determine_winner: 在游戏结束时确定赢家。
	•	redeem: 赢家兑换奖励。

这是一个简单的流程，通过创建、购买、确定赢家和奖励兑换完成整个游戏逻辑。

## 实操
### 发布
```shell
letsmove/mover/qiaopengjun5162/code/task4/NFTicketDraw on  main [⇣!?] via 🅒 base took 5.2s 
➜ sui client publish --gas-budget 100000000 --skip-fetch-latest-git-deps --skip-dependency-verification  
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.36.2
INCLUDING DEPENDENCY faucet_coin
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING NFTicketDraw
Skipping dependency verification
Transaction Digest: GorLrz7Kk8JH55ANCxLaUNcWCeimTJm1qpBecuWRf85H
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                   │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                                    │
│  │ Version: 315156592                                                                                        │
│  │ Digest: f7KBAZSKxmYDvmu5uzApmMf4pSawZeeFS16qQjYLWqP                                                       │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  │   0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a │                                  │
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
│    eH0M8wVgFBpd7bddp0/G2Y7/ea9PZ19d3D2iFeuR6kxVfT2Jl72HqZJK2D9NDOBl6u/p6WCFCGmfFCuVQj0LCw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GorLrz7Kk8JH55ANCxLaUNcWCeimTJm1qpBecuWRf85H                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 575                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x496748d4d94c241583d915fb6e81f52601dc2c813af3d5e9584d5643d69f1afd                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: FmkXfa3FmDp4GMBZ9m6A3qE2KnwKQWaParSascMAyQqD                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xcf45b8cafcc50b47db08e1f1d32604bc0f568d27d1d240f6b7a26357f9a56586                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 315156593                                                                             │
│  │ Digest: 9KDX5QEkVc3Pno9K1YcupWLnBY5a1RJtJo8Ci76mnqaW                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 315156593                                                                             │
│  │ Digest: 3zg1TxSMcUg8VJWkZ6CXS9XqJs57fsfh4oyrRpfph6XV                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 315156593                                                                             │
│  │ Digest: 3zg1TxSMcUg8VJWkZ6CXS9XqJs57fsfh4oyrRpfph6XV                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 20558000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    49puDQZwHRnu7zYoARCjco1dFKMiK7LVSS8B5Si1yVdh                                                   │
│    8MkMyu5cseLwqyWDwg947q7U2d7ipSoGu9LZQh744JRJ                                                   │
│    GpZPCRjYwezkdC2PGVFrJDdTzkN6KVJwarqB7roPDWKE                                                   │
│    GvbJ8ia1HfavuccAmi8EJJAaCGShtdv4NWrs1B13vvom                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xcf45b8cafcc50b47db08e1f1d32604bc0f568d27d1d240f6b7a26357f9a56586                  │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                    │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 315156593                                                                            │
│  │ Digest: 9KDX5QEkVc3Pno9K1YcupWLnBY5a1RJtJo8Ci76mnqaW                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                  │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                    │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 315156593                                                                            │
│  │ Digest: 3zg1TxSMcUg8VJWkZ6CXS9XqJs57fsfh4oyrRpfph6XV                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x496748d4d94c241583d915fb6e81f52601dc2c813af3d5e9584d5643d69f1afd                 │
│  │ Version: 1                                                                                    │
│  │ Digest: FmkXfa3FmDp4GMBZ9m6A3qE2KnwKQWaParSascMAyQqD                                          │
│  │ Modules: nfticketdraw                                                                         │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -20329880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

letsmove/mover/qiaopengjun5162/code/task4/NFTicketDraw on  main [⇣!?] via 🅒 base took 10.5s 
➜ 

```


调用方法
````shell
export PACKAGE_ID=0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c
export TREASURYCAP_ID=0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2  
sui client call --function mint --module mycoin --package $PACKAGE_ID --args $TREASURYCAP_ID 100 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 10000000  


letsmove/mover/qiaopengjun5162/code/task4/NFTicketDraw on  main [⇣!?] via 🅒 base took 10.5s 
➜ export PACKAGE_ID=0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a                                                                  

letsmove/mover/qiaopengjun5162/code/task4/NFTicketDraw on  main [⇣!?] via 🅒 base 
➜ export MySupply=0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c          

letsmove/mover/qiaopengjun5162/code/task4/NFTicketDraw on  main [⇣!?] via 🅒 base 
➜ sui client call --function mint --module faucet_coin --package $PACKAGE_ID --args $MySupply 100 --gas-budget 10000000                                                                                                                                                                               
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.36.2
Transaction Digest: F8V1rPcLYR7QijakrbkZkzPEMfJeanUaPAidLnUTj9C7
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                      │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                       │
│  │ Version: 315156593                                                                           │
│  │ Digest: 3zg1TxSMcUg8VJWkZ6CXS9XqJs57fsfh4oyrRpfph6XV                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c │ │
│ │ 1   Pure Arg: Type: u64, Value: "100"                                                       │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  mint                                                               │            │
│ │  │ Module:    faucet_coin                                                        │            │
│ │  │ Package:   0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    n+6assbsM2KmMWFAgbTPE2xMGvlmXov1EByhHtRx7i3iv2TxHglVCWLkjmIEPZCzYKciq81kzNNBc/5PZP9DBA==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: F8V1rPcLYR7QijakrbkZkzPEMfJeanUaPAidLnUTj9C7                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 575                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xd9823fcb352a8b61ae290f8aba32ca5af406b85f32f01efd620a53596fbb3760                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 315156594                                                                             │
│  │ Digest: 8rhB1mDAUph9JwwLMr8kKsokwmmRXKsJ13ehHFco9igM                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 315156594                                                                             │
│  │ Digest: GoYBWwEuVTgfcKgkKn5qyXx9KFtUNdYW4CfCDpCsqNMk                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 315156594                                                                             │
│  │ Digest: DWG5H6EtqrCRwrCCn4woVcSuvKTsabzbwQQXV32FjkNe                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 315156594                                                                             │
│  │ Digest: GoYBWwEuVTgfcKgkKn5qyXx9KFtUNdYW4CfCDpCsqNMk                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3815200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2362536 MIST                                                                   │
│    Non-refundable Storage Fee: 23864 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    GorLrz7Kk8JH55ANCxLaUNcWCeimTJm1qpBecuWRf85H                                                   │
│    GvbJ8ia1HfavuccAmi8EJJAaCGShtdv4NWrs1B13vvom                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xd9823fcb352a8b61ae290f8aba32ca5af406b85f32f01efd620a53596fbb3760                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN>  │
│  │ Version: 315156594                                                                                                         │
│  │ Digest: 8rhB1mDAUph9JwwLMr8kKsokwmmRXKsJ13ehHFco9igM                                                                       │
│  └──                                                                                                                          │
│ Mutated Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                 │
│  │ Version: 315156594                                                                                                         │
│  │ Digest: GoYBWwEuVTgfcKgkKn5qyXx9KFtUNdYW4CfCDpCsqNMk                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::MySupply                      │
│  │ Version: 315156594                                                                                                         │
│  │ Digest: DWG5H6EtqrCRwrCCn4woVcSuvKTsabzbwQQXV32FjkNe                                                                       │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2202664                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN  │
│  │ Amount: 100                                                                                             │
│  └──                                                                                                       │

letsmove/mover/qiaopengjun5162/code/task4/NFTicketDraw on  main [⇣!?] via 🅒 base took 5.3s 
➜ 

letsmove/mover/qiaopengjun5162/code/task4/NFTicketDraw on  main [⇣!?] via 🅒 base took 10.5s 
➜ export PACKAGE_ID=0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a                                                                  

letsmove/mover/qiaopengjun5162/code/task4/NFTicketDraw on  main [⇣!?] via 🅒 base 
➜ export MySupply=0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c          

letsmove/mover/qiaopengjun5162/code/task4/NFTicketDraw on  main [⇣!?] via 🅒 base 
➜ sui client call --function mint --module faucet_coin --package $PACKAGE_ID --args $MySupply 100 --gas-budget 10000000                                                                                                                                                                               
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.36.2
Transaction Digest: F8V1rPcLYR7QijakrbkZkzPEMfJeanUaPAidLnUTj9C7
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                      │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                       │
│  │ Version: 315156593                                                                           │
│  │ Digest: 3zg1TxSMcUg8VJWkZ6CXS9XqJs57fsfh4oyrRpfph6XV                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c │ │
│ │ 1   Pure Arg: Type: u64, Value: "100"                                                       │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  mint                                                               │            │
│ │  │ Module:    faucet_coin                                                        │            │
│ │  │ Package:   0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    n+6assbsM2KmMWFAgbTPE2xMGvlmXov1EByhHtRx7i3iv2TxHglVCWLkjmIEPZCzYKciq81kzNNBc/5PZP9DBA==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: F8V1rPcLYR7QijakrbkZkzPEMfJeanUaPAidLnUTj9C7                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 575                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xd9823fcb352a8b61ae290f8aba32ca5af406b85f32f01efd620a53596fbb3760                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 315156594                                                                             │
│  │ Digest: 8rhB1mDAUph9JwwLMr8kKsokwmmRXKsJ13ehHFco9igM                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 315156594                                                                             │
│  │ Digest: GoYBWwEuVTgfcKgkKn5qyXx9KFtUNdYW4CfCDpCsqNMk                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 315156594                                                                             │
│  │ Digest: DWG5H6EtqrCRwrCCn4woVcSuvKTsabzbwQQXV32FjkNe                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 315156594                                                                             │
│  │ Digest: GoYBWwEuVTgfcKgkKn5qyXx9KFtUNdYW4CfCDpCsqNMk                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3815200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2362536 MIST                                                                   │
│    Non-refundable Storage Fee: 23864 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    GorLrz7Kk8JH55ANCxLaUNcWCeimTJm1qpBecuWRf85H                                                   │
│    GvbJ8ia1HfavuccAmi8EJJAaCGShtdv4NWrs1B13vvom                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xd9823fcb352a8b61ae290f8aba32ca5af406b85f32f01efd620a53596fbb3760                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN>  │
│  │ Version: 315156594                                                                                                         │
│  │ Digest: 8rhB1mDAUph9JwwLMr8kKsokwmmRXKsJ13ehHFco9igM                                                                       │
│  └──                                                                                                                          │
│ Mutated Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                 │
│  │ Version: 315156594                                                                                                         │
│  │ Digest: GoYBWwEuVTgfcKgkKn5qyXx9KFtUNdYW4CfCDpCsqNMk                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c                                               │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                 │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                              │
│  │ ObjectType: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::MySupply                      │
│  │ Version: 315156594                                                                                                         │
│  │ Digest: DWG5H6EtqrCRwrCCn4woVcSuvKTsabzbwQQXV32FjkNe                                                                       │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2202664                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )           │
│  │ CoinType: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN  │
│  │ Amount: 100                                                                                             │
│  └──                                                                                                       │

letsmove/mover/qiaopengjun5162/code/task4/NFTicketDraw on  main [⇣!?] via 🅒 base took 5.3s 
➜ 


````

### 调用 create 方法
```shell
letsmove/mover/qiaopengjun5162/code/task4/NFTicketDraw on  main [⇣!?] via 🅒 base 
➜ export PACKAGE_ID=0x496748d4d94c241583d915fb6e81f52601dc2c813af3d5e9584d5643d69f1afd                                                                  

letsmove/mover/qiaopengjun5162/code/task4/NFTicketDraw on  main [⇣!?] via 🅒 base 
➜ echo $PACKAGE_ID                                                                    
0x496748d4d94c241583d915fb6e81f52601dc2c813af3d5e9584d5643d69f1afd

letsmove/mover/qiaopengjun5162/code/task4/NFTicketDraw on  main [⇣!?] via 🅒 base 
➜ sui client call --function create --module nfticketdraw --package $PACKAGE_ID --args 1731133219000 10 --gas-budget 10000000 
[warn] Client/Server api version mismatch, client api version : 1.32.0, server api version : 1.36.2
Transaction Digest: 3ZymeB9CVZdkwQBuaP1NJtPZU5hT2tkmVRqUGJYJbPeG
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                  │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73               │
│ Gas Budget: 10000000 MIST                                                                   │
│ Gas Price: 750 MIST                                                                         │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                   │
│  │ Version: 315156594                                                                       │
│  │ Digest: GoYBWwEuVTgfcKgkKn5qyXx9KFtUNdYW4CfCDpCsqNMk                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│ ╭─────────────────────────────────────────────────╮                                         │
│ │ Input Objects                                   │                                         │
│ ├─────────────────────────────────────────────────┤                                         │
│ │ 0   Pure Arg: Type: u64, Value: "1731133219000" │                                         │
│ │ 1   Pure Arg: Type: u64, Value: "10"            │                                         │
│ ╰─────────────────────────────────────────────────╯                                         │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  create                                                             │        │
│ │  │ Module:    nfticketdraw                                                       │        │
│ │  │ Package:   0x496748d4d94c241583d915fb6e81f52601dc2c813af3d5e9584d5643d69f1afd │        │
│ │  │ Arguments:                                                                    │        │
│ │  │   Input  0                                                                    │        │
│ │  │   Input  1                                                                    │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    ZVSiXxelLzzMFN04k78EWpFytHO/7xIiux22skcH1+lc+sVSKOK34Mvb2SXhgkpGZai4SV/amek21gKwhg91Ag== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3ZymeB9CVZdkwQBuaP1NJtPZU5hT2tkmVRqUGJYJbPeG                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 576                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4cb5381be46a8246721a0a7f843b89a617056286d473881cce087e4b706d3ca9                         │
│  │ Owner: Shared( 315156595 )                                                                     │
│  │ Version: 315156595                                                                             │
│  │ Digest: 77KJVZk8kqfdPEshi2RwEKenD3PmpNHHXV9JUJbNwszr                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 315156595                                                                             │
│  │ Digest: AXJif6s2989Jo6EA2XuS1emhoNLh2cEuHhg5T2BZozAS                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 315156595                                                                             │
│  │ Digest: AXJif6s2989Jo6EA2XuS1emhoNLh2cEuHhg5T2BZozAS                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2523200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    F8V1rPcLYR7QijakrbkZkzPEMfJeanUaPAidLnUTj9C7                                                   │
│    GorLrz7Kk8JH55ANCxLaUNcWCeimTJm1qpBecuWRf85H                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                    │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                        │
│  │ EventID: 3ZymeB9CVZdkwQBuaP1NJtPZU5hT2tkmVRqUGJYJbPeG:0                                                  │
│  │ PackageID: 0x496748d4d94c241583d915fb6e81f52601dc2c813af3d5e9584d5643d69f1afd                            │
│  │ Transaction Module: nfticketdraw                                                                         │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                               │
│  │ EventType: 0x496748d4d94c241583d915fb6e81f52601dc2c813af3d5e9584d5643d69f1afd::nfticketdraw::GameCreated │
│  │ ParsedJSON:                                                                                              │
│  │   ┌──────────────┬────────────────────────────────────────────────────────────────────┐                  │
│  │   │ cost_in_coin │ 10                                                                 │                  │
│  │   ├──────────────┼────────────────────────────────────────────────────────────────────┤                  │
│  │   │ end_time     │ 1731133219000                                                      │                  │
│  │   ├──────────────┼────────────────────────────────────────────────────────────────────┤                  │
│  │   │ game_id      │ 0x4cb5381be46a8246721a0a7f843b89a617056286d473881cce087e4b706d3ca9 │                  │
│  │   └──────────────┴────────────────────────────────────────────────────────────────────┘                  │
│  └──                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                       │
│  ┌──                                                                                                   │
│  │ ObjectID: 0x4cb5381be46a8246721a0a7f843b89a617056286d473881cce087e4b706d3ca9                        │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                          │
│  │ Owner: Shared( 315156595 )                                                                          │
│  │ ObjectType: 0x496748d4d94c241583d915fb6e81f52601dc2c813af3d5e9584d5643d69f1afd::nfticketdraw::Game  │
│  │ Version: 315156595                                                                                  │
│  │ Digest: 77KJVZk8kqfdPEshi2RwEKenD3PmpNHHXV9JUJbNwszr                                                │
│  └──                                                                                                   │
│ Mutated Objects:                                                                                       │
│  ┌──                                                                                                   │
│  │ ObjectID: 0xb2a2ed6532874381998c171774c9411200033c3f7c4fa4899c28627ae2857f29                        │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                          │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                          │
│  │ Version: 315156595                                                                                  │
│  │ Digest: AXJif6s2989Jo6EA2XuS1emhoNLh2cEuHhg5T2BZozAS                                                │
│  └──                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2295080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

letsmove/mover/qiaopengjun5162/code/task4/NFTicketDraw on  main [⇣!?] via 🅒 base took 5.2s 
➜ 

```

## 参考
- 0x496748d4d94c241583d915fb6e81f52601dc2c813af3d5e9584d5643d69f1afd
- https://suiscan.xyz/mainnet/object/0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c/contracts
- https://suiscan.xyz/mainnet/object/0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c/txs
- https://suiscan.xyz/mainnet/object/0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a/contracts
- https://suiscan.xyz/mainnet/object/0x496748d4d94c241583d915fb6e81f52601dc2c813af3d5e9584d5643d69f1afd/txs
- https://suiscan.xyz/mainnet/tx/3ZymeB9CVZdkwQBuaP1NJtPZU5hT2tkmVRqUGJYJbPeG