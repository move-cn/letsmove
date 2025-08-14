# task4

## 发布合约

1. 命令

```
sui client publish 
```

2. 返回

```
Transaction Digest: 24ff9gBTGtEA1YvbHwXJNQv77jimQRUjTWEe2xNyHJTe
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
│  │ Version: 1192540                                                                                          │
│  │ Digest: 2Jmk9NUQdt3F9G1chtBu8AmzqEjcShZBfRL6bGVFF1QD                                                      │
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
│    2UJOg10UdEGBrc+GBihzgw6nisN6rb6L1YoPHCanN88q9lm7z/4cq55AftnfYiplrzbUO3nNFa+Ulw9CsIPeAg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 24ff9gBTGtEA1YvbHwXJNQv77jimQRUjTWEe2xNyHJTe                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 373                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x35ec5816851249fcac5b883fb0db437b583bb864a9451699ac36989ddc5212e4                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192541                                                                               │
│  │ Digest: 7HwHVDqTiX6YRQtKVM8wGHxDisifFUxfitZUGbuFUXKT                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 1192541                                                                               │
│  │ Digest: F6XGFtXFsc6XkETjzpU1BrvXK7tVU2akW35yDwg21ZhD                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc6bff566651aaf2c9b427502ae7d695570b65bcc2de245a664de0d8a2988195b                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192541                                                                               │
│  │ Digest: HLgDHYzqVHUsmGsPoRuDod9489TgR1p1qzg3KrHtbNkw                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Hq3DP16oq5Er3u8CFkp9S1Dqq9ayQED1riHDTvYEwoeX                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192541                                                                               │
│  │ Digest: AxhHiMWrcswotd2AaYwM8cDxspHoUTU57mFBqoem5vxW                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192541                                                                               │
│  │ Digest: AxhHiMWrcswotd2AaYwM8cDxspHoUTU57mFBqoem5vxW                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 22123600 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2KX9GXoi3ft1n5KHNbgTsiv8Dyq8joszduKhDAC7wLob                                                   │
│    6c3hAbXwoKqSv8Grf4wv7VAJYpT7UnPxV3zqeRjmN1JY                                                   │
│    739WxomUU7rkxfzoJFdd2huvD8jR1Td5quQ5X4gUmnY1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                            │
│  ┌──                                                                                                        │
│  │ ObjectID: 0x35ec5816851249fcac5b883fb0db437b583bb864a9451699ac36989ddc5212e4                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                               │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )            │
│  │ ObjectType: 0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad::mygame::OwnerCapability  │
│  │ Version: 1192541                                                                                         │
│  │ Digest: 7HwHVDqTiX6YRQtKVM8wGHxDisifFUxfitZUGbuFUXKT                                                     │
│  └──                                                                                                        │
│  ┌──                                                                                                        │
│  │ ObjectID: 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                               │
│  │ Owner: Shared                                                                                            │
│  │ ObjectType: 0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad::mygame::MyGame           │
│  │ Version: 1192541                                                                                         │
│  │ Digest: F6XGFtXFsc6XkETjzpU1BrvXK7tVU2akW35yDwg21ZhD                                                     │
│  └──                                                                                                        │
│  ┌──                                                                                                        │
│  │ ObjectID: 0xc6bff566651aaf2c9b427502ae7d695570b65bcc2de245a664de0d8a2988195b                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                               │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )            │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                     │
│  │ Version: 1192541                                                                                         │
│  │ Digest: HLgDHYzqVHUsmGsPoRuDod9489TgR1p1qzg3KrHtbNkw                                                     │
│  └──                                                                                                        │
│ Mutated Objects:                                                                                            │
│  ┌──                                                                                                        │
│  │ ObjectID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                               │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                               │
│  │ Version: 1192541                                                                                         │
│  │ Digest: AxhHiMWrcswotd2AaYwM8cDxspHoUTU57mFBqoem5vxW                                                     │
│  └──                                                                                                        │
│ Published Objects:                                                                                          │
│  ┌──                                                                                                        │
│  │ PackageID: 0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad                            │
│  │ Version: 1                                                                                               │
│  │ Digest: Hq3DP16oq5Er3u8CFkp9S1Dqq9ayQED1riHDTvYEwoeX                                                     │
│  │ Modules: mygame                                                                                          │
│  └──                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -22145480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## `get_fault_coin`

1. 命令

```
sui client call --package 0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad --module mygame --function get_default_coins --args 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983 10000000 --gas-budget 10000000
```

2. 结果
   
```
Transaction Digest: 8LrvgL4x6jYK6XG859owRxNC1y1517WSmbjAocag8YS2
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                      │
│ Gas Owner: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                       │
│  │ Version: 1192541                                                                             │
│  │ Digest: AxhHiMWrcswotd2AaYwM8cDxspHoUTU57mFBqoem5vxW                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983 │ │
│ │ 1   Pure Arg: Type: u64, Value: "10000000"                                                  │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  get_default_coins                                                  │            │
│ │  │ Module:    mygame                                                             │            │
│ │  │ Package:   0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    8owxAATxw+F+L9mgIiKC6gTm/rGlx+uZhf63LoXA3Rp/BP/TQLa8ysxKtvHK/4CTP09RQ+ZKX8kyWk48locJDw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8LrvgL4x6jYK6XG859owRxNC1y1517WSmbjAocag8YS2                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 373                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x9e8dafc4074433088c921899d12266e9db170f3778f3f57d999b1f48c0e3584f                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192542                                                                               │
│  │ Digest: ABnRnQAo8Z843YMaER6PCjRT26syZUGk8gTmnjrqmpgi                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192542                                                                               │
│  │ Digest: 3ELrRgCPZDszb8sVF3UUDxiQhQiCS4smE7LRspvPMm2W                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 1192542                                                                               │
│  │ Digest: BcyeeB5kxsfSDsHqF719UFMcW9EmvyQfxEfuMUgim6UZ                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983                         │
│  │ Version: 1192536                                                                               │
│  │ Digest: yeXJR35XahLmLtECne64grhj9J13m8jnBmuJPJXQqrN                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192542                                                                               │
│  │ Digest: 3ELrRgCPZDszb8sVF3UUDxiQhQiCS4smE7LRspvPMm2W                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4195200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2753784 MIST                                                                   │
│    Non-refundable Storage Fee: 27816 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    24ff9gBTGtEA1YvbHwXJNQv77jimQRUjTWEe2xNyHJTe                                                   │
│    62j3ufKp5WdezkYT7o7nWGzd7DxemrsUAvsCoumfN7q2                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                     │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                   │
│  ┌──                                                                                                                               │
│  │ ObjectID: 0x9e8dafc4074433088c921899d12266e9db170f3778f3f57d999b1f48c0e3584f                                                    │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                                      │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )                                   │
│  │ ObjectType: 0x2::coin::Coin<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN>         │
│  │ Version: 1192542                                                                                                                │
│  │ Digest: ABnRnQAo8Z843YMaER6PCjRT26syZUGk8gTmnjrqmpgi                                                                            │
│  └──                                                                                                                               │
│ Mutated Objects:                                                                                                                   │
│  ┌──                                                                                                                               │
│  │ ObjectID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                                                    │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                                      │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )                                   │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                      │
│  │ Version: 1192542                                                                                                                │
│  │ Digest: 3ELrRgCPZDszb8sVF3UUDxiQhQiCS4smE7LRspvPMm2W                                                                            │
│  └──                                                                                                                               │
│  ┌──                                                                                                                               │
│  │ ObjectID: 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983                                                    │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                                      │
│  │ Owner: Shared                                                                                                                   │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN>  │
│  │ Version: 1192542                                                                                                                │
│  │ Digest: BcyeeB5kxsfSDsHqF719UFMcW9EmvyQfxEfuMUgim6UZ                                                                            │
│  └──                                                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )         │
│  │ CoinType: 0x2::sui::SUI                                                                               │
│  │ Amount: -2441416                                                                                      │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )         │
│  │ CoinType: 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN  │
│  │ Amount: 10000000                                                                                      │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## `deposit`

1. 命令
   
```
sui client call --package 0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad --module my_game --function deposit --args 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8  0x9e8dafc4074433088c921899d12266e9db170f3778f3f57d999b1f48c0e3584f  5000000 --gas-budget 10000000
```

2. 结果

```
Transaction Digest: EcKoA2jMQ36oYBgDhfKDz9g9ZSUhC3BMwShy5T6SsHzL
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                      │
│ Gas Owner: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                       │
│  │ Version: 1192542                                                                             │
│  │ Digest: 3ELrRgCPZDszb8sVF3UUDxiQhQiCS4smE7LRspvPMm2W                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8 │ │
│ │ 1   Imm/Owned Object ID: 0x9e8dafc4074433088c921899d12266e9db170f3778f3f57d999b1f48c0e3584f │ │
│ │ 2   Pure Arg: Type: u64, Value: "5000000"                                                   │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  deposit                                                            │            │
│ │  │ Module:    mygame                                                             │            │
│ │  │ Package:   0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    gdgYqcyCyE+DcxBtvjB5TJmlzQIYo4beuTGNsHg5BN71KKRKKetPMHybIkxFHhPi4u7502LWjUaLzwUCPhLeCQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EcKoA2jMQ36oYBgDhfKDz9g9ZSUhC3BMwShy5T6SsHzL                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 373                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbf4f4865faec53790675e0e894fee6a8a37bd68f8135bdee8894cae03c6a45e0                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192543                                                                               │
│  │ Digest: 9jy2d5FeWFnKs6zVtDRADeFS2JFquHu3Dy3fgoPqGV5                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 1192543                                                                               │
│  │ Digest: DXd6DXxsThhxoQfApGYu8uBeRFsk7MkLt1SmcxqJDqhz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192543                                                                               │
│  │ Digest: FTRA5GeQCoKT6ARHSD88uXSTqdyoNJud3NVwV9mY6Ycq                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8                         │
│  │ Version: 1192541                                                                               │
│  │ Digest: F6XGFtXFsc6XkETjzpU1BrvXK7tVU2akW35yDwg21ZhD                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x9e8dafc4074433088c921899d12266e9db170f3778f3f57d999b1f48c0e3584f                         │
│  │ Version: 1192543                                                                               │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192543                                                                               │
│  │ Digest: FTRA5GeQCoKT6ARHSD88uXSTqdyoNJud3NVwV9mY6Ycq                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3868400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 3829716 MIST                                                                   │
│    Non-refundable Storage Fee: 38684 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    24ff9gBTGtEA1YvbHwXJNQv77jimQRUjTWEe2xNyHJTe                                                   │
│    8LrvgL4x6jYK6XG859owRxNC1y1517WSmbjAocag8YS2                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xbf4f4865faec53790675e0e894fee6a8a37bd68f8135bdee8894cae03c6a45e0                                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                               │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN>  │
│  │ Version: 1192543                                                                                                         │
│  │ Digest: 9jy2d5FeWFnKs6zVtDRADeFS2JFquHu3Dy3fgoPqGV5                                                                      │
│  └──                                                                                                                        │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8                                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                               │
│  │ Owner: Shared                                                                                                            │
│  │ ObjectType: 0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad::mygame::MyGame                           │
│  │ Version: 1192543                                                                                                         │
│  │ Digest: DXd6DXxsThhxoQfApGYu8uBeRFsk7MkLt1SmcxqJDqhz                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                               │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 1192543                                                                                                         │
│  │ Digest: FTRA5GeQCoKT6ARHSD88uXSTqdyoNJud3NVwV9mY6Ycq                                                                     │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )         │
│  │ CoinType: 0x2::sui::SUI                                                                               │
│  │ Amount: -1038684                                                                                      │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )         │
│  │ CoinType: 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN  │
│  │ Amount: -5000000                                                                                      │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## play

1. 命令

```
sui client call --package 0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad --module mygame --function play --args 1 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8  0xbf4f4865faec53790675e0e894fee6a8a37bd68f8135bdee8894cae03c6a45e0 0x6 
```

2. 结果

```
Transaction Digest: 8gfBm7R6zEhQUt1YkT1CczbTunR1c6cMqiSMkk1T26Vz
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                      │
│ Gas Owner: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                   │
│ Gas Budget: 100000000 MIST                                                                      │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                       │
│  │ Version: 1192543                                                                             │
│  │ Digest: FTRA5GeQCoKT6ARHSD88uXSTqdyoNJud3NVwV9mY6Ycq                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: u64, Value: "1"                                                         │ │
│ │ 1   Shared Object    ID: 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8 │ │
│ │ 2   Imm/Owned Object ID: 0xbf4f4865faec53790675e0e894fee6a8a37bd68f8135bdee8894cae03c6a45e0 │ │
│ │ 3   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  play                                                               │            │
│ │  │ Module:    mygame                                                             │            │
│ │  │ Package:   0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  │   Input  3                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    5TdyN1G60ResgA7LjEet4kK87TjKyysJuq5JIKNR2Un9TIKoelbeInUsfwpYB/39VqtlfazEviJGEYLdKyMxBA==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8gfBm7R6zEhQUt1YkT1CczbTunR1c6cMqiSMkk1T26Vz                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 373                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7ee2f592d9cef06d8d3f80cbc98009dfc63f0fca62e04512331f1e15ed96622a                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 36675123                                                                              │
│  │ Digest: 4i2mK3mhsWTujTd17FwmM5P4d2bccmYiVLcvNyATkQzn                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x837d18d103cb989feb0e175b8a53d0487c03c007c567a6c1b777d91d6138ecb8                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 36675123                                                                              │
│  │ Digest: HVG9R6LjJ77RexyBkFrgizdMdB7dBq3ECEef8rdERYGu                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 36675123                                                                              │
│  │ Digest: 5dZcCR4JbgNiuZVCnLBaM9swP85GR1TdnPg56CfiB5sN                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 36675123                                                                              │
│  │ Digest: HJfwovLQYQm3mNZBJiu2g2FuHTex7aPjUNKGLoP2XHVE                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8                         │
│  │ Version: 1192543                                                                               │
│  │ Digest: DXd6DXxsThhxoQfApGYu8uBeRFsk7MkLt1SmcxqJDqhz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 36675122                                                                              │
│  │ Digest: FMvCaxJu6QxuVAfXeBtSLNrFFoWrJmoZwztzE2uuTk2y                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbf4f4865faec53790675e0e894fee6a8a37bd68f8135bdee8894cae03c6a45e0                         │
│  │ Version: 36675123                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 36675123                                                                              │
│  │ Digest: HJfwovLQYQm3mNZBJiu2g2FuHTex7aPjUNKGLoP2XHVE                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 5282000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 3829716 MIST                                                                   │
│    Non-refundable Storage Fee: 38684 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    24ff9gBTGtEA1YvbHwXJNQv77jimQRUjTWEe2xNyHJTe                                                   │
│    EcKoA2jMQ36oYBgDhfKDz9g9ZSUhC3BMwShy5T6SsHzL                                                   │
│    GMBZgM5FdpgSuaBXFdiKHCKkvVZvxieMVJPrFsDJ88iE                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                 │
│  │ EventID: 8gfBm7R6zEhQUt1YkT1CczbTunR1c6cMqiSMkk1T26Vz:0                                           │
│  │ PackageID: 0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad                     │
│  │ Transaction Module: mygame                                                                        │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                        │
│  │ EventType: 0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad::mygame::MyGameOver │
│  │ ParsedJSON:                                                                                       │
│  │   ┌────────────────┬──────────────────┐                                                           │
│  │   │ is_winner      │ true             │                                                           │
│  │   ├────────────────┼──────────────────┤                                                           │
│  │   │ machine_result │ 1                │                                                           │
│  │   ├────────────────┼──────────────────┤                                                           │
│  │   │ player_guess   │ 1                │                                                           │
│  │   ├────────────────┼──────────────────┤                                                           │
│  │   │ result         │ ooooo-create WIN │                                                           │
│  │   └────────────────┴──────────────────┘                                                           │
│  └──                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x7ee2f592d9cef06d8d3f80cbc98009dfc63f0fca62e04512331f1e15ed96622a                                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                               │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN>  │
│  │ Version: 36675123                                                                                                        │
│  │ Digest: 4i2mK3mhsWTujTd17FwmM5P4d2bccmYiVLcvNyATkQzn                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x837d18d103cb989feb0e175b8a53d0487c03c007c567a6c1b777d91d6138ecb8                                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                               │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN>  │
│  │ Version: 36675123                                                                                                        │
│  │ Digest: HVG9R6LjJ77RexyBkFrgizdMdB7dBq3ECEef8rdERYGu                                                                     │
│  └──                                                                                                                        │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8                                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                               │
│  │ Owner: Shared                                                                                                            │
│  │ ObjectType: 0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad::mygame::MyGame                           │
│  │ Version: 36675123                                                                                                        │
│  │ Digest: 5dZcCR4JbgNiuZVCnLBaM9swP85GR1TdnPg56CfiB5sN                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                               │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 36675123                                                                                                        │
│  │ Digest: HJfwovLQYQm3mNZBJiu2g2FuHTex7aPjUNKGLoP2XHVE                                                                     │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )         │
│  │ CoinType: 0x2::sui::SUI                                                                               │
│  │ Amount: -2452284                                                                                      │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )         │
│  │ CoinType: 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN  │
│  │ Amount: 100000                                                                                        │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## `withdraw`

1. 命令

```
sui client call --package 0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad --module mygame --function withdraw --args 0x35ec5816851249fcac5b883fb0db437b583bb864a9451699ac36989ddc5212e4 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8 20000 --gas-budget 10000000
```

2. 结果

```
Transaction Digest: 2GoayvqR9ryBGKUZu2a4Di3xsi7ichm36uWZ3DpFupcq
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                      │
│ Gas Owner: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                       │
│  │ Version: 36675126                                                                            │
│  │ Digest: 7metSviFS17YF22dEPmaSBkiYZZQcFNtoQ1eRRmemqfu                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x35ec5816851249fcac5b883fb0db437b583bb864a9451699ac36989ddc5212e4 │ │
│ │ 1   Shared Object    ID: 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8 │ │
│ │ 2   Pure Arg: Type: u64, Value: "20000"                                                     │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  withdraw                                                           │            │
│ │  │ Module:    mygame                                                             │            │
│ │  │ Package:   0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    w7O61mwvWjCqympt3VVYhwxgaX06/aFqKIji6hhoCeXqRDsKH2NdqyxqLx3fZLqRE0jObMbgmho3YedxjIPiDQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2GoayvqR9ryBGKUZu2a4Di3xsi7ichm36uWZ3DpFupcq                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 373                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x89b6b17821210cf9f8973d86ac8ab63e32fa843b2d9981e098121212a4ab02d4                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 36675127                                                                              │
│  │ Digest: 7GqrH3jrBxCUPPMVHCG9JnaoAbRposFnh93WECwPckEW                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x35ec5816851249fcac5b883fb0db437b583bb864a9451699ac36989ddc5212e4                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 36675127                                                                              │
│  │ Digest: Aj9udxZzuXhZbC4LRWZCP2f3JzhfvaovudoxRSKxcfL9                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 36675127                                                                              │
│  │ Digest: DDjATGhT8ieP66ULw3agxxaVVTRduZqnbGt3sRjujTkd                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 36675127                                                                              │
│  │ Digest: 7WyQmzLkNQby9jgmyvejNditd6GWnNkHYcKA7phP357c                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8                         │
│  │ Version: 36675123                                                                              │
│  │ Digest: 5dZcCR4JbgNiuZVCnLBaM9swP85GR1TdnPg56CfiB5sN                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 36675127                                                                              │
│  │ Digest: 7WyQmzLkNQby9jgmyvejNditd6GWnNkHYcKA7phP357c                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 5221200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 3769524 MIST                                                                   │
│    Non-refundable Storage Fee: 38076 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    24ff9gBTGtEA1YvbHwXJNQv77jimQRUjTWEe2xNyHJTe                                                   │
│    8gfBm7R6zEhQUt1YkT1CczbTunR1c6cMqiSMkk1T26Vz                                                   │
│    Bnjztjo6CqMPcsiwhp4ohQzmnSGzC9j5dsrc4QZfQ4jA                                                   │
│    Fe27tGYCHCo59F9B2e6ojruxxWo4UdN14uBm85iLa33n                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x89b6b17821210cf9f8973d86ac8ab63e32fa843b2d9981e098121212a4ab02d4                                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                               │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN>  │
│  │ Version: 36675127                                                                                                        │
│  │ Digest: 7GqrH3jrBxCUPPMVHCG9JnaoAbRposFnh93WECwPckEW                                                                     │
│  └──                                                                                                                        │
│ Mutated Objects:                                                                                                            │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x35ec5816851249fcac5b883fb0db437b583bb864a9451699ac36989ddc5212e4                                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                               │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )                            │
│  │ ObjectType: 0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad::mygame::OwnerCapability                  │
│  │ Version: 36675127                                                                                                        │
│  │ Digest: Aj9udxZzuXhZbC4LRWZCP2f3JzhfvaovudoxRSKxcfL9                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0x472ec3a985be7182ff404e141e48d2e8264c98a4f001a249f7e49ae76e7543b8                                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                               │
│  │ Owner: Shared                                                                                                            │
│  │ ObjectType: 0xd8b04849cd2642cc101fbca6043c810cfaa08f2f18cc61e2e5cb79933e5508ad::mygame::MyGame                           │
│  │ Version: 36675127                                                                                                        │
│  │ Digest: DDjATGhT8ieP66ULw3agxxaVVTRduZqnbGt3sRjujTkd                                                                     │
│  └──                                                                                                                        │
│  ┌──                                                                                                                        │
│  │ ObjectID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                                             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                               │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )                            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                               │
│  │ Version: 36675127                                                                                                        │
│  │ Digest: 7WyQmzLkNQby9jgmyvejNditd6GWnNkHYcKA7phP357c                                                                     │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )         │
│  │ CoinType: 0x2::sui::SUI                                                                               │
│  │ Amount: -2451676                                                                                      │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )         │
│  │ CoinType: 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN  │
│  │ Amount: 20000                                                                                         │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
