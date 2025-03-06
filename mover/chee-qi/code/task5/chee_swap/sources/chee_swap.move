/*
/// Module: chee_swap
module chee_swap::chee_swap;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

/// Module: chee_swap
module chee_swap::chee_swap;

// === Imports ===
use sui::balance::Balance;
use sui::balance;
use sui::transfer::{share_object,transfer};
use sui::coin;
use sui::coin::Coin; 

// === Errors ===
const E_INSUFFICIENT_LIQUIDITY: u64 = 1;
const E_INSUFFICIENT_AMOUNT: u64 = 2;
const E_ZERO_LIQUIDITY: u64 = 3;

// === Constants ===

// === Structs ===

public struct Pool<phantom CoinA,phantom CoinB> has key {
    id:UID,
    coin_a: Balance<CoinA>,
    coin_b: Balance<CoinB>,
    x: u64,
    y: u64,
}

public struct AdminCap has key {
    id: UID,
    address: address,
}
// === Events ===

// === Method Aliases ===


 fun init(ctx: &mut TxContext) {
    let adminCap = AdminCap {
        id: object::new(ctx),
        address: ctx.sender(),
    };
    transfer(adminCap,ctx.sender())
}


// === Public Functions ===
public fun create_pool<CoinA, CoinB>(
    x:u64,
    y:u64,
    ctx: &mut TxContext
) {
    let pool = Pool<CoinA, CoinB>{
        id: object::new(ctx),
        coin_a: balance::zero(),
        coin_b: balance::zero(),
        x: x,
        y: y,
    };
    share_object(pool)
}

/// 添加流动性
public fun add_liquidity<CoinA, CoinB>(
    pool: &mut Pool<CoinA, CoinB>,
    coin_a: Coin<CoinA>,
    coin_b: Coin<CoinB>,
    _: &mut TxContext
) {
    let amount_a = coin::value(&coin_a);
    let amount_b = coin::value(&coin_b);
    
    assert!(amount_a > 0 && amount_b > 0, E_ZERO_LIQUIDITY);
    
    // 将代币添加到池子中
    balance::join(&mut pool.coin_a, coin::into_balance(coin_a));
    balance::join(&mut pool.coin_b, coin::into_balance(coin_b));
    
    // 更新储备量
    pool.x = pool.x + amount_a;
    pool.y = pool.y + amount_b;
}

/// 代币交换
public fun swap<CoinA, CoinB>(
    pool: &mut Pool<CoinA, CoinB>,
    coin_in: Coin<CoinA>,
    min_amount_out: u64,
    ctx: &mut TxContext
): Coin<CoinB> {
    let amount_in = coin::value(&coin_in);
    assert!(amount_in > 0, E_INSUFFICIENT_AMOUNT);
    
    // 计算输出金额（使用 x * y = k 公式）
    let reserve_in = pool.x;
    let reserve_out = pool.y;
    
    // 计算输出金额：(reserve_out * amount_in) / (reserve_in + amount_in)
    let amount_out = (reserve_out * amount_in) / (reserve_in + amount_in);
    assert!(amount_out >= min_amount_out, E_INSUFFICIENT_LIQUIDITY);
    
    // 更新储备量
    balance::join(&mut pool.coin_a, coin::into_balance(coin_in));
    pool.x = pool.x + amount_in;
    pool.y = pool.y - amount_out;
    
    // 返回交换得到的代币
    coin::from_balance(balance::split(&mut pool.coin_b, amount_out), ctx)
}

// === View Functions ===

// === Admin Functions ===
public fun destroy_pool(
    admin: &AdminCap,
    id: UID,
    ctx: &mut TxContext
) {
    // Ensure only the admin can destroy the pool
    assert!(ctx.sender() == &admin.address, 0);

    // Destroy the pool
    object::delete(id);
}

// === Package Functions ===

// === Private Functions ===

// === Test Functions ===