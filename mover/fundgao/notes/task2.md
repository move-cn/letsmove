1. 创建
```
sui move new move_coin_sui
```
2. 在 move_coin_sui/sources 新建 apt.move 文件
```
module move_coin::apt {
    use std::option;
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct APT has drop {}

    fun init(witness: APT, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            9, 
            b"A PPT", 
            b"APT", 
            b"apt for test", 
            option::none(), 
            ctx
        );
        // freeze the currency
        transfer::public_freeze_object(metadata);
        // transfer the treasury to the sender
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<APT>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}
```
wld.move
```
module move_coin::wld {
    use std::option;
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct WLD has drop {}

    fun init(witness: WLD, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            9, 
            b"World Coin", 
            b"WLD", 
            b"world coin for test",  
            option::none(), 
            ctx
        );
        // freeze the currency
        transfer::public_freeze_object(metadata);
        // transfer the treasury to the sender
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<WLD>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}
```
3. build
```
sui move build
```
4. 发布
```
sui client publish 

# 成功后信息如下：
fund@Fund-Ubuntu:~/Learn/Code/Github/move_coin_sui$ sui client publish 
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING move_coin
Successfully verified dependencies on-chain against source.
Transaction Digest: 9e9W4JNLYoDkNsjCqyTMqgerDcZN4dGHKLQEGd493jx1
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                   │
│ Gas Owner: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                                    │
│  │ Version: 1086105                                                                                          │
│  │ Digest: HCXRJtHS29EqfKQXQZh3ufNnwApMEVKDmDxwRAd2SQgy                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663" │ │
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
│    eQEb1uLZYBo01rv27oEs8idZNb+HNBqZSi0ae10iuW5H5ZsYDJvYxf659Ctvw4rXG2AN9ge2akrkeGMrRROZAQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9e9W4JNLYoDkNsjCqyTMqgerDcZN4dGHKLQEGd493jx1                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 326                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0cb135621dbfec4ce18cd8dacb62a6529e6eff0c7dd112a7c80f938d9e22e065                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086106                                                                               │
│  │ Digest: SuETQxpjveEKjbyp3FqVjbipbofwmjRVnHkSvYQ7D1B                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x0e0c015d5a47aedfbcd58410194ac433b36251a24c748d0dffa761927fde2662                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1086106                                                                               │
│  │ Digest: 4N67EH5wJsi5exiLzQH4uJQXMpTUpRhjh7buzXeLRq9B                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x1e5862d11af106623c03f396f0f2c73bc491bab5f92567d6d292f34d0401cbb2                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086106                                                                               │
│  │ Digest: qWk3JgdsFBreTBx692rYuApcth5BPTGWi64U7n8wSKp                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa3fb5e6d1286399eb93463643bd4ad4a5e4f5742715bc31376f20c1f1a262905                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1086106                                                                               │
│  │ Digest: 4dhbuCviRuJU33ye3YDB9nyqTQK1VN4po5jRMxs1SsJs                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xae3669f451d88db83de70072a5c3e34834f08677b63a4b7c1f8027c71396b043                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086106                                                                               │
│  │ Digest: D9orzyuKUxBkxMyLhGQWXEBU1gpmmUHrVq6NDWM5FBoD                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf394dacb9d831ee2803f24703aa30a6855d98f367b2e5de8e85dd366c629ba3c                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: BgvPuLd5zaQU3h9cnZm7SqvXkr6aheV9RrK8u5kTmKtL                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086106                                                                               │
│  │ Digest: 9aZeFwo1UpqbrDZtA7m5vQyZfpnZCujwDUtgVinmSNCM                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086106                                                                               │
│  │ Digest: 9aZeFwo1UpqbrDZtA7m5vQyZfpnZCujwDUtgVinmSNCM                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 22002000 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    GZcMfNx5jvGHsfSKEHJD7jZss7yCHqEGfhVk8Jx8a2N1                                                   │
│    HrYWgNr9omBiDu1mzTk3gp5e86eXbZ7P8UW4TWBZbUSS                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x0cb135621dbfec4ce18cd8dacb62a6529e6eff0c7dd112a7c80f938d9e22e065                                       │
│  │ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                               │
│  │ Version: 1086106                                                                                                   │
│  │ Digest: SuETQxpjveEKjbyp3FqVjbipbofwmjRVnHkSvYQ7D1B                                                                │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x0e0c015d5a47aedfbcd58410194ac433b36251a24c748d0dffa761927fde2662                                       │
│  │ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                         │
│  │ Owner: Immutable                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xf394dacb9d831ee2803f24703aa30a6855d98f367b2e5de8e85dd366c629ba3c::wld::WLD>  │
│  │ Version: 1086106                                                                                                   │
│  │ Digest: 4N67EH5wJsi5exiLzQH4uJQXMpTUpRhjh7buzXeLRq9B                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x1e5862d11af106623c03f396f0f2c73bc491bab5f92567d6d292f34d0401cbb2                                       │
│  │ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xf394dacb9d831ee2803f24703aa30a6855d98f367b2e5de8e85dd366c629ba3c::apt::APT>   │
│  │ Version: 1086106                                                                                                   │
│  │ Digest: qWk3JgdsFBreTBx692rYuApcth5BPTGWi64U7n8wSKp                                                                │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0xa3fb5e6d1286399eb93463643bd4ad4a5e4f5742715bc31376f20c1f1a262905                                       │
│  │ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                         │
│  │ Owner: Immutable                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xf394dacb9d831ee2803f24703aa30a6855d98f367b2e5de8e85dd366c629ba3c::apt::APT>  │
│  │ Version: 1086106                                                                                                   │
│  │ Digest: 4dhbuCviRuJU33ye3YDB9nyqTQK1VN4po5jRMxs1SsJs                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0xae3669f451d88db83de70072a5c3e34834f08677b63a4b7c1f8027c71396b043                                       │
│  │ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xf394dacb9d831ee2803f24703aa30a6855d98f367b2e5de8e85dd366c629ba3c::wld::WLD>   │
│  │ Version: 1086106                                                                                                   │
│  │ Digest: D9orzyuKUxBkxMyLhGQWXEBU1gpmmUHrVq6NDWM5FBoD                                                               │
│  └──                                                                                                                  │
│ Mutated Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                                       │
│  │ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                         │
│  │ Version: 1086106                                                                                                   │
│  │ Digest: 9aZeFwo1UpqbrDZtA7m5vQyZfpnZCujwDUtgVinmSNCM                                                               │
│  └──                                                                                                                  │
│ Published Objects:                                                                                                    │
│  ┌──                                                                                                                  │
│  │ PackageID: 0xf394dacb9d831ee2803f24703aa30a6855d98f367b2e5de8e85dd366c629ba3c                                      │
│  │ Version: 1                                                                                                         │
│  │ Digest: BgvPuLd5zaQU3h9cnZm7SqvXkr6aheV9RrK8u5kTmKtL                                                               │
│  │ Modules: apt, wld                                                                                                  │
│  └──                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -22023880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```
5. 设置环境变量
```
export PACKAGE_ID=0xf394dacb9d831ee2803f24703aa30a6855d98f367b2e5de8e85dd366c629ba3c
export APT_TREASURYCAP=0x1e5862d11af106623c03f396f0f2c73bc491bab5f92567d6d292f34d0401cbb2
export WLD_TREASURYCAP=0x0e0c015d5a47aedfbcd58410194ac433b36251a24c748d0dffa761927fde2662
export TO_ADDRESS=0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663
```
6. 发布者交互
发布者调用`apt`模块，向指定地址转移1个coin
```
sui client call --package $PACKAGE_ID --module apt --function mint --args $APT_TREASURYCAP 1 $TO_ADDRESS 

# 成功后信息如下：
Transaction Digest: 5Tp7Wjz8M8vcPdsaF4aNLFGqr1SrBBWdJfeBiWjizwAV
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                   │
│ Gas Owner: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                                    │
│  │ Version: 1086106                                                                                          │
│  │ Digest: 9aZeFwo1UpqbrDZtA7m5vQyZfpnZCujwDUtgVinmSNCM                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x1e5862d11af106623c03f396f0f2c73bc491bab5f92567d6d292f34d0401cbb2              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1"                                                                      │ │
│ │ 2   Pure Arg: Type: address, Value: "0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    apt                                                                │                         │
│ │  │ Package:   0xf394dacb9d831ee2803f24703aa30a6855d98f367b2e5de8e85dd366c629ba3c │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    egEfu+83uNqORCW/WMjrcnU3qAJPQpkN/+6sOFqC1DJMiRJ2/330dD8ueiWF3i4VsPjw8qJaWaZIhKfleoMwDw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5Tp7Wjz8M8vcPdsaF4aNLFGqr1SrBBWdJfeBiWjizwAV                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 326                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xadf4366d60e154f30dc1e6ed2a8b05a311a3cf64f6f311c597d195a1fa8fa9eb                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086107                                                                               │
│  │ Digest: 8ACeBwPB5SG2nUeZxPCfNtJ2Ks7jizbRMEqPbKCmAn9w                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1e5862d11af106623c03f396f0f2c73bc491bab5f92567d6d292f34d0401cbb2                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086107                                                                               │
│  │ Digest: 72tKM4XHyfo1qoCnVWfwVspw5cA9rBcRJXZufZJfGwpu                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086107                                                                               │
│  │ Digest: 8rGJtD3nnNsC34CQhSAYNCG71R3v7dEcBMZyZJDSsdEH                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                         │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ Version: 1086107                                                                               │
│  │ Digest: 8rGJtD3nnNsC34CQhSAYNCG71R3v7dEcBMZyZJDSsdEH                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3982400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2648448 MIST                                                                   │
│    Non-refundable Storage Fee: 26752 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    9e9W4JNLYoDkNsjCqyTMqgerDcZN4dGHKLQEGd493jx1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                     │
│  ┌──                                                                                                                 │
│  │ ObjectID: 0xadf4366d60e154f30dc1e6ed2a8b05a311a3cf64f6f311c597d195a1fa8fa9eb                                      │
│  │ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                        │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )                     │
│  │ ObjectType: 0x2::coin::Coin<0xf394dacb9d831ee2803f24703aa30a6855d98f367b2e5de8e85dd366c629ba3c::apt::APT>         │
│  │ Version: 1086107                                                                                                  │
│  │ Digest: 8ACeBwPB5SG2nUeZxPCfNtJ2Ks7jizbRMEqPbKCmAn9w                                                              │
│  └──                                                                                                                 │
│ Mutated Objects:                                                                                                     │
│  ┌──                                                                                                                 │
│  │ ObjectID: 0x1e5862d11af106623c03f396f0f2c73bc491bab5f92567d6d292f34d0401cbb2                                      │
│  │ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                        │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )                     │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xf394dacb9d831ee2803f24703aa30a6855d98f367b2e5de8e85dd366c629ba3c::apt::APT>  │
│  │ Version: 1086107                                                                                                  │
│  │ Digest: 72tKM4XHyfo1qoCnVWfwVspw5cA9rBcRJXZufZJfGwpu                                                              │
│  └──                                                                                                                 │
│  ┌──                                                                                                                 │
│  │ ObjectID: 0xbe800aef4719d0f050d71b6962351217c1dc57b6d3552118c5f17f44ed961757                                      │
│  │ Sender: 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663                                        │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                        │
│  │ Version: 1086107                                                                                                  │
│  │ Digest: 8rGJtD3nnNsC34CQhSAYNCG71R3v7dEcBMZyZJDSsdEH                                                              │
│  └──                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2333952                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xfb475459e707aedac09d2fa15cff75b87a5dd7aa13e3684a87e7390629748663 )  │
│  │ CoinType: 0xf394dacb9d831ee2803f24703aa30a6855d98f367b2e5de8e85dd366c629ba3c::apt::APT         │
│  │ Amount: 1                                                                                      │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

# 通过新创建的 ObjectID: 0xadf4366d60e154f30dc1e6ed2a8b05a311a3cf64f6f311c597d195a1fa8fa9eb 去浏览器查询可得 hash: 5Tp7Wjz8M8vcPdsaF4aNLFGqr1SrBBWdJfeBiWjizwAV
# 详细信息可点击 [这里](https://suiscan.xyz/mainnet/tx/5Tp7Wjz8M8vcPdsaF4aNLFGqr1SrBBWdJfeBiWjizwAV) 查看。
```