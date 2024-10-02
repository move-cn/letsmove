#  完成NFT的上链部署
- 上链网络: 主网(mainnet)

## 需求
- 完成 NFT相关知识的学习
- 完成可以mint NFT的合约上链
- 给自己地址mint一个NFT
- mint 一个 nft 发送到地址: `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

## 任务指南

## 合约开发

```rust
module task3::nft_hero{
  use std::string::utf8;
  use sui::clock::{Self, Clock};
  use sui::display;
  use sui::package;

  public struct NFT_HERO has drop{}

  public struct MyHero has key, store {
    id: UID,
    tokenId: u64,
    hp: u64,
    mp: u64,
    xp: u64,
    level: u64,
    createTime: u64,
  }

  public struct State has key {
    id: UID,
    count: u64
  }

  fun init(witness: NFT_HERO, ctx: &mut TxContext) {
    let keys = vector[
        utf8(b"name"),
        utf8(b"image_url"),
        utf8(b"hp"),
        utf8(b"mp"),
        utf8(b"xp"),
        utf8(b"level")
    ];

    let values = vector[
        utf8(b"Bityoume NFT HERO #{tokenId}"),
        utf8(b"ipfs://QmZo2QH4dtav6HQUqztQz81sifqrp3jCcdc5jQ8axyurna"),
        utf8(b"{hp}"),
        utf8(b"{mp}"),
        utf8(b"{xp}"),
        utf8(b"{level}")
    ];

    let publisher = package::claim(witness, ctx);
    let mut display = display::new_with_fields<MyHero>(
        &publisher, keys, values, ctx);

    display::update_version(&mut display);

    transfer::public_transfer(publisher, tx_context::sender(ctx));
    transfer::public_transfer(display, tx_context::sender(ctx));

    transfer::share_object(State{
        id: object::new(ctx),
        count: 0
    });
  }

  entry public fun mint(state: &mut State, clock: &Clock, ctx: &mut TxContext) {
    let sender = tx_context::sender(ctx);
    state.count = state.count + 1;
    let nft = MyHero {
        id: object::new(ctx),
        tokenId: state.count,
        hp: 100,
        mp: 10,
        xp: 0,
        level: 1,
        createTime: clock::timestamp_ms(clock)/1000,
    };

    transfer::transfer(nft, sender);
  }

  entry public fun transfer(
    nft: MyHero, recipient: address, _: &mut TxContext
  ) {
    transfer::public_transfer(nft, recipient)
  }

  entry public fun update_hero(hero: &mut MyHero, _: &mut TxContext) {
    hero.xp = hero.xp + 1;
    if (hero.xp >= hero.level * 10) {
        hero.level = hero.level + 1;
    }
  }
}
```

## 合约部署

```bash
$ sui client publish 

UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING move_nft
Successfully verified dependencies on-chain against source.
Transaction Digest: 8z9uUGddqvqQET8nJWJ4hGc6xyDcCvzsTgb7YLaRT3M6
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                   │
│ Gas Owner: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x1ecab9900e46ae8d296a622bf75602415b6a6df841af87e0b4b3126c2e7dfca1                                    │
│  │ Version: 88578419                                                                                         │
│  │ Digest: CnDL1WZ8rC6utnoNjfNZn2xoxrTWAKzxYrtmNPkcG3Xn                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a" │ │
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
│    GnTKfqGR814X9lWZfPdRtH9IuJcG6eaOlOtqSwNhHvTupGZsb33DJDeh4T0m2v1NV8RWxYJ2KKjDk5bIx3boAw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8z9uUGddqvqQET8nJWJ4hGc6xyDcCvzsTgb7YLaRT3M6                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 366                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x07ea73d09ca3e730c26870ecb332542528ec913526b7eeeace6a920faaee054f                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: A8R2qpy5jJ9JniqaP9xgEvC8nTxdfBx5fGAVQqUWzy9n                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x88847e116a66e43e69992f9484ae859cf286e10d4f57aac2481cfa6144386f89                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 88578420                                                                              │
│  │ Digest: 6dxj79Bxb3cmeZCsy3q2TnCQx1SVWPkyYzrgcp9nHg9F                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xca167d4bbe634d15c2b82c77c4b6fbd5b6db112c2cbcbe766738f1084512d519                         │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )  │
│  │ Version: 88578420                                                                              │
│  │ Digest: sS9efgaHnNYyuuBR3ZQXij4Lj4gWLJ85kuERq9tZvQn                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe370d02c13a54389616cf4288e25f79209365688e19f8f2e1157c6bda1a5266e                         │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )  │
│  │ Version: 88578420                                                                              │
│  │ Digest: DSWNdvFTtWJCNrntEa9sujNGTVm5shTGehsfUr96jNq1                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xfaf7b6a121557f48500168d04d7b829d13a7a1c9609b086fb3c8653100e81ca5                         │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )  │
│  │ Version: 88578420                                                                              │
│  │ Digest: EzAuB3QzXPuiRo5cCDKRzbWGr7XnQSvy4B5Muc4bm8Mz                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1ecab9900e46ae8d296a622bf75602415b6a6df841af87e0b4b3126c2e7dfca1                         │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )  │
│  │ Version: 88578420                                                                              │
│  │ Digest: 6rJvb1c3kN9NatbojWq7jtfgQipXpG255B5Ps39QZs4R                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x1ecab9900e46ae8d296a622bf75602415b6a6df841af87e0b4b3126c2e7dfca1                         │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )  │
│  │ Version: 88578420                                                                              │
│  │ Digest: 6rJvb1c3kN9NatbojWq7jtfgQipXpG255B5Ps39QZs4R                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 21052000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    ENJg1c4pcwhqHVDwJYrt4cKfYqtBCjDrm87gAPRPvJpR                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                        │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                            │
│  │ EventID: 8z9uUGddqvqQET8nJWJ4hGc6xyDcCvzsTgb7YLaRT3M6:0                                                                      │
│  │ PackageID: 0x07ea73d09ca3e730c26870ecb332542528ec913526b7eeeace6a920faaee054f                                                │
│  │ Transaction Module: nft_hero                                                                                                 │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                                   │
│  │ EventType: 0x2::display::DisplayCreated<0x7ea73d09ca3e730c26870ecb332542528ec913526b7eeeace6a920faaee054f::nft_hero::MyHero> │
│  │ ParsedJSON:                                                                                                                  │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                                │
│  │   │ id │ 0xe370d02c13a54389616cf4288e25f79209365688e19f8f2e1157c6bda1a5266e │                                                │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                                │
│  └──                                                                                                                            │
│  ┌──                                                                                                                            │
│  │ EventID: 8z9uUGddqvqQET8nJWJ4hGc6xyDcCvzsTgb7YLaRT3M6:1                                                                      │
│  │ PackageID: 0x07ea73d09ca3e730c26870ecb332542528ec913526b7eeeace6a920faaee054f                                                │
│  │ Transaction Module: nft_hero                                                                                                 │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                                   │
│  │ EventType: 0x2::display::VersionUpdated<0x7ea73d09ca3e730c26870ecb332542528ec913526b7eeeace6a920faaee054f::nft_hero::MyHero> │
│  │ ParsedJSON:                                                                                                                  │
│  │   ┌─────────┬──────────┬───────┬───────────────────────────────────────────────────────┐                                     │
│  │   │ fields  │ contents │ key   │ name                                                  │                                     │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                     │
│  │   │         │          │ value │ Bityoume NFT HERO #{tokenId}                          │                                     │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                     │
│  │   │         │          │ key   │ image_url                                             │                                     │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                     │
│  │   │         │          │ value │ ipfs://QmZo2QH4dtav6HQUqztQz81sifqrp3jCcdc5jQ8axyurna │                                     │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                     │
│  │   │         │          │ key   │ hp                                                    │                                     │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                     │
│  │   │         │          │ value │ {hp}                                                  │                                     │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                     │
│  │   │         │          │ key   │ mp                                                    │                                     │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                     │
│  │   │         │          │ value │ {mp}                                                  │                                     │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                     │
│  │   │         │          │ key   │ xp                                                    │                                     │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                     │
│  │   │         │          │ value │ {xp}                                                  │                                     │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                     │
│  │   │         │          │ key   │ level                                                 │                                     │
│  │   │         │          ├───────┼───────────────────────────────────────────────────────┤                                     │
│  │   │         │          │ value │ {level}                                               │                                     │
│  │   ├─────────┼──────────┴───────┴───────────────────────────────────────────────────────┤                                     │
│  │   │ id      │ 0xe370d02c13a54389616cf4288e25f79209365688e19f8f2e1157c6bda1a5266e       │                                     │
│  │   ├─────────┼──────────────────────────────────────────────────────────────────────────┤                                     │
│  │   │ version │ 1                                                                        │                                     │
│  │   └─────────┴──────────────────────────────────────────────────────────────────────────┘                                     │
│  └──                                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x88847e116a66e43e69992f9484ae859cf286e10d4f57aac2481cfa6144386f89                                            │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                              │
│  │ Owner: Shared                                                                                                           │
│  │ ObjectType: 0x7ea73d09ca3e730c26870ecb332542528ec913526b7eeeace6a920faaee054f::nft_hero::State                          │
│  │ Version: 88578420                                                                                                       │
│  │ Digest: 6dxj79Bxb3cmeZCsy3q2TnCQx1SVWPkyYzrgcp9nHg9F                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xca167d4bbe634d15c2b82c77c4b6fbd5b6db112c2cbcbe766738f1084512d519                                            │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                              │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )                           │
│  │ ObjectType: 0x2::package::Publisher                                                                                     │
│  │ Version: 88578420                                                                                                       │
│  │ Digest: sS9efgaHnNYyuuBR3ZQXij4Lj4gWLJ85kuERq9tZvQn                                                                     │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xe370d02c13a54389616cf4288e25f79209365688e19f8f2e1157c6bda1a5266e                                            │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                              │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )                           │
│  │ ObjectType: 0x2::display::Display<0x7ea73d09ca3e730c26870ecb332542528ec913526b7eeeace6a920faaee054f::nft_hero::MyHero>  │
│  │ Version: 88578420                                                                                                       │
│  │ Digest: DSWNdvFTtWJCNrntEa9sujNGTVm5shTGehsfUr96jNq1                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xfaf7b6a121557f48500168d04d7b829d13a7a1c9609b086fb3c8653100e81ca5                                            │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                              │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )                           │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                    │
│  │ Version: 88578420                                                                                                       │
│  │ Digest: EzAuB3QzXPuiRo5cCDKRzbWGr7XnQSvy4B5Muc4bm8Mz                                                                    │
│  └──                                                                                                                       │
│ Mutated Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x1ecab9900e46ae8d296a622bf75602415b6a6df841af87e0b4b3126c2e7dfca1                                            │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                              │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                              │
│  │ Version: 88578420                                                                                                       │
│  │ Digest: 6rJvb1c3kN9NatbojWq7jtfgQipXpG255B5Ps39QZs4R                                                                    │
│  └──                                                                                                                       │
│ Published Objects:                                                                                                         │
│  ┌──                                                                                                                       │
│  │ PackageID: 0x07ea73d09ca3e730c26870ecb332542528ec913526b7eeeace6a920faaee054f                                           │
│  │ Version: 1                                                                                                              │
│  │ Digest: A8R2qpy5jJ9JniqaP9xgEvC8nTxdfBx5fGAVQqUWzy9n                                                                    │
│  │ Modules: nft_hero                                                                                                       │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -20823880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## 铸造NFT
```bash

export PACKAGE_ID=0x07ea73d09ca3e730c26870ecb332542528ec913526b7eeeace6a920faaee054f

export STATE=0x88847e116a66e43e69992f9484ae859cf286e10d4f57aac2481cfa6144386f89

sui client call --package $PACKAGE_ID --module nft_hero --function mint --args $STATE 0x6 --gas-budget 5000000

│ Created Objects:                                                                                    │
│  ┌──                                                                                                │
│  │ ObjectID: 0x8c77a563fdae52a57bf851f19027b344231406e024062c47115bf4a8f404bf24                     │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                       │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )    │
│  │ ObjectType: 0x7ea73d09ca3e730c26870ecb332542528ec913526b7eeeace6a920faaee054f::nft_hero::MyHero  │
│  │ Version: 88578421                                                                                │
│  │ Digest: Ddv8MWLS6dfGeedskFHoD6mDxaKJTYjki21Gg9MrFmAt                                             │
│  └──    

$ export NFT=0x8c77a563fdae52a57bf851f19027b344231406e024062c47115bf4a8f404bf24

$ sui client object $NFT --json
{
  "objectId": "0x8c77a563fdae52a57bf851f19027b344231406e024062c47115bf4a8f404bf24",
  "version": "88578421",
  "digest": "Ddv8MWLS6dfGeedskFHoD6mDxaKJTYjki21Gg9MrFmAt",
  "type": "0x07ea73d09ca3e730c26870ecb332542528ec913526b7eeeace6a920faaee054f::nft_hero::MyHero",
  "owner": {
    "AddressOwner": "0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a"
  },
  "previousTransaction": "FVmwyJwTmvPhf22S7mLKES2x6R2hf8X2yV9bMLwmVSjL",
  "storageRebate": "1664400",
  "content": {
    "dataType": "moveObject",
    "type": "0x07ea73d09ca3e730c26870ecb332542528ec913526b7eeeace6a920faaee054f::nft_hero::MyHero",
    "hasPublicTransfer": true,
    "fields": {
      "createTime": "1713025990",
      "hp": "100",
      "id": {
        "id": "0x8c77a563fdae52a57bf851f19027b344231406e024062c47115bf4a8f404bf24"
      },
      "level": "1",
      "mp": "10",
      "tokenId": "1",
      "xp": "0"
    }
  }
}
```

## 转移NFT
```bash
$ export RECIPIENT=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

$ sui client call --package $PACKAGE_ID --module nft_hero --function transfer --args $NFT $RECIPIENT --gas-budget 5000000
Transaction Digest: 8Ai6d92omEcxizeTdbNm9UVPaKFbRxyu2u4CsF3EHKdu

$ sui client object $NFT --json
{
  "objectId": "0x8c77a563fdae52a57bf851f19027b344231406e024062c47115bf4a8f404bf24",
  "version": "88578422",
  "digest": "J7oiMWfTFScQYGDN5axHMtzM2MccaM4BDuUebn83EmMB",
  "type": "0x07ea73d09ca3e730c26870ecb332542528ec913526b7eeeace6a920faaee054f::nft_hero::MyHero",
  "owner": {
    "AddressOwner": "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2"
  },
  "previousTransaction": "8Ai6d92omEcxizeTdbNm9UVPaKFbRxyu2u4CsF3EHKdu",
  "storageRebate": "1664400",
  "content": {
    "dataType": "moveObject",
    "type": "0x07ea73d09ca3e730c26870ecb332542528ec913526b7eeeace6a920faaee054f::nft_hero::MyHero",
    "hasPublicTransfer": true,
    "fields": {
      "createTime": "1713025990",
      "hp": "100",
      "id": {
        "id": "0x8c77a563fdae52a57bf851f19027b344231406e024062c47115bf4a8f404bf24"
      },
      "level": "1",
      "mp": "10",
      "tokenId": "1",
      "xp": "0"
    }
  }
}
```