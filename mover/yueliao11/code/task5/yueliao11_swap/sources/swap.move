module yueliao11_swap::yueliao11_swap {
    use sui::object::{Self, UID};
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use faucetcoin::bright_faucet_coin::BRIGHT_FAUCET_COIN;
    use mycoin::bright_coin::BRIGHT_COIN;

    // 错误码
    const EZeroAmount: u64 = 0;
    const EReservesEmpty: u64 = 1;
    
    // 常量
    const FEE_PERCENT: u64 = 30; // 0.3% 手续费
    
 struct Pool has key {
    id: UID,
    coin_a: Balance<BRIGHT_FAUCET_COIN>,
    coin_b: Balance<BRIGHT_COIN>,
    lp_supply: Supply<LP>
}


    struct LP has drop {}

    fun init(ctx: &mut TxContext) {
        transfer::share_object(Pool {
            id: object::new(ctx),
            coin_a: balance::zero(),
            coin_b: balance::zero(),
            lp_supply: balance::create_supply(LP {})
        });
    }

 // 修改 create_pool 函数
public entry fun create_pool(
    coin_a: Coin<BRIGHT_FAUCET_COIN>,
    coin_b: Coin<BRIGHT_COIN>,
    ctx: &mut TxContext
) {
    let pool = Pool {
        id: object::new(ctx),
        coin_a: coin::into_balance(coin_a),
        coin_b: coin::into_balance(coin_b),
        lp_supply: balance::create_supply(LP {})
    };
    transfer::share_object(pool);
}

    // Swap A 换 B
    public entry fun swap_a_to_b(
        pool: &mut Pool,
        coin_in: Coin<BRIGHT_FAUCET_COIN>,
        ctx: &mut TxContext
    ) {
        let coin_in_value = coin::value(&coin_in);
        assert!(coin_in_value > 0, EZeroAmount);

        let out_amount = calculate_out_amount(
            coin_in_value,
            balance::value(&pool.coin_a),
            balance::value(&pool.coin_b)
        );

        balance::join(&mut pool.coin_a, coin::into_balance(coin_in));
        
        transfer::public_transfer(
            coin::take(&mut pool.coin_b, out_amount, ctx),
            tx_context::sender(ctx)
        );
    }

    // Swap B 换 A  
    public entry fun swap_b_to_a(
        pool: &mut Pool,
        coin_in: Coin<BRIGHT_COIN>,
        ctx: &mut TxContext
    ) {
        let coin_in_value = coin::value(&coin_in);
        assert!(coin_in_value > 0, EZeroAmount);

        let out_amount = calculate_out_amount(
            coin_in_value,
            balance::value(&pool.coin_b),
            balance::value(&pool.coin_a)
        );

        balance::join(&mut pool.coin_b, coin::into_balance(coin_in));
        
        transfer::public_transfer(
            coin::take(&mut pool.coin_a, out_amount, ctx),
            tx_context::sender(ctx)
        );
    }

    fun calculate_out_amount(
        in_amount: u64,
        in_reserve: u64,
        out_reserve: u64
    ): u64 {
        let in_amount_with_fee = ((in_amount as u128) * (10000 - (FEE_PERCENT as u128)));
        //let in_amount_with_fee = (in_amount as u128) * (10000 - FEE_PERCENT);
        let numerator = in_amount_with_fee * (out_reserve as u128);
        let denominator = (in_reserve as u128) * 10000 + in_amount_with_fee;
        
        ((numerator / denominator) as u64)
    }
}
