1. 创建
```
sui move new coin_study
touch coin_study/sources/mycoin.move
touch coin_study/sources/faucetcoin.move
```
2. 代码
mycoin.move
```
module coin_study::mycoin {
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, TreasuryCap};
    use std::option;
    use sui::url;
    use sui::transfer;

    struct MYCOIN has drop {}

    fun init(otw: MYCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            otw,
            9,
            b"BLACK MYTH WUKONG",
            b"WUKONG",
            b"CONFRONT DESTINY AUGUST 20, 2024",
            option::some(url::new_unsafe_from_bytes(b"https://github.com/zcy1024/SuiStudy/blob/main/coin_study/imgs/WUKONG.png?raw=true")),
            ctx,
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    entry fun mint(treasury_cap: &mut TreasuryCap<MYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}
```
faucetcoin.move
```
module coin_study::faucetcoin {
    use sui::tx_context::TxContext;
    use sui::coin::{Self, TreasuryCap};
    use std::option;
    use sui::url;
    use sui::transfer;

    struct FAUCETCOIN has drop {}

    #[allow(lint(share_owned))]
    fun init(otw: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            otw,
            9,
            b"BLACK MYTH WUKONG",
            b"WUKONG",
            b"CONFRONT DESTINY AUGUST 20, 2024",
            option::some(url::new_unsafe_from_bytes(b"https://github.com/zcy1024/SuiStudy/blob/main/coin_study/imgs/WUKONG.png?raw=true")),
            ctx,
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    entry fun mint(treasury_cap: &mut TreasuryCap<FAUCETCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
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
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING coin_study
Total number of linter warnings suppressed: 1 (filtered categories: 1)
Successfully verified dependencies on-chain against source.
Transaction Digest: He51stB8JppxEocdgNURkrBmxUKuDbEYdTdpH5TY7Muc
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                   │
│ Gas Owner: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                │
│ Gas Budget: 90000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x98eaefd0015d5e64788bd6aa07974831c96b4f424c2855b081f3b83de76adc0d                                    │
│  │ Version: 81313239                                                                                         │
│  │ Digest: 657VeK6xefxWWY5Lw7WoR7fcHyaQACrkbdL4KwXKNfEM                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67" │ │
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
│    dRDTTU1p4l9JgN3qXae7D8YADyBVJ8MADZfkoyTu8nEBsUFZrTlRiMyZIL2TbLKtrpYfqCMMcMSVp6bAuy9EBg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: He51stB8JppxEocdgNURkrBmxUKuDbEYdTdpH5TY7Muc                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 351                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 2E6FFkTDwZdjR7oRsxkRwPxPE6FYvnaVeKAYpz7piwdQ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5c92b5a1a8ebd2d712557c10953d6c9a271b34c405d79e146a12ad8f3f6ef8ff                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313240                                                                              │
│  │ Digest: CNVUKcQHkrc4NHoCFTZGsBGjFY1Hx3stTLcZbBEV8toe                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5caab654b1be843d27c1fb77e7b868fa3e77cff3084110e5a35a44b93beee1d8                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 81313240                                                                              │
│  │ Digest: 2W9ozYBbW8HPJiwafjBEHuB2e11vs9xSK9dzAeoQixYw                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xcea84389fcfbe8277d261e17cec3918eee85f88191bf9cd228a7bd0aea5c5c24                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313240                                                                              │
│  │ Digest: 8X5a1hESX2PbQtbKR8RRjcRz1EHA7pUbNhGN5cYdd5bU                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xdbce04c83517809aef60296d4f49f90afb6b69708bf68af2c59816d97799cf08                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 81313240                                                                              │
│  │ Digest: VXS4Bm1zqQgTst1g3e8NkXokSSV4ESzypnBxez9j6o7                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe2c1ab94d4ec33968a137efd66ae0b755904f84c1772e2e424319aff0d8edf07                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 81313240                                                                              │
│  │ Digest: 3SNydKBcUYr2j2xAKuJAwdEU2ptWxWNX59ANjBtNasqa                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x98eaefd0015d5e64788bd6aa07974831c96b4f424c2855b081f3b83de76adc0d                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313240                                                                              │
│  │ Digest: FStc76AnP2b9Jw6jNBZBiTw5w4yLmwmeDUumsdQCra9h                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x98eaefd0015d5e64788bd6aa07974831c96b4f424c2855b081f3b83de76adc0d                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313240                                                                              │
│  │ Digest: FStc76AnP2b9Jw6jNBZBiTw5w4yLmwmeDUumsdQCra9h                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 26660800 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    mfu3eGvn1HzJevdZuEj5amPq5eSofRWkWmNxgwfbymV                                                    │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    9LheJKw1oShCSy6u2bJ27YimAoSgKVxXLqo8rSfJtuNR                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                    │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x5c92b5a1a8ebd2d712557c10953d6c9a271b34c405d79e146a12ad8f3f6ef8ff                                                     │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                       │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                    │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                             │
│  │ Version: 81313240                                                                                                                │
│  │ Digest: CNVUKcQHkrc4NHoCFTZGsBGjFY1Hx3stTLcZbBEV8toe                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x5caab654b1be843d27c1fb77e7b868fa3e77cff3084110e5a35a44b93beee1d8                                                     │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                       │
│  │ Owner: Shared                                                                                                                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11::faucetcoin::FAUCETCOIN>   │
│  │ Version: 81313240                                                                                                                │
│  │ Digest: 2W9ozYBbW8HPJiwafjBEHuB2e11vs9xSK9dzAeoQixYw                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0xcea84389fcfbe8277d261e17cec3918eee85f88191bf9cd228a7bd0aea5c5c24                                                     │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                       │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11::mycoin::MYCOIN>           │
│  │ Version: 81313240                                                                                                                │
│  │ Digest: 8X5a1hESX2PbQtbKR8RRjcRz1EHA7pUbNhGN5cYdd5bU                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0xdbce04c83517809aef60296d4f49f90afb6b69708bf68af2c59816d97799cf08                                                     │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                       │
│  │ Owner: Immutable                                                                                                                 │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11::faucetcoin::FAUCETCOIN>  │
│  │ Version: 81313240                                                                                                                │
│  │ Digest: VXS4Bm1zqQgTst1g3e8NkXokSSV4ESzypnBxez9j6o7                                                                              │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0xe2c1ab94d4ec33968a137efd66ae0b755904f84c1772e2e424319aff0d8edf07                                                     │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                       │
│  │ Owner: Immutable                                                                                                                 │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11::mycoin::MYCOIN>          │
│  │ Version: 81313240                                                                                                                │
│  │ Digest: 3SNydKBcUYr2j2xAKuJAwdEU2ptWxWNX59ANjBtNasqa                                                                             │
│  └──                                                                                                                                │
│ Mutated Objects:                                                                                                                    │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x98eaefd0015d5e64788bd6aa07974831c96b4f424c2855b081f3b83de76adc0d                                                     │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                       │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                       │
│  │ Version: 81313240                                                                                                                │
│  │ Digest: FStc76AnP2b9Jw6jNBZBiTw5w4yLmwmeDUumsdQCra9h                                                                             │
│  └──                                                                                                                                │
│ Published Objects:                                                                                                                  │
│  ┌──                                                                                                                                │
│  │ PackageID: 0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11                                                    │
│  │ Version: 1                                                                                                                       │
│  │ Digest: 2E6FFkTDwZdjR7oRsxkRwPxPE6FYvnaVeKAYpz7piwdQ                                                                             │
│  │ Modules: faucetcoin, mycoin                                                                                                      │
│  └──                                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -26432680                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
5. 设置环境变量
```
export PACKAGE_ID=0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11
export MYCOIN_TREASURYCAP=0xcea84389fcfbe8277d261e17cec3918eee85f88191bf9cd228a7bd0aea5c5c24
export FAUCETCOIN_TREASURYCAP=0x5caab654b1be843d27c1fb77e7b868fa3e77cff3084110e5a35a44b93beee1d8
export TO_ADDRESS=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```
6. 发布者交互
发布者调用`mycoin`模块，向指定地址转移1个coin
```
sui client call --package $PACKAGE_ID --module mycoin --function mint --args $MYCOIN_TREASURYCAP 1 $TO_ADDRESS 

# 成功后信息如下：
Transaction Digest: H2JVz3NcQWPGQKVLnunB874MHXsLEdK8joxGHPLdjaks
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                   │
│ Gas Owner: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                │
│ Gas Budget: 70000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x98eaefd0015d5e64788bd6aa07974831c96b4f424c2855b081f3b83de76adc0d                                    │
│  │ Version: 81313240                                                                                         │
│  │ Digest: FStc76AnP2b9Jw6jNBZBiTw5w4yLmwmeDUumsdQCra9h                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xcea84389fcfbe8277d261e17cec3918eee85f88191bf9cd228a7bd0aea5c5c24              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1"                                                                      │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mycoin                                                             │                         │
│ │  │ Package:   0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    b3AwEKY1phymkAJ09MtEHtJ9BwN87u1S2ScIGqa2eOJYh0bfDBlkog/UQL4WZokBasDhhuwg5zhV98GSxNrEBQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: H2JVz3NcQWPGQKVLnunB874MHXsLEdK8joxGHPLdjaks                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 351                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xaa6d7b1b18771650a41a880a1d3f1d1e41e63740ba16f19faa0186906774bf81                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 81313241                                                                              │
│  │ Digest: AnXX357oYvyoiH79PLxWto3i2h7YHGgkpwjKzgixbZfK                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x98eaefd0015d5e64788bd6aa07974831c96b4f424c2855b081f3b83de76adc0d                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313241                                                                              │
│  │ Digest: BmEuck18hMSFFcqQ3u6sdoiNE47cZn3kderzTVjXjQp5                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xcea84389fcfbe8277d261e17cec3918eee85f88191bf9cd228a7bd0aea5c5c24                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313241                                                                              │
│  │ Digest: 9pS4a3naQh2MBMKY975FMGcmDYL5LJns4QcaMKip3oqq                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x98eaefd0015d5e64788bd6aa07974831c96b4f424c2855b081f3b83de76adc0d                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313241                                                                              │
│  │ Digest: BmEuck18hMSFFcqQ3u6sdoiNE47cZn3kderzTVjXjQp5                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    He51stB8JppxEocdgNURkrBmxUKuDbEYdTdpH5TY7Muc                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xaa6d7b1b18771650a41a880a1d3f1d1e41e63740ba16f19faa0186906774bf81                                            │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                              │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                           │
│  │ ObjectType: 0x2::coin::Coin<0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11::mycoin::MYCOIN>         │
│  │ Version: 81313241                                                                                                       │
│  │ Digest: AnXX357oYvyoiH79PLxWto3i2h7YHGgkpwjKzgixbZfK                                                                    │
│  └──                                                                                                                       │
│ Mutated Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x98eaefd0015d5e64788bd6aa07974831c96b4f424c2855b081f3b83de76adc0d                                            │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                              │
│  │ Version: 81313241                                                                                                       │
│  │ Digest: BmEuck18hMSFFcqQ3u6sdoiNE47cZn3kderzTVjXjQp5                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xcea84389fcfbe8277d261e17cec3918eee85f88191bf9cd228a7bd0aea5c5c24                                            │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )                           │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11::mycoin::MYCOIN>  │
│  │ Version: 81313241                                                                                                       │
│  │ Digest: 9pS4a3naQh2MBMKY975FMGcmDYL5LJns4QcaMKip3oqq                                                                    │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ CoinType: 0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11::mycoin::MYCOIN   │
│  │ Amount: 1                                                                                      │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2130008                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

# 通过新创建的 ObjectID: 0xaa6d7b1b18771650a41a880a1d3f1d1e41e63740ba16f19faa0186906774bf81 去浏览器查询可得 hash: H2JVz3NcQWPGQKVLnunB874MHXsLEdK8joxGHPLdjaks
# 详细信息可点击 [这里](https://suiscan.xyz/mainnet/tx/H2JVz3NcQWPGQKVLnunB874MHXsLEdK8joxGHPLdjaks) 查看。
```
7. 其他用户交互
切换另一个地址，调用faucetcoin模块，向指定地址转移6个coin。
```
sui client switch --address peaceful-hiddenite
sui client call --package $PACKAGE_ID --module faucetcoin --function mint --args $FAUCETCOIN_TREASURYCAP 6 $TO_ADDRESS 

# 成功后信息如下：
Transaction Digest: 9jsJG1iJTQcR6aeBL2BygSCgHji1pdQBphvYDo6arins
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                                   │
│ Gas Owner: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                                │
│ Gas Budget: 70000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xa5e9cc06d7bfb34b49fd2f6631e0580129fa8124a36030ae5107ebf785fca37c                                    │
│  │ Version: 81313242                                                                                         │
│  │ Digest: D9oVYLicznpPbv1EmVuraRBwBcna9KGPR3hrD7htdAkL                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x5caab654b1be843d27c1fb77e7b868fa3e77cff3084110e5a35a44b93beee1d8              │ │
│ │ 1   Pure Arg: Type: u64, Value: "6"                                                                      │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    faucetcoin                                                         │                         │
│ │  │ Package:   0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    le53uBnG75NvwLKEoeQwNmgjM6arYRpV6BZBvNh/MmsWUBUchnaLbosPfPEJsNBO1Gres9SiBO2AwIZHulY0Ig==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9jsJG1iJTQcR6aeBL2BygSCgHji1pdQBphvYDo6arins                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 351                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0747b571831d1c23647df337132c544f7c0a6636ac3fe10ec1d7ce238e863e4d                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 81313243                                                                              │
│  │ Digest: Cvs48EPR7QJ6fniVrbqz98zyUi9U1EqGQUUmhdcaDhXL                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5caab654b1be843d27c1fb77e7b868fa3e77cff3084110e5a35a44b93beee1d8                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 81313243                                                                              │
│  │ Digest: 8XG64u2BgxNWXe7MtaWCrx2Rfh734C4GVVSnMcLSmthW                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa5e9cc06d7bfb34b49fd2f6631e0580129fa8124a36030ae5107ebf785fca37c                         │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ Version: 81313243                                                                              │
│  │ Digest: 2LMsYiLcU9uaWNPabgEmB9cYDp8pVdwMUKq2EWWJb7pH                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x5caab654b1be843d27c1fb77e7b868fa3e77cff3084110e5a35a44b93beee1d8                         │
│  │ Version: 81313240                                                                              │
│  │ Digest: 2W9ozYBbW8HPJiwafjBEHuB2e11vs9xSK9dzAeoQixYw                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xa5e9cc06d7bfb34b49fd2f6631e0580129fa8124a36030ae5107ebf785fca37c                         │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )  │
│  │ Version: 81313243                                                                              │
│  │ Digest: 2LMsYiLcU9uaWNPabgEmB9cYDp8pVdwMUKq2EWWJb7pH                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4195200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2753784 MIST                                                                   │
│    Non-refundable Storage Fee: 27816 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    5HS8mk6beiTZDouE62oQVoQ1wYhyK2geCufAMAdWKz6S                                                   │
│    He51stB8JppxEocdgNURkrBmxUKuDbEYdTdpH5TY7Muc                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                     │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                   │
│  ┌──                                                                                                                               │
│  │ ObjectID: 0x0747b571831d1c23647df337132c544f7c0a6636ac3fe10ec1d7ce238e863e4d                                                    │
│  │ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                                                      │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                                   │
│  │ ObjectType: 0x2::coin::Coin<0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11::faucetcoin::FAUCETCOIN>         │
│  │ Version: 81313243                                                                                                               │
│  │ Digest: Cvs48EPR7QJ6fniVrbqz98zyUi9U1EqGQUUmhdcaDhXL                                                                            │
│  └──                                                                                                                               │
│ Mutated Objects:                                                                                                                   │
│  ┌──                                                                                                                               │
│  │ ObjectID: 0x5caab654b1be843d27c1fb77e7b868fa3e77cff3084110e5a35a44b93beee1d8                                                    │
│  │ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                                                      │
│  │ Owner: Shared                                                                                                                   │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11::faucetcoin::FAUCETCOIN>  │
│  │ Version: 81313243                                                                                                               │
│  │ Digest: 8XG64u2BgxNWXe7MtaWCrx2Rfh734C4GVVSnMcLSmthW                                                                            │
│  └──                                                                                                                               │
│  ┌──                                                                                                                               │
│  │ ObjectID: 0xa5e9cc06d7bfb34b49fd2f6631e0580129fa8124a36030ae5107ebf785fca37c                                                    │
│  │ Sender: 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b                                                      │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )                                   │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                      │
│  │ Version: 81313243                                                                                                               │
│  │ Digest: 2LMsYiLcU9uaWNPabgEmB9cYDp8pVdwMUKq2EWWJb7pH                                                                            │
│  └──                                                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )         │
│  │ CoinType: 0x1d789709559d94931f760e2a821aca16192915d96446c145ea394ea478adee11::faucetcoin::FAUCETCOIN  │
│  │ Amount: 6                                                                                             │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0xf6029b82e355f627b0e3d8941d63e139c4b73b495a2017ef48aaf17cc377457b )         │
│  │ CoinType: 0x2::sui::SUI                                                                               │
│  │ Amount: -2191416                                                                                      │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯

# 通过新创建的 ObjectID: 0x0747b571831d1c23647df337132c544f7c0a6636ac3fe10ec1d7ce238e863e4d 去浏览器查询可得 hash: 9jsJG1iJTQcR6aeBL2BygSCgHji1pdQBphvYDo6arins
# 详细信息可点击 [这里](https://suiscan.xyz/mainnet/tx/9jsJG1iJTQcR6aeBL2BygSCgHji1pdQBphvYDo6arins) 查看。
```