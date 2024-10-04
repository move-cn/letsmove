# task3

## 发布上链

1. 命令

```
sui client publish 
```

2. 结果

```
Transaction Digest: 2uii7Vw7tWTAFhFrcqUxc7Hyj9WBmn3xJnWNWKvUokvu
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
│  │ Version: 1192537                                                                                          │
│  │ Digest: Awavr1XKkkBZqfcCbeEE3WVivfLujnv6hipes1KfBMyc                                                      │
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
│    eAavHcdNKIc0cd/edC8pXDze5RZAyNT5g0xCi11swiQjXWHzYlB3IxqUs8kNKZnEVuLpj3GDWD9n/bCo9SJ/AA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2uii7Vw7tWTAFhFrcqUxc7Hyj9WBmn3xJnWNWKvUokvu                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 372                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa28e994f018159a2da32fdbbae3a534045d3ffe81c64d364e6df76274ecb278e                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192538                                                                               │
│  │ Digest: A9UNCjSHJrUqCJJAMoFXnnt2Fg1xYydC3814tkmQLpCz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbc8c58d3d155ce7d93732c4cd82ba78eb7b45aeefd9954ac81bd1765cd30757a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: C88vF9p8hTi7d6qaVWaeiaaR62EquVrSizpTwDRh94fb                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192538                                                                               │
│  │ Digest: EntEi9YwAhiD4UPYUMkoXXRQBKNdMSPsSiGiwcSWFV2D                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192538                                                                               │
│  │ Digest: EntEi9YwAhiD4UPYUMkoXXRQBKNdMSPsSiGiwcSWFV2D                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 10016800 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3Mda8Jvzqw2XWAkvTdfirBeiGrRMfVf6grQNtaHvRZNm                                                   │
│    6c3hAbXwoKqSv8Grf4wv7VAJYpT7UnPxV3zqeRjmN1JY                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xa28e994f018159a2da32fdbbae3a534045d3ffe81c64d364e6df76274ecb278e                  │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                    │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 1192538                                                                              │
│  │ Digest: A9UNCjSHJrUqCJJAMoFXnnt2Fg1xYydC3814tkmQLpCz                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                  │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                    │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 1192538                                                                              │
│  │ Digest: EntEi9YwAhiD4UPYUMkoXXRQBKNdMSPsSiGiwcSWFV2D                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xbc8c58d3d155ce7d93732c4cd82ba78eb7b45aeefd9954ac81bd1765cd30757a                 │
│  │ Version: 1                                                                                    │
│  │ Digest: C88vF9p8hTi7d6qaVWaeiaaR62EquVrSizpTwDRh94fb                                          │
│  │ Modules: mynft                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -10038680                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## mint_to_sender

1. 命令

```
sui client call --function mint_to_sender --module mynft --package 0xbc8c58d3d155ce7d93732c4cd82ba78eb7b45aeefd9954ac81bd1765cd30757a --args "ooooo-create" "nft" "https://avatars.githubusercontent.com/ooooo-create"
```

2. 结果

```
Transaction Digest: 34h4VziBYazqtxzNeV5wFiznoGGYyeFQ4bY7qHHg8AUx
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                      │
│ Gas Owner: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                   │
│ Gas Budget: 4774000 MIST                                                                        │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                       │
│  │ Version: 1192538                                                                             │
│  │ Digest: EntEi9YwAhiD4UPYUMkoXXRQBKNdMSPsSiGiwcSWFV2D                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "ooooo-create"                                       │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "nft"                                                │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "https://avatars.githubusercontent.com/ooooo-create" │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  mint_to_sender                                                     │            │
│ │  │ Module:    mynft                                                              │            │
│ │  │ Package:   0xbc8c58d3d155ce7d93732c4cd82ba78eb7b45aeefd9954ac81bd1765cd30757a │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    i/Yzkf9xmdqhTD/sQvYCRRb9AA8L9zyS8UiF1fCy29Ax3aoIJ/EdnC9OJ6gtGMdAnW/XQqxbhbECcNCHob7SCQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 34h4VziBYazqtxzNeV5wFiznoGGYyeFQ4bY7qHHg8AUx                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 372                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x497c6a89cc8ee017bc8bb23e238be20d989d805a4c03b3b86acd5fe679f071c8                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192539                                                                               │
│  │ Digest: FDCJK8RHS7d4Mkb4ZWKpH6jHGymLnLbsRHZmAg9fsS13                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192539                                                                               │
│  │ Digest: B7M9DVF8nKATqMzA3tekRMfEbWkBcUBp9R93tbEpoxQH                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192539                                                                               │
│  │ Digest: B7M9DVF8nKATqMzA3tekRMfEbWkBcUBp9R93tbEpoxQH                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2774000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2uii7Vw7tWTAFhFrcqUxc7Hyj9WBmn3xJnWNWKvUokvu                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                           │
├────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                               │
│  │ EventID: 34h4VziBYazqtxzNeV5wFiznoGGYyeFQ4bY7qHHg8AUx:0                                         │
│  │ PackageID: 0xbc8c58d3d155ce7d93732c4cd82ba78eb7b45aeefd9954ac81bd1765cd30757a                   │
│  │ Transaction Module: mynft                                                                       │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                      │
│  │ EventType: 0xbc8c58d3d155ce7d93732c4cd82ba78eb7b45aeefd9954ac81bd1765cd30757a::mynft::NFTMinted │
│  │ ParsedJSON:                                                                                     │
│  │   ┌───────────┬────────────────────────────────────────────────────────────────────┐            │
│  │   │ creator   │ 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 │            │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤            │
│  │   │ name      │ ooooo-create                                                       │            │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤            │
│  │   │ object_id │ 0x497c6a89cc8ee017bc8bb23e238be20d989d805a4c03b3b86acd5fe679f071c8 │            │
│  │   └───────────┴────────────────────────────────────────────────────────────────────┘            │
│  └──                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x497c6a89cc8ee017bc8bb23e238be20d989d805a4c03b3b86acd5fe679f071c8                  │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                    │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 ) │
│  │ ObjectType: 0xbc8c58d3d155ce7d93732c4cd82ba78eb7b45aeefd9954ac81bd1765cd30757a::mynft::MyNFT  │
│  │ Version: 1192539                                                                              │
│  │ Digest: FDCJK8RHS7d4Mkb4ZWKpH6jHGymLnLbsRHZmAg9fsS13                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                  │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                    │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 1192539                                                                              │
│  │ Digest: B7M9DVF8nKATqMzA3tekRMfEbWkBcUBp9R93tbEpoxQH                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2795880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## mint to `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

1. 命令

```
sui client call --function transfer --module mynft --package 0xbc8c58d3d155ce7d93732c4cd82ba78eb7b45aeefd9954ac81bd1765cd30757a --args 0x497c6a89cc8ee017bc8bb23e238be20d989d805a4c03b3b86acd5fe679f071c8 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```

2. 结果

```
Transaction Digest: 2KX9GXoi3ft1n5KHNbgTsiv8Dyq8joszduKhDAC7wLob
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                   │
│ Gas Owner: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                │
│ Gas Budget: 3005860 MIST                                                                                     │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                                    │
│  │ Version: 1192539                                                                                          │
│  │ Digest: B7M9DVF8nKATqMzA3tekRMfEbWkBcUBp9R93tbEpoxQH                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x497c6a89cc8ee017bc8bb23e238be20d989d805a4c03b3b86acd5fe679f071c8              │ │
│ │ 1   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  transfer                                                           │                         │
│ │  │ Module:    mynft                                                              │                         │
│ │  │ Package:   0xbc8c58d3d155ce7d93732c4cd82ba78eb7b45aeefd9954ac81bd1765cd30757a │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    RPMRw5GRF1Cx+BjNuz0sQOYs32JApif6NuVZfwqFNdIn7ZUrNwj7vIHo/YhzrMSmYCIjsd8LJEecYjTdnGGJCg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2KX9GXoi3ft1n5KHNbgTsiv8Dyq8joszduKhDAC7wLob                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 372                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x497c6a89cc8ee017bc8bb23e238be20d989d805a4c03b3b86acd5fe679f071c8                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 1192540                                                                               │
│  │ Digest: 2wpE2RFvCc2DeEBEpHUQfq4Niz6AE2A6bgufdSa1LT5o                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192540                                                                               │
│  │ Digest: 2Jmk9NUQdt3F9G1chtBu8AmzqEjcShZBfRL6bGVFF1QD                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192540                                                                               │
│  │ Digest: 2Jmk9NUQdt3F9G1chtBu8AmzqEjcShZBfRL6bGVFF1QD                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2774000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2746260 MIST                                                                   │
│    Non-refundable Storage Fee: 27740 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2uii7Vw7tWTAFhFrcqUxc7Hyj9WBmn3xJnWNWKvUokvu                                                   │
│    34h4VziBYazqtxzNeV5wFiznoGGYyeFQ4bY7qHHg8AUx                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x497c6a89cc8ee017bc8bb23e238be20d989d805a4c03b3b86acd5fe679f071c8                  │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                    │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 ) │
│  │ ObjectType: 0xbc8c58d3d155ce7d93732c4cd82ba78eb7b45aeefd9954ac81bd1765cd30757a::mynft::MyNFT  │
│  │ Version: 1192540                                                                              │
│  │ Digest: 2wpE2RFvCc2DeEBEpHUQfq4Niz6AE2A6bgufdSa1LT5o                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                  │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                    │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 1192540                                                                              │
│  │ Digest: 2Jmk9NUQdt3F9G1chtBu8AmzqEjcShZBfRL6bGVFF1QD                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1027740                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
