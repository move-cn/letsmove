#  完成两个Coin合约的上链部署
- 上链网络: mainnet

## 需求
- 完成 Coin相关知识的学习
- 完成 `My Coin` 的学习并部署主网
- 完成 `Faucet Coin` 的学习并部署主网
- 提交 `My Coin` 和 `Faucet Coin` 合约发布`package id`
- 发送 `My Coin`  给地址 `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

## 任务指南

## 合约开发
### my_coin
```rust
module task2::rzx_token {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct RZX_TOKEN has drop {}

    #[allow(unused_function)]
    fun init(witness: RZX_TOKEN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = 
            coin::create_currency<RZX_TOKEN>(witness, 2, b"RZX-sym", b"RZX-name", 
            b"RZX-desp", option::none(), ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<RZX_TOKEN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public fun burn(treasury_cap: &mut TreasuryCap<RZX_TOKEN>, coin: Coin<RZX_TOKEN>) {
        coin::burn(treasury_cap, coin);
    }
}
```

### faucet_coin
```rust
module task2::rzx_faucet_coin{
    use sui::coin::{Self, TreasuryCap};
    use sui::balance::{Self, Balance};

    public struct RZX_FAUCET_COIN has drop {}

    public struct Wallet has key {
        id: UID,
        coin: Balance<RZX_FAUCET_COIN >
    }

    #[allow(unused_function)]
    fun init(witness: RZX_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = 
            coin::create_currency<RZX_FAUCET_COIN>(witness, 2, b"RZX-sym", b"RZX-name", 
            b"RZX-desp", option::none(), ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));

        let wallet = Wallet {
            id: object::new(ctx),
            coin: balance::zero()
        };
        transfer::share_object(wallet);
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<RZX_FAUCET_COIN>,  wallet: &mut Wallet, 
        amount: u64, ctx: &mut TxContext
    ) {
        let mint_coin = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut wallet.coin, coin::into_balance(mint_coin));
    }

    public entry fun faucet(wallet: &mut Wallet, ctx: &mut TxContext) {
        let take_coin = coin::take(&mut wallet.coin, 10000, ctx);
        transfer::public_transfer(take_coin, tx_context::sender(ctx));
    }
}
```

## 切换到主网
```bash
$ sui client switch --env mainnet
Active environment switched to [mainnet]
```

## 合约发布
```bash
$ sui client publish 
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING move_coin
Successfully verified dependencies on-chain against source.
Transaction Digest: HqauK2kKY3icMZxVKkyPKh52sP2rzBauMG2jdV1GLcBU
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
│  │ Version: 88578410                                                                                         │
│  │ Digest: Exno4P6nbaaPDffmiYpTp2YRMpPbCphdfZBCdEXnyA4w                                                      │
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
│    LussjjvoAkxF01z5kQU1nrdf2CU9i5i3lEAKWNVjH6I8z4s/8NMQh/R8/mDR9MfAPJyJUZmMw4t9AUEJLEVjCQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HqauK2kKY3icMZxVKkyPKh52sP2rzBauMG2jdV1GLcBU                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 366                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x15bfcb7d58b6949e174f128e352c1d3cc65bc5cddf9586adcb7255b17cc5cbe0                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 88578411                                                                              │
│  │ Digest: 8Hym5sDwcg7uG7hu2sAex9GiJhTRcubXGnZsR828ZAr                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x24242a24cb97c66501d7c9f817cd63a28001b54d83d48be2953045ed151bd104                         │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )  │
│  │ Version: 88578411                                                                              │
│  │ Digest: BRfmZx5qmPZxuLhztQAbPzaD1YStvWWaLBypFxJaMz3P                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x4baaeb6b4f64c7b989f22781309cd9b31fc1b1b3e44395c8b435027d79ef1b14                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: G7X5dLvYugAaEByhD41EVeKRNcCzSwSzvL18pexxYFew                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x69424c85f96f615e17b28b80d1b220bcfbe7be5dc06e2207e1c782976881bd00                         │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )  │
│  │ Version: 88578411                                                                              │
│  │ Digest: 7KvwgGiyMvvDmfYytrEWYqscRydo4eK2uPFAYfV8fFC9                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x7fc8ff339fa6f605f70826804667de9bd7dc076d1a42d6adacf7b65072b49355                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 88578411                                                                              │
│  │ Digest: BZwbgqesWnUNvCgUCBtUEYRCT24VTCfy2doKZKaF1zo8                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x924eb904444d23eb2fc7690a491601d9c2074fb4dd3b778ff376503bc39e6213                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 88578411                                                                              │
│  │ Digest: DiXdcvcbrhfMKNYcr3rdKU12JJT2YHW8hs5EkqQu4m2s                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd127c2e6c2105bb1c69ec79de4ceedb99f93140426968d89337e697bf7dc4385                         │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )  │
│  │ Version: 88578411                                                                              │
│  │ Digest: 9HqiJog6R3DnNaqpHWFktgJZ3PbPv3aoHTRhAcS29128                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1ecab9900e46ae8d296a622bf75602415b6a6df841af87e0b4b3126c2e7dfca1                         │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )  │
│  │ Version: 88578411                                                                              │
│  │ Digest: ba7ETjhy14WEMkenek6Ftq2X1xPukndJQyDhZ1iEniW                                            │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x1ecab9900e46ae8d296a622bf75602415b6a6df841af87e0b4b3126c2e7dfca1                         │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )  │
│  │ Version: 88578411                                                                              │
│  │ Digest: ba7ETjhy14WEMkenek6Ftq2X1xPukndJQyDhZ1iEniW                                            │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 27542400 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    C4CcVZJgbiEfXeyFP7PbMv2rgresNyMTBYqqQbmvFPZD                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                              │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0x15bfcb7d58b6949e174f128e352c1d3cc65bc5cddf9586adcb7255b17cc5cbe0                                                               │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                                                 │
│  │ Owner: Shared                                                                                                                              │
│  │ ObjectType: 0x4baaeb6b4f64c7b989f22781309cd9b31fc1b1b3e44395c8b435027d79ef1b14::rzx_faucet_coin::Wallet                                    │
│  │ Version: 88578411                                                                                                                          │
│  │ Digest: 8Hym5sDwcg7uG7hu2sAex9GiJhTRcubXGnZsR828ZAr                                                                                        │
│  └──                                                                                                                                          │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0x24242a24cb97c66501d7c9f817cd63a28001b54d83d48be2953045ed151bd104                                                               │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                                                 │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )                                              │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x4baaeb6b4f64c7b989f22781309cd9b31fc1b1b3e44395c8b435027d79ef1b14::rzx_token::RZX_TOKEN>               │
│  │ Version: 88578411                                                                                                                          │
│  │ Digest: BRfmZx5qmPZxuLhztQAbPzaD1YStvWWaLBypFxJaMz3P                                                                                       │
│  └──                                                                                                                                          │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0x69424c85f96f615e17b28b80d1b220bcfbe7be5dc06e2207e1c782976881bd00                                                               │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                                                 │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )                                              │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x4baaeb6b4f64c7b989f22781309cd9b31fc1b1b3e44395c8b435027d79ef1b14::rzx_faucet_coin::RZX_FAUCET_COIN>   │
│  │ Version: 88578411                                                                                                                          │
│  │ Digest: 7KvwgGiyMvvDmfYytrEWYqscRydo4eK2uPFAYfV8fFC9                                                                                       │
│  └──                                                                                                                                          │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0x7fc8ff339fa6f605f70826804667de9bd7dc076d1a42d6adacf7b65072b49355                                                               │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                                                 │
│  │ Owner: Immutable                                                                                                                           │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x4baaeb6b4f64c7b989f22781309cd9b31fc1b1b3e44395c8b435027d79ef1b14::rzx_faucet_coin::RZX_FAUCET_COIN>  │
│  │ Version: 88578411                                                                                                                          │
│  │ Digest: BZwbgqesWnUNvCgUCBtUEYRCT24VTCfy2doKZKaF1zo8                                                                                       │
│  └──                                                                                                                                          │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0x924eb904444d23eb2fc7690a491601d9c2074fb4dd3b778ff376503bc39e6213                                                               │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                                                 │
│  │ Owner: Immutable                                                                                                                           │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x4baaeb6b4f64c7b989f22781309cd9b31fc1b1b3e44395c8b435027d79ef1b14::rzx_token::RZX_TOKEN>              │
│  │ Version: 88578411                                                                                                                          │
│  │ Digest: DiXdcvcbrhfMKNYcr3rdKU12JJT2YHW8hs5EkqQu4m2s                                                                                       │
│  └──                                                                                                                                          │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0xd127c2e6c2105bb1c69ec79de4ceedb99f93140426968d89337e697bf7dc4385                                                               │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                                                 │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )                                              │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                                       │
│  │ Version: 88578411                                                                                                                          │
│  │ Digest: 9HqiJog6R3DnNaqpHWFktgJZ3PbPv3aoHTRhAcS29128                                                                                       │
│  └──                                                                                                                                          │
│ Mutated Objects:                                                                                                                              │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0x1ecab9900e46ae8d296a622bf75602415b6a6df841af87e0b4b3126c2e7dfca1                                                               │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                                                 │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )                                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                 │
│  │ Version: 88578411                                                                                                                          │
│  │ Digest: ba7ETjhy14WEMkenek6Ftq2X1xPukndJQyDhZ1iEniW                                                                                        │
│  └──                                                                                                                                          │
│ Published Objects:                                                                                                                            │
│  ┌──                                                                                                                                          │
│  │ PackageID: 0x4baaeb6b4f64c7b989f22781309cd9b31fc1b1b3e44395c8b435027d79ef1b14                                                              │
│  │ Version: 1                                                                                                                                 │
│  │ Digest: G7X5dLvYugAaEByhD41EVeKRNcCzSwSzvL18pexxYFew                                                                                       │
│  │ Modules: rzx_faucet_coin, rzx_token                                                                                                        │
│  └──                                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -27314280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## 铸造 `My Coin`
```bash
export PACKAGE_ID=0x4baaeb6b4f64c7b989f22781309cd9b31fc1b1b3e44395c8b435027d79ef1b14
export TREASURY_CAP=0x24242a24cb97c66501d7c9f817cd63a28001b54d83d48be2953045ed151bd104
export AMOUNT=100000000000
export RECIPIENT=0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a
sui client call --function mint --package $PACKAGE_ID --module rzx_token --args $TREASURY_CAP $AMOUNT $RECIPIENT --gas-budget 10000000

│ Created Objects:                                                                                                                 │
│  ┌──                                                                                                                             │
│  │ ObjectID: 0x75b7d9cc81fda846fc8ae5edc5efc6bdbd0da595103ed5372a1d57656cc1b49d                                                  │
│  │ Sender: 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a                                                    │
│  │ Owner: Account Address ( 0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a )                                 │
│  │ ObjectType: 0x2::coin::Coin<0x4baaeb6b4f64c7b989f22781309cd9b31fc1b1b3e44395c8b435027d79ef1b14::rzx_token::RZX_TOKEN>         │
│  │ Version: 88578412                                                                                                             │
│  │ Digest: dzicgXrP2WiCW2o3upbKnzrNi2dQvfQ9cQ5Gq3TkFUZ                                                                           │
│  └──                                                                                                                             │
```

## 查看铸造的 `My Coin`
```bash
$ export COIN=0x75b7d9cc81fda846fc8ae5edc5efc6bdbd0da595103ed5372a1d57656cc1b49d 
$ sui client object $COIN --json
{
  "objectId": "0x75b7d9cc81fda846fc8ae5edc5efc6bdbd0da595103ed5372a1d57656cc1b49d",
  "version": "88578412",
  "digest": "dzicgXrP2WiCW2o3upbKnzrNi2dQvfQ9cQ5Gq3TkFUZ",
  "type": "0x2::coin::Coin<0x4baaeb6b4f64c7b989f22781309cd9b31fc1b1b3e44395c8b435027d79ef1b14::rzx_token::RZX_TOKEN>",
  "owner": {
    "AddressOwner": "0x5c5882d73a6e5b6ea1743fb028eff5e0d7cc8b7ae123d27856c5fe666d91569a"
  },
  "previousTransaction": "2exAiZUYDnGq6nzvAp8tHP38t44rkhA1wLkgNw9wKGFL",
  "storageRebate": "1398400",
  "content": {
    "dataType": "moveObject",
    "type": "0x2::coin::Coin<0x4baaeb6b4f64c7b989f22781309cd9b31fc1b1b3e44395c8b435027d79ef1b14::rzx_token::RZX_TOKEN>",
    "hasPublicTransfer": true,
    "fields": {
      "balance": "100000000000",
      "id": {
        "id": "0x75b7d9cc81fda846fc8ae5edc5efc6bdbd0da595103ed5372a1d57656cc1b49d"
      }
    }
  }
}

$ sui client balance
╭─────────────────────────────────────────────────╮
│ Balance of coins owned by this address          │
├─────────────────────────────────────────────────┤
│ ╭─────────────────────────────────────────────╮ │
│ │ coin      balance (raw)  balance            │ │
│ ├─────────────────────────────────────────────┤ │
│ │ Sui       504106892      0.50 SUI           │ │
│ │ RZX-name  100000000000   1000.00M RZX-sym   │ │
│ ╰─────────────────────────────────────────────╯ │
```

## 拆分 `My Coin`
```bash
sui client split-coin --coin-id $COIN --amounts 1000 2000 

export COIN1=0x1f46de45bd8f75d7eab6349afc048e85f28c0b1e31c3add617ae361f8bbcc41f
export COIN2=0xca32f8ef3814d97f64b1d55743adec35496d536297260712ec3916c061bf9e1e
```

## 发送 `My Coin`  

> 将前面拆分出的COIN1，发送给地址 `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

```bash
$ export RECIPIENT=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
$ sui client transfer --to $RECIPIENT --object-id $COIN1 --gas-budget 10000000
Transaction Digest: 7kcTWkQAnDcz6bDqezXAjn79XPqjLgpPYhZ6YMLuVpru
```
