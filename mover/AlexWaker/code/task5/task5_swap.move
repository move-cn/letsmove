module task5_swap::simple_swap {
    // use sui::object::{Self, UID};
    // use sui::balance;
    // use sui::transfer::{share_object, public_transfer};
    // use sui::balance::{Balance, zero, join, split};
    // use sui::coin::{Coin, into_balance, from_balance};
    // use sui::tx_context::TxContext;
    use sui::object::{Self, UID};
    use sui::transfer::{share_object, public_transfer};
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin, into_balance, from_balance};
    use sui::balance::{Self, Balance, zero, join, split};
    use sui::event;
    use std::string::{Self, String};
    use my_coin::alexwaker_coin::{ALEXWAKER_COIN};
    use my_faucet_coin::alexwaker_faucet_coin::{ALEXWAKER_FAUCET_COIN};

    /// 定义一个简单的池（Pool），存储两个代币的余额
    public struct Pool has key {
        id: UID,
        balance_a: Balance<ALEXWAKER_COIN>,
        balance_b: Balance<ALEXWAKER_FAUCET_COIN>,
    }

    /// 初始化池
    fun init( //初始化方法只能这么写
        // initial_a: Balance<ALEXWAKER_COIN>,
        // initial_b: Balance<ALEXWAKER_FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        let pool = Pool {
            id: object::new(ctx),
            balance_a: zero(),
            balance_b: zero(),
        };
        share_object(pool);
    }

    public fun addLiquidityAC(
        pool: &mut Pool,
        coin_a: Coin<ALEXWAKER_COIN>,
        //coin_b: Coin<ALEXWAKER_FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        let value_a = into_balance(coin_a); //
        //let value_b = into_balance(coin_b);
        join(&mut pool.balance_a, value_a);
        //join(&mut pool.balance_b, value_b);
        
    }
    public fun addLiquidityAFC(
        pool: &mut Pool,
        //coin_a: Coin<ALEXWAKER_COIN>,
        coin_b: Coin<ALEXWAKER_FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        //let value_a = into_balance(coin_a); //
        let value_b = into_balance(coin_b);
        join(&mut pool.balance_b, value_b);
        //join(&mut pool.balance_a, value_a);
        
    }

    /// 代币 A 换代币 B (1:1)
    public fun swap_a_for_b(
        pool: &mut Pool,
        input_a: Coin<ALEXWAKER_COIN>,
        ctx: &mut TxContext
    ) {
        let value = input_a.value(); // 获取代币 A 的数量
        let output_b = split(&mut pool.balance_b, value); // 从池中提取等量的 B
        join(&mut pool.balance_a, into_balance(input_a)); // 将代币 A 加入池中
        let coin_b = from_balance(output_b, ctx);
        public_transfer(coin_b, ctx.sender());
        //output_b // 返回用户获得的代币 B
    }

    /// 代币 B 换代币 A (1:1)
    public fun swap_b_for_a(
        pool: &mut Pool,
        input_b: Coin<ALEXWAKER_FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        let value = input_b.value(); // 获取代币 B 的数量
        let output_a = split(&mut pool.balance_a, value); // 从池中提取等量的 A
        join(&mut pool.balance_b, into_balance(input_b)); // 将代币 B 加入池中
        let coin_a = from_balance(output_a, ctx);
        public_transfer(coin_a, ctx.sender());
        //output_a // 返回用户获得的代币 A
    }
}

//testnet
//packageid: 0x921a8fdf8796fa4274bfff3f74cc651f26e82fe456041d19378ef8e513cd44c3
//pool object: 0x1ddd04a1b6a231c164c8720332bfa9a241f88c16f9dbbf6babcd4a379957419d
//add my_coin coin id:0xeea3c46210acf139fecd7ff19d90861917f5c2d6b814c48fb24f1d5ad6b82935
//my_faucet_coin coin id: 0xe8e8ec8df6023003ef45d0f6b369b6520847d830d36e22cb93dec485904dbdb9
//duihuan my_coin id: 0xe160e9c0dbd20f403277b2fb8cd98ca1cfe6671cfc381551e17ac67f6744f326
//duihuan my_faucet_coin id: 0xcbfdfedb2ba4a0f4f6177e32781ed5292fb33c696e43af67dd242b1425b0221a
//测试网跑通了，记得coinid是领取之后coin的objectid，不是treasury的

//mainnet
//packageid: 0x7088ece81ebbbe992bda5097f7f07fec86c7ddfd2759dc2218121ebadf09c8e6
//pool: 0xf2fea0cdb54ea274b270aeb9c1c842617627ad8b944574abf3faaaab2cda0f2a
//add my_coin coin id: 0xa6c9687ecd917ceab6f903aaaa6e1e817f27954d5691b4326e74455e0d46b06d
//duihuan my_coin id: 0x6381ff9d8c5b7dbf062d25aebb78d951c2e4426b902f8359cb0471e5312f5920
//add my_faucet_coin id: 0xa2c7ee767d942ea58954111a78d154fb1e16d01e46e60312b9583fc1d9be3842
//duihuan my_faucet_coin id: 0x316b5ab339dc3981467f42f00e08f126095228d00b849a8a97e233f6bdee6bb8
