#  实现一个最简单的swap
- 上链网络: 主网(mainnet)

 antigone4224_coin packageid:0xc570d3d2910473578c2a268cbeab362253613d5c29c92904d851cbceed5c89ac

TreasuryCap:0xc2ef5016570979452996020fd231df6369761a91d916f38ec3446b6018dc9b28

antigone4224_faucet 

treasuryCap:0x26a3eda372c87b744456952d1167347c5549deb356487fb33f50c8000a7a8d36

packageid:0x184fdb38d567d335ac518b06004b33f48ae97e1eceeac467c35027d0437922e8

swap合约代码：

```
module antigone4224::antigone4224 {
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};
    use sui::object::{Self, UID, ID};
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};
    use sui::table::{Self, Table};
    use sui::pay;

    use std::vector;

    ///When Coin is zero
    const ErrZeroAmount: u64 = 1001;
    ///Insufficient Coin X in pool
    const ErrNotEnoughXInPool: u64 = 1002;
    ///Insufficient Coin Y in pool
    const ErrNotEnoughYInPool: u64 = 1003;
    ///When vector length is not 2
    const ErrInvalidVecotrType: u64 = 1004;
    ///When balance in LP doesn't match summary in vector
    const ErrBalanceNotMatch: u64 = 1005;
    ///When balance in LP is not sufficient to withdraw
    const ErrNotEnoughBalanceLP: u64 = 1006;
    ///When withdraw failed
    const ErrRemoveFailed: u64 = 1011;
    ///When Liquidity provider vector is empty
    const ErrEmptyLPVector: u64 = 1012;

    ///Liquidity provider, parameter 'X' and 'Y'
    ///are coins held in the pool.
    public struct LP<phantom X, phantom Y> has drop {}

    /// Pool with exchange
    public struct Pool<phantom X, phantom Y> has key {
        id: UID,
        coin_x: Balance<X>,
        coin_y: Balance<Y>,
        lp_supply: Supply<LP<X, Y>>
    }

    ///pocket to keep the Liquidity provider
    ///and balance of Coin X/Y
    public struct Pocket has key, store {
        id: UID,
        table: Table<ID, vector<u64>>
    }

    ///create a new pool
    public fun new_pool<X, Y>(ctx: &mut TxContext) {
        let new_pool = Pool<X, Y> {
            id: object::new(ctx),
            coin_x: balance::zero(),
            coin_y: balance::zero(),
            lp_supply: balance::create_supply<LP<X, Y>>(LP {})
        };
        transfer::share_object(new_pool);
    }

    ///Add liquidity into pool, exchange rate is 1 between X and Y
    public fun add_liquidity<X, Y>(pool: &mut Pool<X, Y>,
                                   coin_x: Coin<X>,
                                   coin_y: Coin<Y>,
                                   ctx: &mut TxContext): (Coin<LP<X, Y>>, vector<u64>) {
        let coin_x_value = coin::value(&coin_x);
        let coin_y_value = coin::value(&coin_y);
        assert!(coin_x_value > 0 && coin_y_value > 0, ErrZeroAmount);
        coin::put(&mut pool.coin_x, coin_x);
        coin::put(&mut pool.coin_y, coin_y);
        let lp_bal = balance::increase_supply(&mut pool.lp_supply, coin_x_value + coin_y_value);
        let mut vec_value = vector::empty<u64>();
        vector::push_back(&mut vec_value, coin_x_value);
        vector::push_back(&mut vec_value, coin_y_value);
        (coin::from_balance(lp_bal, ctx), vec_value)
    }

    ///Remove the liquidity and balance from pool
    public fun remove_liquidity<X, Y>(pool: &mut Pool<X, Y>,
                                      lp: Coin<LP<X, Y>>,
                                      mut vec: vector<u64>,
                                      ctx: &mut TxContext): (Coin<X>, Coin<Y>) {
        assert!(vector::length(&vec) == 2, ErrInvalidVecotrType);
        let lp_balance_value = coin::value(&lp);
        let coin_x_out = *vector::borrow(&mut vec, 0);
        let coin_y_out = *vector::borrow(&mut vec, 1);
        assert!(lp_balance_value == coin_x_out + coin_y_out, ErrBalanceNotMatch);
        assert!(balance::value(&mut pool.coin_x) > coin_x_out, ErrNotEnoughXInPool);
        assert!(balance::value(&mut pool.coin_y) > coin_y_out, ErrNotEnoughYInPool);
        balance::decrease_supply(&mut pool.lp_supply, coin::into_balance(lp));
        (
            coin::take(&mut pool.coin_x, coin_x_out, ctx),
            coin::take(&mut pool.coin_y, coin_y_out, ctx)
        )
    }

    ///withdraw coin from balance
    public fun withdraw<X, Y>(pool: &mut Pool<X, Y>,
                              lp: &mut Coin<LP<X, Y>>,
                              vec: &mut vector<u64>,
                              coin_x_out: u64,
                              coin_y_out: u64,
                              ctx: &mut TxContext): (Coin<X>, Coin<Y>) {
        assert!(balance::value(&mut pool.coin_x) > coin_x_out, ErrNotEnoughXInPool);
        assert!(balance::value(&mut pool.coin_y) > coin_y_out, ErrNotEnoughYInPool);
        assert!(coin::value(lp) >= coin_x_out + coin_y_out, ErrNotEnoughBalanceLP);
        let coin_x_balance = vector::borrow_mut(vec, 0);
        *coin_x_balance = *coin_x_balance - coin_x_out;
        let coin_y_balance = vector::borrow_mut(vec, 1);
        *coin_y_balance = *coin_y_balance - coin_y_out;
        let lp_split = coin::split(lp, coin_x_out + coin_y_out, ctx);
        balance::decrease_supply(&mut pool.lp_supply, coin::into_balance(lp_split));
        (
            coin::take(&mut pool.coin_x, coin_x_out, ctx),
            coin::take(&mut pool.coin_y, coin_y_out, ctx)
        )
    }

    ///swap Coin X to Y, return Coin Y
    public fun swap_x_outto_y<X, Y>(pool: &mut Pool<X, Y>,
                                    paid_in: Coin<X>,
                                    ctx: &mut TxContext): Coin<Y> {
        let paid_value = coin::value(&paid_in);
        coin::put(&mut pool.coin_x, paid_in);
        assert!(paid_value < balance::value(&mut pool.coin_y), ErrNotEnoughYInPool);
        coin::take(&mut pool.coin_y, paid_value, ctx)
    }

    ///swap Coin Y to X, return Coin X
    public fun swap_y_into_x<X, Y>(pool: &mut Pool<X, Y>,
                                   paid_in: Coin<Y>,
                                   ctx: &mut TxContext): Coin<X> {
        let paid_value = coin::value(&paid_in);
        coin::put(&mut pool.coin_y, paid_in);
        assert!(paid_value < balance::value(&mut pool.coin_x), ErrNotEnoughXInPool);
        coin::take(&mut pool.coin_x, paid_value, ctx)
    }

    ///entry function to create new pocket
    public entry fun create_pocket(ctx: &mut TxContext) {
        let pocket = Pocket {
            id: object::new(ctx),
            table: table::new<ID, vector<u64>>(ctx)
        };
        transfer::public_transfer(pocket, sender(ctx));
    }

    ///entry function to generate new pool
    public entry fun generate_pool<X, Y>(ctx: &mut TxContext) {
        new_pool<X, Y>(ctx);
    }

    ///entry function to deposit total Coin X and Y to pool
    public entry fun deposit_totally<X, Y>(pool: &mut Pool<X, Y>,
                                           coin_x: Coin<X>,
                                           coin_y: Coin<Y>,
                                           pocket: &mut Pocket,
                                           ctx: &mut TxContext) {
        let (lp, vec) = add_liquidity(pool, coin_x, coin_y, ctx);
        let lp_id = object::id(&lp);
        table::add(&mut pocket.table, lp_id, vec);
        transfer::public_transfer(lp, sender(ctx));
    }

    ///entry function to deposit part of Coin X and Y to pool
    public entry fun deposit_partly<X, Y>(pool: &mut Pool<X, Y>,
                                          coin_x_vec: vector<Coin<X>>,
                                          coin_y_vec: vector<Coin<Y>>,
                                          coin_x_amt: u64,
                                          coin_y_amt: u64,
                                          pocket: &mut Pocket,
                                          ctx: &mut TxContext) {
        let mut coin_x_new = coin::zero<X>(ctx);
        let mut coin_y_new = coin::zero<Y>(ctx);
        pay::join_vec(&mut coin_x_new, coin_x_vec);
        pay::join_vec(&mut coin_y_new, coin_y_vec);
        let coin_x_in = coin::split(&mut coin_x_new, coin_x_amt, ctx);
        let coin_y_in = coin::split(&mut coin_y_new, coin_y_amt, ctx);
        let (lp, vec) = add_liquidity(pool, coin_x_in, coin_y_in, ctx);
        let lp_id = object::id(&lp);
        table::add(&mut pocket.table, lp_id, vec);
        transfer::public_transfer(lp, sender(ctx));
        let sender_address = sender(ctx);
        transfer::public_transfer(coin_x_new, sender_address);
        transfer::public_transfer(coin_y_new, sender_address);
    }

    ///entry function Withdraw all balance in Liquidity provider from pool
    public entry fun remove_liquidity_totally<X, Y>(pool: &mut Pool<X, Y>,
                                                    lp: Coin<LP<X, Y>>,
                                                    pocket: &mut Pocket,
                                                    ctx: &mut TxContext) {
        let lp_id = object::id(&lp);
        let vec = *table::borrow(&mut pocket.table, lp_id);
        let (coin_x_out, coin_y_out) = remove_liquidity(pool, lp, vec, ctx);
        assert!(coin::value(&coin_x_out) > 0 && coin::value(&coin_y_out) > 0, ErrRemoveFailed);
        let mut vec_out = table::remove(&mut pocket.table, lp_id);
        vector::remove(&mut vec_out, 0);
        vector::remove(&mut vec_out, 0);
        let sender_address = sender(ctx);
        transfer::public_transfer(coin_x_out, sender_address);
        transfer::public_transfer(coin_y_out, sender_address);
    }

    ///combine multiple liquidity providers
    public fun join_lp_vec<X, Y>(mut lp_vec: vector<Coin<LP<X, Y>>>,
                                 pocket: &mut Pocket,
                                 ctx: &mut TxContext): (Coin<LP<X, Y>>, vector<u64>) {
        let mut idx = 0;
        let vec_length = vector::length(&lp_vec);
        assert!(vec_length > 0, ErrEmptyLPVector);
        let (mut combined_lp, mut combined_vec, mut combined_x_amt, mut combined_y_amt) =
            (coin::zero<LP<X, Y>>(ctx), vector::empty<u64>(), (0 as u64), (0 as u64));
        while (idx < vec_length) {
            let lp_out = vector::pop_back(&mut lp_vec);
            let lp_id = object::id(&lp_out);
            let mut vec_out = table::remove(&mut pocket.table, lp_id);
            combined_y_amt = combined_y_amt + vector::pop_back(&mut vec_out);
            combined_x_amt = combined_x_amt + vector::pop_back(&mut vec_out);
            vector::destroy_empty(vec_out);
            pay::join(&mut combined_lp, lp_out);
            idx = idx + 1;
        };
        vector::destroy_empty(lp_vec);
        vector::push_back(&mut combined_vec, combined_x_amt);
        vector::push_back(&mut combined_vec, combined_y_amt);
        (combined_lp, combined_vec)
    }

    ///Withdraw part of balance in liquidity provider from pool
    public entry fun withdraw_out<X, Y>(pool: &mut Pool<X, Y>,
                                        lp_vec: vector<Coin<LP<X, Y>>>,
                                        coin_x_amt: u64,
                                        coin_y_amt: u64,
                                        pocket: &mut Pocket,
                                        ctx: &mut TxContext) {
        let (mut combined_lp, mut combined_vec) = join_lp_vec(lp_vec, pocket, ctx);
        let (withdraw_coin_x, withdraw_coin_y) =
            withdraw(pool, &mut combined_lp, &mut combined_vec, coin_x_amt, coin_y_amt, ctx);
        let combined_lp_id = object::id(&combined_lp);
        table::add(&mut pocket.table, combined_lp_id, combined_vec);
        let sender_address = sender(ctx);
        transfer::public_transfer(withdraw_coin_x, sender_address);
        transfer::public_transfer(withdraw_coin_y, sender_address);
        transfer::public_transfer(combined_lp, sender_address);
    }

    public entry fun swap_x_to_y<X, Y>(pool: &mut Pool<X, Y>,
                                       coin_x_vec: vector<Coin<X>>,
                                       amount: u64,
                                       ctx: &mut TxContext) {
        let mut coin_x = coin::zero<X>(ctx);
        pay::join_vec<X>(&mut coin_x, coin_x_vec);
        let coin_x_in = coin::split(&mut coin_x, amount, ctx);
        let coin_y_out = swap_x_outto_y(pool, coin_x_in, ctx);
        let sender_addres = sender(ctx);
        transfer::public_transfer(coin_x, sender_addres);
        transfer::public_transfer(coin_y_out, sender_addres);
    }

    public entry fun swap_y_to_x<X, Y>(pool: &mut Pool<X, Y>,
                                       coin_y_vec: vector<Coin<Y>>,
                                       amount: u64,
                                       ctx: &mut TxContext) {
        let mut coin_y = coin::zero<Y>(ctx);
        pay::join_vec<Y>(&mut coin_y, coin_y_vec);
        let mut coin_y_in = coin::split(&mut coin_y, amount, ctx);
        let mut coin_x_out = swap_y_into_x(pool, coin_y_in, ctx);
        let sender_addres = sender(ctx);
        transfer::public_transfer(coin_x_out, sender_addres);
        transfer::public_transfer(coin_y, sender_addres);
    }
}
```

发布：

```
Successfully verified dependencies on-chain against source.
Transaction Digest: 2mv9maSKR4xLK6ACCAUDxpC37L7HUg5jbQARbWYtPixx
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data
           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
           │
│ Gas Owner: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
           │
│ Gas Budget: 500000000 MIST
           │
│ Gas Price: 751 MIST
           │
│ Gas Payment:
           │
│  ┌──
           │
│  │ ID: 0x3fa1fafc8f6d6ede16e1f6e256aab487418a39bf31cf379c7343852df8cd5960
           │
│  │ Version: 98937768
           │
│  │ Digest: 5DYPUKpqokpqWo28R749fPyXTs3fQBA1EG3zdo718Wxb
           │
│  └──
           │
│
           │
│ Transaction Kind: Programmable
           │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects
         │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮
           │
│ │ Commands                                                                │
           │
│ ├─────────────────────────────────────────────────────────────────────────┤
           │
│ │ 0  Publish:                                                             │
           │
│ │  ┌                                                                      │
           │
│ │  │ Dependencies:                                                        │
           │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │
           │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │
           │
│ │  └                                                                      │
           │
│ │                                                                         │
           │
│ │ 1  TransferObjects:                                                     │
           │
│ │  ┌                                                                      │
           │
│ │  │ Arguments:                                                           │
           │
│ │  │   Result 0                                                           │
           │
│ │  │ Address: Input  0                                                    │
           │
│ │  └                                                                      │
           │
│ ╰─────────────────────────────────────────────────────────────────────────╯
           │
│
           │
│ Signatures:
           │
│    GP3rnZaP/QOyzIKIi7QRGMT6VtjuxbjEhpmA5Yi8BZFveI+IV0SoxQemF0OZRwquMI6ouOygOYRe4PDwsUfQAg==                  │
│
           │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects
│
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2mv9maSKR4xLK6ACCAUDxpC37L7HUg5jbQARbWYtPixx
│
│ Status: Success
│
│ Executed Epoch: 384
│
│
│
│ Created Objects:
│
│  ┌──
│
│  │ ID: 0x636b50bf839cee95e63c92c2f86fb427e8630a66d9c43fd7c638d5e3d4a7d2c0
│
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 98937769
│
│  │ Digest: 9mUAFVbQrFdVLjg1U2fRNDfKKRPwETq1A6M66WQb3ncX
│
│  └──
│
│  ┌──
│
│  │ ID: 0xc37dfc2d205c0d967932f0e1c9e3410507e413a3d80147d8d3e57503872cfb60
│
│  │ Owner: Immutable
│
│  │ Version: 1
│
│  │ Digest: Fh4aKZHdCuqkWMMtW3MmLXf3pA53MGFBrzRwnovzA2nC
│
│  └──
│
│ Mutated Objects:
│
│  ┌──
│
│  │ ID: 0x3fa1fafc8f6d6ede16e1f6e256aab487418a39bf31cf379c7343852df8cd5960
│
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 98937769
│
│  │ Digest: 4j4ezhKAax3kgQsTqyAZaWz48tmFPfxsJbrs1ui9JBTu
│
│  └──
│
│ Gas Object:
│
│  ┌──
│
│  │ ID: 0x3fa1fafc8f6d6ede16e1f6e256aab487418a39bf31cf379c7343852df8cd5960
│
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 98937769
│
│  │ Digest: 4j4ezhKAax3kgQsTqyAZaWz48tmFPfxsJbrs1ui9JBTu
│
│  └──
│
│ Gas Cost Summary:
│
│    Storage Cost: 31099200 MIST
│
│    Computation Cost: 751000 MIST
│
│    Storage Rebate: 978120 MIST
│
│    Non-refundable Storage Fee: 9880 MIST
│
│
│
│ Transaction Dependencies:
│
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN
│
│    6tgMuTffrzA7R39uimXuopnccvmhF1dLRDp7MezHpJQH
│
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x636b50bf839cee95e63c92c2f86fb427e8630a66d9c43fd7c638d5e3d4a7d2c0                  │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                    │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 98937769                                                                             │
│  │ Digest: 9mUAFVbQrFdVLjg1U2fRNDfKKRPwETq1A6M66WQb3ncX                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x3fa1fafc8f6d6ede16e1f6e256aab487418a39bf31cf379c7343852df8cd5960                  │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                    │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 98937769                                                                             │
│  │ Digest: 4j4ezhKAax3kgQsTqyAZaWz48tmFPfxsJbrs1ui9JBTu                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xc37dfc2d205c0d967932f0e1c9e3410507e413a3d80147d8d3e57503872cfb60                 │
│  │ Version: 1                                                                                    │
│  │ Digest: Fh4aKZHdCuqkWMMtW3MmLXf3pA53MGFBrzRwnovzA2nC                                          │
│  │ Modules: antigone4224                                                                         │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes
│
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──
│
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ CoinType: 0x2::sui::SUI
│
│  │ Amount: -30872080

```

packageid:0xc37dfc2d205c0d967932f0e1c9e3410507e413a3d80147d8d3e57503872cfb60

testscripts:

```
# coin Package, CNYA and CNYW and TreasuryCaps
$ ACPKG="0xc570d3d2910473578c2a268cbeab362253613d5c29c92904d851cbceed5c89ac"
ACFPKG="0x184fdb38d567d335ac518b06004b33f48ae97e1eceeac467c35027d0437922e8"
ACCAP="0xc2ef5016570979452996020fd231df6369761a91d916f38ec3446b6018dc9b28"
ACFCAP="0x26a3eda372c87b744456952d1167347c5549deb356487fb33f50c8000a7a8d36"

# mint CNYA
# sui 0.20.0 defect, need pass value as string to u64 in format of \"1\"
# waiting to MystenLab to resolve
$ sui client call --package $ACPKG \
                --module antigone4224c \
                --function mint \
                --gas-budget 500000000 \
                --args $ACCAP  10000 \"0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8\"
# mint ACF
$ sui client call --package $ACFPKG \
                --module antigone4224Faucet \
                --function mint \
                --gas-budget 500000000 \
                --args $ACFAP    10000 \"0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8\"

# bank package
$ BANKPKG="0xc37dfc2d205c0d967932f0e1c9e3410507e413a3d80147d8d3e57503872cfb60"

# Create Pocket to store liquidity providers
$ sui client call --package $BANKPKG \
                  --module antigone4224 \
                  --function create_pocket \
                  --gas-budget 500000000
                  
$ POCKETID="0xc60b51382a7329ac79d94cfd2e9a48e553399790ac0e0d81f50b070d68bb9880"
                  
# Generate the pool to keep balance
$ sui client call --package $BANKPKG \
                --module antigone4224 \
                --function generate_pool \
                --gas-budget 500000000 \
                --type-args $AC $ACF
                
$ POOLID="0xfb6a5ba9cb94bbcc513de35d33d8a0339933269f0a24e05a22981aa0db3eb448"

AC="0xc570d3d2910473578c2a268cbeab362253613d5c29c92904d851cbceed5c89ac::antigone4224c::ANTIGONE4224C"
ACF="0x184fdb38d567d335ac518b06004b33f48ae97e1eceeac467c35027d0437922e8::antigone4224Faucet::ANTIGONE4224FAUCET"
# Deposit all balance of AC and ACF into Pool and get the LP
$ sui client call --package $BANKPKG\
                --module antigone4224 \
                --function deposit_totally \
                --gas-budget 500000000 \
                --type-args $AC $ACF \
                --args $POOLID \
                       0x898bde946372bd40854646f0477c664cc992124130af1a93264333dcea76b43f\
                       0x46c9cc3db0b338e15863a1bf7920a32ff62a237f34a1b83f1126e66acf06bfe0\
                       $POCKETID


# Swap Coin X to Coin Y
$ sui client call --package $BANKPKG \
                --module antigone4224 \
                --function swap_x_to_y \
                --gas-budget 500000000 \
                --type-args $AC $ACF \
                --args $POOLID \
                       '["0x0cb3c8a197c35053772a293a2a2218a6786d08ce86e0c35a2f2925ac98096aa9"]' \
                       \"1000\"

```

swap交易hash：B9BuMo3JV3Xe446ME6DCvcrUN6j3QidTWCSJ8FoLabBJ
