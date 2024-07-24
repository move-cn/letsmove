### Task2

```bash
> sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
```

```bash
sui client publish --gas-budget 50000000 --skip-dependency-verification

[warn] Client/Server api version mismatch, client api version : 1.28.0, server api version : 1.29.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
Skipping dependency verification
Transaction Digest: E5n3wX9WdZ4NZSRddxKRMHpqigzCdWaRy1aYK4cnQPme
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
│  │ Version: 76                                                                                               │
│  │ Digest: 7TWKrgtVnfHSrSjke6gFiPxcZ1vY4SYv9GZVGAmuXUio                                                      │
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
│    +BUWE5OF28fg6fPfkfv8kHx7ACnf0p2TTW6hGkEIRp+HuWllQHF+bD49wlZq3XJhNsDZzyUf3x2zyPhHOaULDg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: E5n3wX9WdZ4NZSRddxKRMHpqigzCdWaRy1aYK4cnQPme                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 128                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x17e9fe74c17ac73dbc99d4a169f5347e191571db4a279d2306a236e7cb15d17a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 77                                                                                    │
│  │ Digest: 9sSCt2EZELMN2GJcdTfiGmRYCK87LPgnz9XwnjSN2dVj                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x61b135d6dce003c37c37462cc8f5a56d989a86d8a946e11c41f22bd7cf2fc642                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 77                                                                                    │
│  │ Digest: tKEGLnsDRRZWXJ6CGDXPMBstLyzUmTBgympN6RzLPMQ                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x94d6b0fa1f374b564043ef5d30b30ab6cf2e3da166676e97721c2bf255d9dc4b                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 77                                                                                    │
│  │ Digest: 9JfWADpC2sgxWAnU1vkqKgo6Bd99VvLCs47BnvfANoC2                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: HV12feP16Eep4Cp9x3dueqKW1zYKHZuotFCcQvjkNcLh                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb04196f7bbfcd6f0ea992407181c22f35a878cf9a18593e499e0155483db8ca9                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 77                                                                                    │
│  │ Digest: 7vJPULER7HC9KwaFnrrTLYsXjiouFmds8yxmpDZJTzLa                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf1c2d4658ab2c0ffcb9665a69a03dddca13f4919060b4f72e1265f6b2ef6ccd8                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 77                                                                                    │
│  │ Digest: GdDNvpRFoRLejm2NnxLR79poQHJTah1m2waUf8wwbRpQ                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 77                                                                                    │
│  │ Digest: 4GbsdMf3QzspXxrrtAWw8hc2K8pEpp1vze9LXG25okPD                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 77                                                                                    │
│  │ Digest: 4GbsdMf3QzspXxrrtAWw8hc2K8pEpp1vze9LXG25okPD                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 23598000 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2n4WJq1SRb9odCLqXzCQB6VAvvUocdCcTZpP7j8Lb9TR                                                   │
│    E4KEoBaW3osvyMtt8H11XTND1pPmX32e4d4RPgfZU3p7                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                      │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x17e9fe74c17ac73dbc99d4a169f5347e191571db4a279d2306a236e7cb15d17a                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                         │
│  │ Owner: Immutable                                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267::mycoin::MYCOIN>            │
│  │ Version: 77                                                                                                                        │
│  │ Digest: 9sSCt2EZELMN2GJcdTfiGmRYCK87LPgnz9XwnjSN2dVj                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x61b135d6dce003c37c37462cc8f5a56d989a86d8a946e11c41f22bd7cf2fc642                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267::mycoin::MYCOIN>             │
│  │ Version: 77                                                                                                                        │
│  │ Digest: tKEGLnsDRRZWXJ6CGDXPMBstLyzUmTBgympN6RzLPMQ                                                                                │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x94d6b0fa1f374b564043ef5d30b30ab6cf2e3da166676e97721c2bf255d9dc4b                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                         │
│  │ Owner: Immutable                                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267::faucet_coin::FAUCET_COIN>  │
│  │ Version: 77                                                                                                                        │
│  │ Digest: 9JfWADpC2sgxWAnU1vkqKgo6Bd99VvLCs47BnvfANoC2                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xb04196f7bbfcd6f0ea992407181c22f35a878cf9a18593e499e0155483db8ca9                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                               │
│  │ Version: 77                                                                                                                        │
│  │ Digest: 7vJPULER7HC9KwaFnrrTLYsXjiouFmds8yxmpDZJTzLa                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xf1c2d4658ab2c0ffcb9665a69a03dddca13f4919060b4f72e1265f6b2ef6ccd8                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267::faucet_coin::FAUCET_COIN>   │
│  │ Version: 77                                                                                                                        │
│  │ Digest: GdDNvpRFoRLejm2NnxLR79poQHJTah1m2waUf8wwbRpQ                                                                               │
│  └──                                                                                                                                  │
│ Mutated Objects:                                                                                                                      │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                         │
│  │ Version: 77                                                                                                                        │
│  │ Digest: 4GbsdMf3QzspXxrrtAWw8hc2K8pEpp1vze9LXG25okPD                                                                               │
│  └──                                                                                                                                  │
│ Published Objects:                                                                                                                    │
│  ┌──                                                                                                                                  │
│  │ PackageID: 0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267                                                      │
│  │ Version: 1                                                                                                                         │
│  │ Digest: HV12feP16Eep4Cp9x3dueqKW1zYKHZuotFCcQvjkNcLh                                                                               │
│  │ Modules: faucet_coin, mycoin                                                                                                       │
│  └──                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -23619880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


## Mint 地址1

```bash
sui client call --function mint --module faucet_coin --package 0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267 --gas-budget 5000000 --args 0xf1c2d4658ab2c0ffcb9665a69a03dddca13f4919060b4f72e1265f6b2ef6ccd8 100 0xb2886490b40668a555515fa7faa9de0b590464a0868ef2876202b494ac9ccdb9 

[warn] Client/Server api version mismatch, client api version : 1.28.0, server api version : 1.29.0
Transaction Digest: H8tab1Wx7SazaPxQSzS4WCfDP58R2oWMqSPWwDnBYHWV
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                   │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                │
│ Gas Budget: 5000000 MIST                                                                                     │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                                    │
│  │ Version: 77                                                                                               │
│  │ Digest: 4GbsdMf3QzspXxrrtAWw8hc2K8pEpp1vze9LXG25okPD                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xf1c2d4658ab2c0ffcb9665a69a03dddca13f4919060b4f72e1265f6b2ef6ccd8              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100"                                                                    │ │
│ │ 2   Pure Arg: Type: address, Value: "0xb2886490b40668a555515fa7faa9de0b590464a0868ef2876202b494ac9ccdb9" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    faucet_coin                                                        │                         │
│ │  │ Package:   0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    cYjkbZD2bYWboMHr1ORFj/pRLqNj321W410X1maj7WxAcr1et1dmlLQ8a2MDpXH5MR2ApVWCp95xNS4j3yUkBA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: H8tab1Wx7SazaPxQSzS4WCfDP58R2oWMqSPWwDnBYHWV                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 129                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x50abbc8346c5d5ac77bb3364f11567b60d1a82cb2bfc812de04aa2b60516c4da                         │
│  │ Owner: Account Address ( 0xb2886490b40668a555515fa7faa9de0b590464a0868ef2876202b494ac9ccdb9 )  │
│  │ Version: 78                                                                                    │
│  │ Digest: B73WhmYhJYYfKRD8cERvEvsAr3p6pBmoTcJEj4bfPYAp                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 78                                                                                    │
│  │ Digest: 2ScUfWEAMYAumaUQFdhymWoPyW12FrsKApFojGxuiSP5                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf1c2d4658ab2c0ffcb9665a69a03dddca13f4919060b4f72e1265f6b2ef6ccd8                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 78                                                                                    │
│  │ Digest: 5DkTk7AYWJVqUjK87hZHTovbWXHxhUt3ozmZcpF1gF5z                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 78                                                                                    │
│  │ Digest: 2ScUfWEAMYAumaUQFdhymWoPyW12FrsKApFojGxuiSP5                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4225600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2768832 MIST                                                                   │
│    Non-refundable Storage Fee: 27968 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    E5n3wX9WdZ4NZSRddxKRMHpqigzCdWaRy1aYK4cnQPme                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x50abbc8346c5d5ac77bb3364f11567b60d1a82cb2bfc812de04aa2b60516c4da                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                        │
│  │ Owner: Account Address ( 0xb2886490b40668a555515fa7faa9de0b590464a0868ef2876202b494ac9ccdb9 )                                     │
│  │ ObjectType: 0x2::coin::Coin<0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267::faucet_coin::FAUCET_COIN>         │
│  │ Version: 78                                                                                                                       │
│  │ Digest: B73WhmYhJYYfKRD8cERvEvsAr3p6pBmoTcJEj4bfPYAp                                                                              │
│  └──                                                                                                                                 │
│ Mutated Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                        │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                        │
│  │ Version: 78                                                                                                                       │
│  │ Digest: 2ScUfWEAMYAumaUQFdhymWoPyW12FrsKApFojGxuiSP5                                                                              │
│  └──                                                                                                                                 │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0xf1c2d4658ab2c0ffcb9665a69a03dddca13f4919060b4f72e1265f6b2ef6ccd8                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                        │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                     │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267::faucet_coin::FAUCET_COIN>  │
│  │ Version: 78                                                                                                                       │
│  │ Digest: 5DkTk7AYWJVqUjK87hZHTovbWXHxhUt3ozmZcpF1gF5z                                                                              │
│  └──                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0xb2886490b40668a555515fa7faa9de0b590464a0868ef2876202b494ac9ccdb9 )           │
│  │ CoinType: 0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267::faucet_coin::FAUCET_COIN  │
│  │ Amount: 100                                                                                             │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2456768                                                                                        │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```


## Mint 地址2

```bash
sui client call --function mint --module faucet_coin --package 0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267 --gas-budget 5000000 --args 0xf1c2d4658ab2c0ffcb9665a69a03dddca13f4919060b4f72e1265f6b2ef6ccd8 1000000000000000000 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc 

[warn] Client/Server api version mismatch, client api version : 1.28.0, server api version : 1.29.0
Transaction Digest: BQPAyxHXXkxv61AF1KZxoV1dYb4JSbfFVfPyFHuVqHrR
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                   │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                │
│ Gas Budget: 5000000 MIST                                                                                     │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                                    │
│  │ Version: 87                                                                                               │
│  │ Digest: GEWbwekzTuiqZvYcUAa3xpXxVSUAy2KnqgBPNM5i3DgD                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xf1c2d4658ab2c0ffcb9665a69a03dddca13f4919060b4f72e1265f6b2ef6ccd8              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000000000000000000"                                                    │ │
│ │ 2   Pure Arg: Type: address, Value: "0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    faucet_coin                                                        │                         │
│ │  │ Package:   0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    PAzEC9gBp6Cc8cEAw+5ap0+x2z9/A5D+hK/O7MLnQ9FhcDHl+28G4yCBokXjqoGmAzNoPioEBSfCwTox4jhPBQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BQPAyxHXXkxv61AF1KZxoV1dYb4JSbfFVfPyFHuVqHrR                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 129                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x8815b057b7483ef5d1191954e9672c88ca1356493424c3fb179cc10c76989396                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 88                                                                                    │
│  │ Digest: GFSeV1igxe3iJ9wWQBV1XCgTMgDSpM89L1GKcvtC7YB1                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 88                                                                                    │
│  │ Digest: Hrwoy5R28GNQteiKfDKZAx19k6RW5PaH2X4KCPBsRyV9                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf1c2d4658ab2c0ffcb9665a69a03dddca13f4919060b4f72e1265f6b2ef6ccd8                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 88                                                                                    │
│  │ Digest: 4JnAggpfiwg2QBxMfuA9gbKA9cZ3gtf6nPzaKcyAjBni                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 88                                                                                    │
│  │ Digest: Hrwoy5R28GNQteiKfDKZAx19k6RW5PaH2X4KCPBsRyV9                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4225600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2768832 MIST                                                                   │
│    Non-refundable Storage Fee: 27968 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    45w1YqnmYC7meR6iya4ehQKEH8k6bYouGFzKZ5Fn34WD                                                   │
│    9tDrR8w31XdCAAeJPg5eKPM3B87oeRE9GoJgCQkS44UL                                                   │
│    E5n3wX9WdZ4NZSRddxKRMHpqigzCdWaRy1aYK4cnQPme                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x8815b057b7483ef5d1191954e9672c88ca1356493424c3fb179cc10c76989396                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                        │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                     │
│  │ ObjectType: 0x2::coin::Coin<0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267::faucet_coin::FAUCET_COIN>         │
│  │ Version: 88                                                                                                                       │
│  │ Digest: GFSeV1igxe3iJ9wWQBV1XCgTMgDSpM89L1GKcvtC7YB1                                                                              │
│  └──                                                                                                                                 │
│ Mutated Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                        │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                        │
│  │ Version: 88                                                                                                                       │
│  │ Digest: Hrwoy5R28GNQteiKfDKZAx19k6RW5PaH2X4KCPBsRyV9                                                                              │
│  └──                                                                                                                                 │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0xf1c2d4658ab2c0ffcb9665a69a03dddca13f4919060b4f72e1265f6b2ef6ccd8                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                        │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                     │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267::faucet_coin::FAUCET_COIN>  │
│  │ Version: 88                                                                                                                       │
│  │ Digest: 4JnAggpfiwg2QBxMfuA9gbKA9cZ3gtf6nPzaKcyAjBni                                                                              │
│  └──                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2456768                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )           │
│  │ CoinType: 0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267::faucet_coin::FAUCET_COIN  │
│  │ Amount: 1000000000000000000                                                                             │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## MyCoin Mint

```bash
sui client call --function mint --module mycoin --package 0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267 --gas-budget 5000000 --args 0x61b135d6dce003c37c37462cc8f5a56d989a86d8a946e11c41f22bd7cf2fc642 1000000000000000000 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc

[warn] Client/Server api version mismatch, client api version : 1.28.0, server api version : 1.29.0
Transaction Digest: 6Mx8AqRrdsA1SVJb8WvioJ8Q3abFZ8MMmzwyc7WJL33e
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                   │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                │
│ Gas Budget: 5000000 MIST                                                                                     │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                                    │
│  │ Version: 82                                                                                               │
│  │ Digest: EqFfo7JqNvzSyhVDUAsNYAWYGXHSyFm65D9RTXEtyHAj                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x61b135d6dce003c37c37462cc8f5a56d989a86d8a946e11c41f22bd7cf2fc642              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000000000000000000"                                                    │ │
│ │ 2   Pure Arg: Type: address, Value: "0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mycoin                                                             │                         │
│ │  │ Package:   0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    HxQde4HktIJzx7NbfqLBXk1PIN29QC1Eb1WGtT25/2XcgMZN0KKua5KqqBUKQchtvlNTwuDhzxRoB9QzrR0GBw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6Mx8AqRrdsA1SVJb8WvioJ8Q3abFZ8MMmzwyc7WJL33e                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 129                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x24719f42df43f1534941f696c7a0b1f5e1a39b54fecedab3ba3d5509a1cdc49e                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 83                                                                                    │
│  │ Digest: 9hj2CAzJfMoh9NRDDHwPeNu2PJA7EBeAhwbmAxjxmLCD                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 83                                                                                    │
│  │ Digest: 5T3dXmKafRPxV5w6Rw5z6wpZQBy8ZfrVb4QWYfqtkYaR                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x61b135d6dce003c37c37462cc8f5a56d989a86d8a946e11c41f22bd7cf2fc642                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 83                                                                                    │
│  │ Digest: AkHBT78bi58MEAyRYwfE92aFRw656nxRfAdPEYTBAjf7                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 83                                                                                    │
│  │ Digest: 5T3dXmKafRPxV5w6Rw5z6wpZQBy8ZfrVb4QWYfqtkYaR                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    E5n3wX9WdZ4NZSRddxKRMHpqigzCdWaRy1aYK4cnQPme                                                   │
│    J4D23H86kWrRf46fZN9yDgpDZPvbAKnGcE59DcXnbgBB                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x24719f42df43f1534941f696c7a0b1f5e1a39b54fecedab3ba3d5509a1cdc49e                                            │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                           │
│  │ ObjectType: 0x2::coin::Coin<0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267::mycoin::MYCOIN>         │
│  │ Version: 83                                                                                                             │
│  │ Digest: 9hj2CAzJfMoh9NRDDHwPeNu2PJA7EBeAhwbmAxjxmLCD                                                                    │
│  └──                                                                                                                       │
│ Mutated Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x60a9c68568b8cb395b5a5c0308ab6599f1fa12f121e8c40f6bf04b5a828a9967                                            │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                              │
│  │ Version: 83                                                                                                             │
│  │ Digest: 5T3dXmKafRPxV5w6Rw5z6wpZQBy8ZfrVb4QWYfqtkYaR                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x61b135d6dce003c37c37462cc8f5a56d989a86d8a946e11c41f22bd7cf2fc642                                            │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                           │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267::mycoin::MYCOIN>  │
│  │ Version: 83                                                                                                             │
│  │ Digest: AkHBT78bi58MEAyRYwfE92aFRw656nxRfAdPEYTBAjf7                                                                    │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2380008                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0xad41c4fd85b1b8122a32be738ec0c1adff0ef65493a50f0047f6f33ce39a8267::mycoin::MYCOIN   │
│  │ Amount: 1000000000000000000                                                                    │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```