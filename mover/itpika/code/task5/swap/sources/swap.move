/// Module: swap
module swap::itpika_swap {
    use sui::balance::{Self, Balance};
    use faucet::itpika_faucet::ITPIKA_FAUCET;
    use coin::itpika::ITPIKA;
    use sui::coin::{Self, Coin};

    public struct Pool has key {
        id: UID,
        admin: address,
        token_A: Balance<ITPIKA_FAUCET>,
        token_B: Balance<ITPIKA>,
        val_constant: u256,
    }

    fun init(ctx: &mut TxContext) {
        let pool = Pool {
            id: object::new(ctx),
            admin: ctx.sender(),
            token_A: balance::zero<ITPIKA_FAUCET>(),
            token_B: balance::zero<ITPIKA>(),
            val_constant: 0,
        };
        transfer::share_object(pool);
    }

    entry fun deposit_A(pool: &mut Pool, bal: &mut Coin<ITPIKA_FAUCET>, amount: u64, ctx: &mut TxContext) {
        let val = bal.split(amount, ctx);
        pool.token_A.join(coin::into_balance(val));
        pool.val_constant = (balance::value(&pool.token_A) as u256) * (balance::value(&pool.token_B) as u256)
    }
    entry fun deposit_B(pool: &mut Pool, bal: &mut Coin<ITPIKA>, amount: u64, ctx: &mut TxContext) {
        let val = bal.split(amount, ctx);
        pool.token_B.join(coin::into_balance(val));
        pool.val_constant = (balance::value(&pool.token_A) as u256) * (balance::value(&pool.token_B) as u256)
    }

    entry fun swap_A(pool: &mut Pool, bal: &mut Coin<ITPIKA>, amount: u64, ctx: &mut TxContext) {
        assert!(pool.val_constant > 0, 0);
        assert!(coin::value(bal) >= amount, 1);

        let token_a_amount = (balance::value(&pool.token_A) as u256) - (pool.val_constant / ((balance::value(&pool.token_B) as u256) + (amount as u256)));
        let val_coin = coin::from_balance(pool.token_A.split((token_a_amount as u64)), ctx);

        let from_b = coin::into_balance(bal.split(amount, ctx));
        pool.token_B.join(from_b);

        transfer::public_transfer(val_coin, ctx.sender());
    }

    entry fun swap_B(pool: &mut Pool, bal: &mut Coin<ITPIKA_FAUCET>, amount: u64, ctx: &mut TxContext) {
        assert!(pool.val_constant > 0, 0);
        assert!(coin::value(bal) >= amount, 1);

        let token_b_amount = (balance::value(&pool.token_B) as u256) - (pool.val_constant / ((balance::value(&pool.token_A) as u256) + (amount as u256)));
        let val_coin = coin::from_balance(pool.token_B.split((token_b_amount as u64)), ctx);

        let from_b = coin::into_balance(bal.split(amount, ctx));
        pool.token_A.join(from_b);

        transfer::public_transfer(val_coin, ctx.sender());
    }


}
