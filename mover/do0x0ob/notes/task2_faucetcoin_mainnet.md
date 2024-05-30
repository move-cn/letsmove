## Faucet Coin DevNet Publish Info

**Publish Contract Command**
```bash
sui client publish --skip-dependency-verification
```

```bash
Transaction Digest: 3q8Rnzy3wSM27UwdUJHe3kq4GjeYMJVDJ2ktjHxRxTHZ
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                   │
│ Gas Owner: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                │
│ Gas Budget: 16434000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                                    │
│  │ Version: 88811179                                                                                         │
│  │ Digest: 2WwijpFdDbvR1qhef4r9KVtmPyK6pSrxETyfeWax26bq                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb" │ │
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
│    gwlsJ8eihG+zOutkFhC8I5MDw+3LGGb6kg51c5opkHBEdKohVGY9eyk7UbtsyZGxS0r5cp1Vm354w0mi5wovBw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3q8Rnzy3wSM27UwdUJHe3kq4GjeYMJVDJ2ktjHxRxTHZ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 393                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2acba1150928052f288dbba53b998d1d2d7f78fca8e6da66d3e836b32ca846e1                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 88811180                                                                              │
│  │ Digest: 7SX7ZuPsfPD1fsDCigjjcFyzqgAozt9yzTDELccTmja8                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x71519752f21f2da118bbd8267640890e4ecdb53ea3b9151bf26d2f362f4f90c2                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 88811180                                                                              │
│  │ Digest: 2PaLkhGxpR9cmQUx5LVD6WqmpaRsuzqqQikt8UVoxLSy                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc5e472c382db051e1d02d3b81d107036faafa3510c4a8162d4bcee602e391974                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 88811180                                                                              │
│  │ Digest: GEzpcykQo7gTcQTCcATKekCM9mm6ASEiFsYHNfT8W3nx                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xfe6612047e80501e2fed53d45ea4d49a7520b65dc833427352b1bb04de9b994d                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: H8dZvr2vwpMqz2LqdzZi2e48TompW3TnzHxHqqPM1zS1                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 88811180                                                                              │
│  │ Digest: Bo9geErmZzTCemZetejuC7kaQugGc5AKP55By2s5zGan                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 88811180                                                                              │
│  │ Digest: Bo9geErmZzTCemZetejuC7kaQugGc5AKP55By2s5zGan                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 14934000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    Bxi89YXm8hQCsSsyyG2jYxMzRgBHGKrz9vF6cz8BRDNA                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                      │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x2acba1150928052f288dbba53b998d1d2d7f78fca8e6da66d3e836b32ca846e1                                                       │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                                         │
│  │ Owner: Shared                                                                                                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xfe6612047e80501e2fed53d45ea4d49a7520b65dc833427352b1bb04de9b994d::faucet_coin::FAUCET_COIN>   │
│  │ Version: 88811180                                                                                                                  │
│  │ Digest: 7SX7ZuPsfPD1fsDCigjjcFyzqgAozt9yzTDELccTmja8                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x71519752f21f2da118bbd8267640890e4ecdb53ea3b9151bf26d2f362f4f90c2                                                       │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )                                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                               │
│  │ Version: 88811180                                                                                                                  │
│  │ Digest: 2PaLkhGxpR9cmQUx5LVD6WqmpaRsuzqqQikt8UVoxLSy                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xc5e472c382db051e1d02d3b81d107036faafa3510c4a8162d4bcee602e391974                                                       │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                                         │
│  │ Owner: Immutable                                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xfe6612047e80501e2fed53d45ea4d49a7520b65dc833427352b1bb04de9b994d::faucet_coin::FAUCET_COIN>  │
│  │ Version: 88811180                                                                                                                  │
│  │ Digest: GEzpcykQo7gTcQTCcATKekCM9mm6ASEiFsYHNfT8W3nx                                                                               │
│  └──                                                                                                                                  │
│ Mutated Objects:                                                                                                                      │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                                                       │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                         │
│  │ Version: 88811180                                                                                                                  │
│  │ Digest: Bo9geErmZzTCemZetejuC7kaQugGc5AKP55By2s5zGan                                                                               │
│  └──                                                                                                                                  │
│ Published Objects:                                                                                                                    │
│  ┌──                                                                                                                                  │
│  │ PackageID: 0xfe6612047e80501e2fed53d45ea4d49a7520b65dc833427352b1bb04de9b994d                                                      │
│  │ Version: 1                                                                                                                         │
│  │ Digest: H8dZvr2vwpMqz2LqdzZi2e48TompW3TnzHxHqqPM1zS1                                                                               │
│  │ Modules: faucet_coin                                                                                                               │
│  └──                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -14705880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## FaucetCoin mainnet MINT Info

**Mint CLI Command:** 
```bash
sui client call --package 0xfe6612047e80501e2fed53d45ea4d49a7520b65dc833427352b1bb04de9b994d --module faucet_coin --function mint --args 0x2acba1150928052f288dbba53b998d1d2d7f78fca8e6da66d3e836b32ca846e1 190000000000 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb --gas-budget 10000000
```

**Mint CLI Details**
```bash
Transaction Digest: 7pMCuYQQsASrGBBpwyRx5C8EP4HJs5ezALtaMPutSYYZ
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                   │
│ Gas Owner: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                                    │
│  │ Version: 88811180                                                                                         │
│  │ Digest: Bo9geErmZzTCemZetejuC7kaQugGc5AKP55By2s5zGan                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x2acba1150928052f288dbba53b998d1d2d7f78fca8e6da66d3e836b32ca846e1              │ │
│ │ 1   Pure Arg: Type: u64, Value: "190000000000"                                                           │ │
│ │ 2   Pure Arg: Type: address, Value: "0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    faucet_coin                                                        │                         │
│ │  │ Package:   0xfe6612047e80501e2fed53d45ea4d49a7520b65dc833427352b1bb04de9b994d │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    cA2egoHdeIjfHWGyh3+M7py/vHOvLRMn32SCrryLF3UvrYrvrDEuHsChMK0tDyIdgiFSzH4gnIP8g/TjAV3BDg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 7pMCuYQQsASrGBBpwyRx5C8EP4HJs5ezALtaMPutSYYZ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 393                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xd7e714a3c17c76ebf0d160d9d027fcb1771228d5047755b6da978c3f549b6480                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 88811181                                                                              │
│  │ Digest: HDYw4MMMaRjb8tuPSjd9qGhzikcFWywoknnn83uWwwdK                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2acba1150928052f288dbba53b998d1d2d7f78fca8e6da66d3e836b32ca846e1                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 88811181                                                                              │
│  │ Digest: 8aepGTidFVUaJVARPcjswzYoUgspPu4SzmRyt6e5MSSD                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 88811181                                                                              │
│  │ Digest: HhgyHqNhFWJbAinjbCSvZx7nAfZ5JGWCpGTxb9bAHRU6                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x2acba1150928052f288dbba53b998d1d2d7f78fca8e6da66d3e836b32ca846e1                         │
│  │ Version: 88811180                                                                              │
│  │ Digest: 7SX7ZuPsfPD1fsDCigjjcFyzqgAozt9yzTDELccTmja8                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                         │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )  │
│  │ Version: 88811181                                                                              │
│  │ Digest: HhgyHqNhFWJbAinjbCSvZx7nAfZ5JGWCpGTxb9bAHRU6                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4225600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2768832 MIST                                                                   │
│    Non-refundable Storage Fee: 27968 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3q8Rnzy3wSM27UwdUJHe3kq4GjeYMJVDJ2ktjHxRxTHZ                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0xd7e714a3c17c76ebf0d160d9d027fcb1771228d5047755b6da978c3f549b6480                                                      │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                                        │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )                                     │
│  │ ObjectType: 0x2::coin::Coin<0xfe6612047e80501e2fed53d45ea4d49a7520b65dc833427352b1bb04de9b994d::faucet_coin::FAUCET_COIN>         │
│  │ Version: 88811181                                                                                                                 │
│  │ Digest: HDYw4MMMaRjb8tuPSjd9qGhzikcFWywoknnn83uWwwdK                                                                              │
│  └──                                                                                                                                 │
│ Mutated Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x2acba1150928052f288dbba53b998d1d2d7f78fca8e6da66d3e836b32ca846e1                                                      │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                                        │
│  │ Owner: Shared                                                                                                                     │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xfe6612047e80501e2fed53d45ea4d49a7520b65dc833427352b1bb04de9b994d::faucet_coin::FAUCET_COIN>  │
│  │ Version: 88811181                                                                                                                 │
│  │ Digest: 8aepGTidFVUaJVARPcjswzYoUgspPu4SzmRyt6e5MSSD                                                                              │
│  └──                                                                                                                                 │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x3902804f8372ba9c60690b7a9b2373b8c6333f9768a6f8325a0822ddc0c6b0df                                                      │
│  │ Sender: 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb                                                        │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )                                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                        │
│  │ Version: 88811181                                                                                                                 │
│  │ Digest: HhgyHqNhFWJbAinjbCSvZx7nAfZ5JGWCpGTxb9bAHRU6                                                                              │
│  └──                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2206768                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x006d980cadd43c778e628201b45cfd3ba6e1047c65f67648a88f635108ffd6eb )           │
│  │ CoinType: 0xfe6612047e80501e2fed53d45ea4d49a7520b65dc833427352b1bb04de9b994d::faucet_coin::FAUCET_COIN  │
│  │ Amount: 190000000000                                                                                    │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```