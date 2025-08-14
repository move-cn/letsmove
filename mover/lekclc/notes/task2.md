
# MYCoin
```
module my_coin::mycoin{
    use std::option;
    use sui::coin::{Self,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Url,Self};

    struct MYCoin has drop{}

    //定义货币的 初始持有者, 初始数量, 名称, 符号,图标
    fun init(waitness: MYCoin, ctx: &mut sui::tx_context::TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(waitness,1,b"MYCoin",b"MYCoin",b"",option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/137021569")),ctx);
        // 将货币的元属性冻结,使得其不可修改
        transfer::public_freeze_object(metadata);
        // 将treasury_cup 转移到交易的发起者(创建者)
        transfer::public_transfer(treasury_cap,tx_context::sender(ctx));
    }

    //增发MYCoin货币
    public entry fun mint(treasury_cap: &mut TreasuryCap<MYCoin>,amount: u64,recipient: address,ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx);
    }
    //销毁已经发行的MYCoin货币
    public fun burn(treasury_cap: &mut TreasuryCap<MYCoin>,coin: Coin<MYCoin>) {
        coin::burn(treasury_cap, coin);
    }
}

```

# 测试网发布
```
sui client publish --gas-budget 30000000 .
```

得到输出
```
Transaction Digest: DQxp6t1vWHRHBxgyf2RC8JHZp1TxVG73pYSHpRSVeiHr
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                   │
│ Gas Owner: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                │
│ Gas Budget: 30000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                                    │
│  │ Version: 879340                                                                                           │
│  │ Digest: 4XjxbgRKyTeBRMcyB6sG8zkuEhLKx56ZhRe7wRPmuF5k                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3" │ │
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
│    fzD3KruZIyoejslA9cAfoJoY2UPO+WYpySYkJEnAITL7Vxnb0F1m1/nkM5kJWbv/G46OoCzSYkpBF4ERaccQCg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DQxp6t1vWHRHBxgyf2RC8JHZp1TxVG73pYSHpRSVeiHr                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 325                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x23a42b98e66e75f8082ac879a42d42f20389cc1efcce5bc77c1d8fda6e8e8345                         │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ Version: 879341                                                                                │
│  │ Digest: 56ChCJ8tZTLs1Arw5AcYAdFbAGWgBc9GWiC4BDFueiih                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x30dda5c15c6d688bcf2ab82bdccf81d6c5fbd1ffa0b033a2b0def989b8040122                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: EpHGezHDV3QDd3avyVh2k9Wiwt1jjGkbL3BYFTVPpRek                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x88bcb86b40e45b8418d3a039d10cb6f392c89764b99f0d98995fac5c047e8b0e                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 879341                                                                                │
│  │ Digest: 8nVWoJK44sTQN4DHWjK9ii1U1FcFV3XCynHXqw2SWAqQ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa03a45a25c5d52665c67b03ff84d2dca6d2d8a76249e0c06e689dac16d18c952                         │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ Version: 879341                                                                                │
│  │ Digest: 64LpVeNPX7Sdr2MwwqQeu1znnQxH73ucrHB42WTosjUR                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                         │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ Version: 879341                                                                                │
│  │ Digest: 4E2aRU4WVGZCE7cuUphJ5TZVLyRihfhGL4fmEBwrkCDe                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                         │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ Version: 879341                                                                                │
│  │ Digest: 4E2aRU4WVGZCE7cuUphJ5TZVLyRihfhGL4fmEBwrkCDe                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 13695200 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    DdPFA6G5u7mDTyPxrGu4Qp9eTNk29QTwqwHYJSZgMn2X                                                   │
│    GZcMfNx5jvGHsfSKEHJD7jZss7yCHqEGfhVk8Jx8a2N1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x23a42b98e66e75f8082ac879a42d42f20389cc1efcce5bc77c1d8fda6e8e8345                                               │
│  │ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                                 │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )                              │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x30dda5c15c6d688bcf2ab82bdccf81d6c5fbd1ffa0b033a2b0def989b8040122::managed::MANAGED>   │
│  │ Version: 879341                                                                                                            │
│  │ Digest: 56ChCJ8tZTLs1Arw5AcYAdFbAGWgBc9GWiC4BDFueiih                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x88bcb86b40e45b8418d3a039d10cb6f392c89764b99f0d98995fac5c047e8b0e                                               │
│  │ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                                 │
│  │ Owner: Immutable                                                                                                           │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x30dda5c15c6d688bcf2ab82bdccf81d6c5fbd1ffa0b033a2b0def989b8040122::managed::MANAGED>  │
│  │ Version: 879341                                                                                                            │
│  │ Digest: 8nVWoJK44sTQN4DHWjK9ii1U1FcFV3XCynHXqw2SWAqQ                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xa03a45a25c5d52665c67b03ff84d2dca6d2d8a76249e0c06e689dac16d18c952                                               │
│  │ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                                 │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )                              │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                       │
│  │ Version: 879341                                                                                                            │
│  │ Digest: 64LpVeNPX7Sdr2MwwqQeu1znnQxH73ucrHB42WTosjUR                                                                       │
│  └──                                                                                                                          │
│ Mutated Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                                               │
│  │ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                                 │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                 │
│  │ Version: 879341                                                                                                            │
│  │ Digest: 4E2aRU4WVGZCE7cuUphJ5TZVLyRihfhGL4fmEBwrkCDe                                                                       │
│  └──                                                                                                                          │
│ Published Objects:                                                                                                            │
│  ┌──                                                                                                                          │
│  │ PackageID: 0x30dda5c15c6d688bcf2ab82bdccf81d6c5fbd1ffa0b033a2b0def989b8040122                                              │
│  │ Version: 1                                                                                                                 │
│  │ Digest: EpHGezHDV3QDd3avyVh2k9Wiwt1jjGkbL3BYFTVPpRek                                                                       │
│  │ Modules: managed                                                                                                           │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -13717080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

得到package id `0x30dda5c15c6d688bcf2ab82bdccf81d6c5fbd1ffa0b033a2b0def989b8040122`
TreasuryCap对象的ID地址 `0x23a42b98e66e75f8082ac879a42d42f20389cc1efcce5bc77c1d8fda6e8e8345`

## 铸造代币
发送到接收方 `0xf1bdbc9792c5e115251f631097cdb84b6123ef9908d4c77536c955d7dfaf0dfc`

使用
```
sui client call --function mint --module managed --package 0x30dda5c15c6d688bcf2ab82bdccf81d6c5fbd1ffa0b033a2b0def989b8040122 --args 0x23a42b98e66e75f8082ac879a42d42f20389cc1efcce5bc77c1d8fda6e8e8345 \"10\" 0xf1bdbc9792c5e115251f631097cdb84b6123ef9908d4c77536c955d7dfaf0dfc  --gas-budget 3000000
```
格式
```
sui client call --function mint --module managed --package $PACKAGE_ID --args $TREASURYCAP_ID \"<amount to mint>\" <recipient address> --gas-budget 3000000
```

得到输出
```
Transaction Digest: 3XNFa69RDkEGAgg72GwxRxpYD9JY3TFfkDmUED4jgdqV
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                   │
│ Gas Owner: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                │
│ Gas Budget: 3000000 MIST                                                                                     │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                                    │
│  │ Version: 879341                                                                                           │
│  │ Digest: 4E2aRU4WVGZCE7cuUphJ5TZVLyRihfhGL4fmEBwrkCDe                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x23a42b98e66e75f8082ac879a42d42f20389cc1efcce5bc77c1d8fda6e8e8345              │ │
│ │ 1   Pure Arg: Type: u64, Value: "10"                                                                     │ │
│ │ 2   Pure Arg: Type: address, Value: "0xf1bdbc9792c5e115251f631097cdb84b6123ef9908d4c77536c955d7dfaf0dfc" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    managed                                                            │                         │
│ │  │ Package:   0x30dda5c15c6d688bcf2ab82bdccf81d6c5fbd1ffa0b033a2b0def989b8040122 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    EOpneGNKfoiXqSJG/ayPNqIxihcmBFRaZHwNNmw26FDQb0j7G9UequkdNLzRv36vY9BMxti3erv2YlSJL6XrBw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3XNFa69RDkEGAgg72GwxRxpYD9JY3TFfkDmUED4jgdqV                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 325                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x59ba5b892541cebcd5a081cb84e043c2f25a15e604ca268ec16620b2da206642                         │
│  │ Owner: Account Address ( 0xf1bdbc9792c5e115251f631097cdb84b6123ef9908d4c77536c955d7dfaf0dfc )  │
│  │ Version: 879342                                                                                │
│  │ Digest: 8Ca1M2h78SkCvUQa3LLag9xqRqug9f3NHWkLWueGU1uv                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                         │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ Version: 879342                                                                                │
│  │ Digest: CfdDBxT8ogL3yRT25GqoDkvuFiBXxmJUsVdCz9jkDEz3                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x23a42b98e66e75f8082ac879a42d42f20389cc1efcce5bc77c1d8fda6e8e8345                         │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ Version: 879342                                                                                │
│  │ Digest: 79Q9hv8ZntDqFt5wFXVfqpkqcp2yxg25iSViHWyrjyTS                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                         │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )  │
│  │ Version: 879342                                                                                │
│  │ Digest: CfdDBxT8ogL3yRT25GqoDkvuFiBXxmJUsVdCz9jkDEz3                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4104000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2708640 MIST                                                                   │
│    Non-refundable Storage Fee: 27360 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    DQxp6t1vWHRHBxgyf2RC8JHZp1TxVG73pYSHpRSVeiHr                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                             │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0x59ba5b892541cebcd5a081cb84e043c2f25a15e604ca268ec16620b2da206642                                              │
│  │ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                                │
│  │ Owner: Account Address ( 0xf1bdbc9792c5e115251f631097cdb84b6123ef9908d4c77536c955d7dfaf0dfc )                             │
│  │ ObjectType: 0x2::coin::Coin<0x30dda5c15c6d688bcf2ab82bdccf81d6c5fbd1ffa0b033a2b0def989b8040122::managed::MANAGED>         │
│  │ Version: 879342                                                                                                           │
│  │ Digest: 8Ca1M2h78SkCvUQa3LLag9xqRqug9f3NHWkLWueGU1uv                                                                      │
│  └──                                                                                                                         │
│ Mutated Objects:                                                                                                             │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0x0d3569d5a9066c26298d1a8521ce463006ec2c0fdbb1320a4a058e37e1b460a7                                              │
│  │ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                                │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )                             │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                │
│  │ Version: 879342                                                                                                           │
│  │ Digest: CfdDBxT8ogL3yRT25GqoDkvuFiBXxmJUsVdCz9jkDEz3                                                                      │
│  └──                                                                                                                         │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0x23a42b98e66e75f8082ac879a42d42f20389cc1efcce5bc77c1d8fda6e8e8345                                              │
│  │ Sender: 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3                                                │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )                             │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x30dda5c15c6d688bcf2ab82bdccf81d6c5fbd1ffa0b033a2b0def989b8040122::managed::MANAGED>  │
│  │ Version: 879342                                                                                                           │
│  │ Digest: 79Q9hv8ZntDqFt5wFXVfqpkqcp2yxg25iSViHWyrjyTS                                                                      │
│  └──                                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                    │
├────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                               │
│  │ Owner: Account Address ( 0xd37d33817777ceda214785dfd8e0bf7b9e5ff78a527713d90f3cd5d30862f8b3 )   │
│  │ CoinType: 0x2::sui::SUI                                                                         │
│  │ Amount: -2395360                                                                                │
│  └──                                                                                               │
│  ┌──                                                                                               │
│  │ Owner: Account Address ( 0xf1bdbc9792c5e115251f631097cdb84b6123ef9908d4c77536c955d7dfaf0dfc )   │
│  │ CoinType: 0x30dda5c15c6d688bcf2ab82bdccf81d6c5fbd1ffa0b033a2b0def989b8040122::managed::MANAGED  │
│  │ Amount: 10                                                                                      │
│  └──                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
可以看到我们成功的铸造了0.1的MNG代币, 并成功的发送到了接收方 `0xf1bdbc9792c5e115251f631097cdb84b6123ef9908d4c77536c955d7dfaf0dfc`

# 主网发布
按照测试网过程,切换为`mainnet`便可
package id `0x76482d9e5198737771dbe3758bd44336276dc9d07d8ce1d031c223fa138574d3`

TreasuryCap对象的ID地址 `0xf55e0717ac68aaed3e1d665afaf16508e8c16e85ec498cb51468a6dd7460d9de`
然后给`0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`发送两枚 MYUCOIN
```
sui client call --function mint --module mycoin --package 0x76482d9e5198737771dbe3758bd44336276dc9d07d8ce1d031c223fa138574d3 --args 0xf55e0717ac68aaed3e1d665afaf16508e8c16e85ec498cb51468a6dd7460d9de  \"200\" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 3000000
```

交易hash `FemBPjTBNzTDqqF7KjVYzQ4XRAd1DoSpT1yaBfhD1yaa`