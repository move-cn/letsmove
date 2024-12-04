# task5

## 发布合约

1. 命令

```
sui client publish 
```

2. 结果

```
Transaction Digest: FCmVfKVXHvompfxwUP4gneqZ9pDbJtMWmq8iixpYJVey
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                   │
│ Gas Owner: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                                    │
│  │ Version: 36675127                                                                                         │
│  │ Digest: 7WyQmzLkNQby9jgmyvejNditd6GWnNkHYcKA7phP357c                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  │   0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403 │                                  │
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
│    oguieeoILpoBwKQVhNx6mtxDjJ5brck9mNiTcjfOzqRLcIx8EZZCMx3U6XcjeXH9F8HtViYQUbhHKm5BHcDpBQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: FCmVfKVXHvompfxwUP4gneqZ9pDbJtMWmq8iixpYJVey                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 374                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3d55653d8fd98ae221bf676783466223cf344824c9238df0a0551ef11bb2f8e1                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: KwtH4VEvt9bnHN1D2fV4qHYFUeh4MYFGY1CQy3iiF5R                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc317229e87690adc36d10d9ecc5e87fbe9a3203b76a550b788b570f42101ec44                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 36675128                                                                              │
│  │ Digest: FKg4V3zWiYhytRopyt4tzpfSfgw1zW1qDMhTfXmF4DfJ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc800e472597b60023a5472b253b518cb7d9fdc3da14846f3af3c5faf73c9bc56                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 36675128                                                                              │
│  │ Digest: 43xxkS7JuJNa3DDR49buXFGE3XEiX9aY4NNUaGxqms72                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe095a2e6c068a4818dd1e8b5ab3a10dee65f2ca7bfff9a0b1f01134b718714da                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 36675128                                                                              │
│  │ Digest: 4QK1URV1koPS2kLqP3ZhHyMKixoXhfAJFhg91E18YKVM                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 36675128                                                                              │
│  │ Digest: 4V9FDwj2L6vzauCTT57UWjZTRWnNkwBibZ9e6ei8pijV                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 36675128                                                                              │
│  │ Digest: 4V9FDwj2L6vzauCTT57UWjZTRWnNkwBibZ9e6ei8pijV                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 16590800 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2GoayvqR9ryBGKUZu2a4Di3xsi7ichm36uWZ3DpFupcq                                                   │
│    6c3hAbXwoKqSv8Grf4wv7VAJYpT7UnPxV3zqeRjmN1JY                                                   │
│    739WxomUU7rkxfzoJFdd2huvD8jR1Td5quQ5X4gUmnY1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                          │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                        │
│  ┌──                                                                                                    │
│  │ ObjectID: 0xc317229e87690adc36d10d9ecc5e87fbe9a3203b76a550b788b570f42101ec44                         │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                           │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )        │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                 │
│  │ Version: 36675128                                                                                    │
│  │ Digest: FKg4V3zWiYhytRopyt4tzpfSfgw1zW1qDMhTfXmF4DfJ                                                 │
│  └──                                                                                                    │
│  ┌──                                                                                                    │
│  │ ObjectID: 0xc800e472597b60023a5472b253b518cb7d9fdc3da14846f3af3c5faf73c9bc56                         │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                           │
│  │ Owner: Shared                                                                                        │
│  │ ObjectType: 0x3d55653d8fd98ae221bf676783466223cf344824c9238df0a0551ef11bb2f8e1::coin_swap::Bank      │
│  │ Version: 36675128                                                                                    │
│  │ Digest: 43xxkS7JuJNa3DDR49buXFGE3XEiX9aY4NNUaGxqms72                                                 │
│  └──                                                                                                    │
│  ┌──                                                                                                    │
│  │ ObjectID: 0xe095a2e6c068a4818dd1e8b5ab3a10dee65f2ca7bfff9a0b1f01134b718714da                         │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                           │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )        │
│  │ ObjectType: 0x3d55653d8fd98ae221bf676783466223cf344824c9238df0a0551ef11bb2f8e1::coin_swap::AdminCap  │
│  │ Version: 36675128                                                                                    │
│  │ Digest: 4QK1URV1koPS2kLqP3ZhHyMKixoXhfAJFhg91E18YKVM                                                 │
│  └──                                                                                                    │
│ Mutated Objects:                                                                                        │
│  ┌──                                                                                                    │
│  │ ObjectID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                           │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )        │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                           │
│  │ Version: 36675128                                                                                    │
│  │ Digest: 4V9FDwj2L6vzauCTT57UWjZTRWnNkwBibZ9e6ei8pijV                                                 │
│  └──                                                                                                    │
│ Published Objects:                                                                                      │
│  ┌──                                                                                                    │
│  │ PackageID: 0x3d55653d8fd98ae221bf676783466223cf344824c9238df0a0551ef11bb2f8e1                        │
│  │ Version: 1                                                                                           │
│  │ Digest: KwtH4VEvt9bnHN1D2fV4qHYFUeh4MYFGY1CQy3iiF5R                                                  │
│  │ Modules: coin_swap                                                                                   │
│  └──                                                                                                    │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -16612680                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## 其余

1. 命令

```
## mint mycoin1
sui client call --function mint --module mycoin --package 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403 --args 0xd735520f429f73845c8193e724d7cb1c3631bc716b719d01dd783074ce0b8c0c 10000 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 
## mint faucetcoin1
sui client call --function mint --module faucetcoin --package 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403 --args  0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983 1000000 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 --gas-budget 10000000
## mint mycoin2 
sui client call --function mint --module mycoin --package 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403 --args 0xd735520f429f73845c8193e724d7cb1c3631bc716b719d01dd783074ce0b8c0c 1000 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4   
## mint faucetcoin2
sui client call --function mint --module faucetcoin --package 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403 --args  0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983 10000 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 --gas-budget 10000000
## deposit_mycoin
sui client call --package 0x3d55653d8fd98ae221bf676783466223cf344824c9238df0a0551ef11bb2f8e1  --module coin_swap --function deposit_mycoin --args 0xc800e472597b60023a5472b253b518cb7d9fdc3da14846f3af3c5faf73c9bc56  0x38a6a46daeddce408da06ab456be1650eb963e0f7ffc2dce8e38a80d4df75320  --gas-budget 10000000
## deposit_faucet
sui client call --package 0x3d55653d8fd98ae221bf676783466223cf344824c9238df0a0551ef11bb2f8e1  --module coin_swap --function deposit_faucet --args 0xc800e472597b60023a5472b253b518cb7d9fdc3da14846f3af3c5faf73c9bc56  0xc48208bfc2ebb2c6b5842f35ab610dbb1735dcf31895c293e52b3325f412b1aa  --gas-budget 10000000
## swap_mycoin_to_faucet
sui client call --package 0x3d55653d8fd98ae221bf676783466223cf344824c9238df0a0551ef11bb2f8e1  --module coin_swap --function swap_mycoin_to_faucet --args 0xc800e472597b60023a5472b253b518cb7d9fdc3da14846f3af3c5faf73c9bc56  0xe2d89aad7a5ecbc3134402084a96a28f126a4d8555cf060518a22bda9bf5631a  --gas-budget 10000000
## swap_faucet_to_mycoin
sui client call --package 0x3d55653d8fd98ae221bf676783466223cf344824c9238df0a0551ef11bb2f8e1  --module coin_swap --function mycoin --args 0xc800e472597b60023a5472b253b518cb7d9fdc3da14846f3af3c5faf73c9bc56  0xd8ee59b134a9da498359a5cdb9622499d361307136d19810cdf45c176cf3077e  --gas-budget 10000000
## 展示 bank
sui client object 0xc800e472597b60023a5472b253b518cb7d9fdc3da14846f3af3c5faf73c9bc56

╭───────────────┬─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ objectId      │  0xc800e472597b60023a5472b253b518cb7d9fdc3da14846f3af3c5faf73c9bc56                                                     │
│ version       │  36675136                                                                                                               │
│ digest        │  DEQ55XbCJ6tAmirNy96LKMKZzhSpSBjhHor9VcpDJ5b2                                                                           │
│ objType       │  0x3d55653d8fd98ae221bf676783466223cf344824c9238df0a0551ef11bb2f8e1::coin_swap::Bank                                    │
│ owner         │ ╭────────┬─────────────────────────────────────────╮                                                                    │
│               │ │ Shared │ ╭────────────────────────┬────────────╮ │                                                                    │
│               │ │        │ │ initial_shared_version │  36675128  │ │                                                                    │
│               │ │        │ ╰────────────────────────┴────────────╯ │                                                                    │
│               │ ╰────────┴─────────────────────────────────────────╯                                                                    │
│ prevTx        │  87nzS427qa1U689sJvtxqAfm2Xcno9QpmG5kBw2rNA4W                                                                           │
│ storageRebate │  1413600                                                                                                                │
│ content       │ ╭───────────────────┬─────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│               │ │ dataType          │  moveObject                                                                                     │ │
│               │ │ type              │  0x3d55653d8fd98ae221bf676783466223cf344824c9238df0a0551ef11bb2f8e1::coin_swap::Bank            │ │
│               │ │ hasPublicTransfer │  true                                                                                           │ │
│               │ │ fields            │ ╭─────────────┬───────────────────────────────────────────────────────────────────────────────╮ │ │
│               │ │                   │ │ faucet_coin │  1000000                                                                      │ │ │
│               │ │                   │ │ id          │ ╭────┬──────────────────────────────────────────────────────────────────────╮ │ │ │
│               │ │                   │ │             │ │ id │  0xc800e472597b60023a5472b253b518cb7d9fdc3da14846f3af3c5faf73c9bc56  │ │ │ │
│               │ │                   │ │             │ ╰────┴──────────────────────────────────────────────────────────────────────╯ │ │ │
│               │ │                   │ │ my_coin     │  11000                                                                        │ │ │
│               │ │                   │ ╰─────────────┴───────────────────────────────────────────────────────────────────────────────╯ │ │
│               │ ╰───────────────────┴─────────────────────────────────────────────────────────────────────────────────────────────────╯ │
╰───────────────┴─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

