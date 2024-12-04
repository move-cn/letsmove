/// Module: move_swap
module move_swap::move_swap {
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin, balance};
    use sui::sui::transfer;
    use sui::transfer::{public_transfer, share_object};
    use sui::tx_context::sender;
    use my_coin::tmm_coin::TMM_COIN;
    use faucet_coin::tmm_faucet::TMM_FAUCET;

    // 1a swap 2b
    const SWAP_A_2_B: u64 = 2;

    public struct AdminCap has key {
        id: UID
    }

    public struct Pool has key {
        id: UID,
        balanceA: Balance<TMM_COIN>,
        balanceB: Balance<TMM_FAUCET>,
    }

    fun init(ctx: &mut TxContext) {
        let pool = Pool{
            id: object::new(ctx),
            balanceA: balance::zero<TMM_COIN>(),
            balanceB: balance::zero<TMM_FAUCET>()
        };

        share_object(pool);

        let adminCap = AdminCap {
            id: object::new(ctx)
        };

        transfer::transfer(adminCap, sender(ctx));
    }

    public entry fun deposit_a(pool: &mut Pool, coin: Coin<TMM_COIN>, _: &mut TxContext) {
        balance::join(&mut pool.balanceA, coin::into_balance(coin));
    }

    public entry fun deposit_b(pool: &mut Pool, coin: Coin<TMM_FAUCET>, _: &mut TxContext) {
        balance::join(&mut pool.balanceB, coin::into_balance(coin));
    }

    public entry fun withdraw_a(_: &AdminCap, pool: &mut Pool, amount: u64, ctx: &mut TxContext) {
        let withdrawBalance = balance::split(&mut pool.balanceA, amount);
        let coin = coin::from_balance(withdrawBalance, ctx);
        public_transfer(coin, sender(ctx));
    }
    public entry fun withdraw_b(_: &AdminCap, pool: &mut Pool, amount: u64, ctx: &mut TxContext) {
        let withdrawBalance = balance::split(&mut pool.balanceB, amount);
        let coin = coin::from_balance(withdrawBalance, ctx);
        public_transfer(coin, sender(ctx));
    }

    public entry fun swap_a_2_b(pool: &mut Pool, coin: Coin<TMM_COIN>, ctx: &mut TxContext) {
        let amtA = coin::value(&coin);
        let amtB = amtA * 20000 / 10000;

        balance::join(&mut pool.balanceA, coin::into_balance(coin));

        let balanceB = balance::split(&mut pool.balanceB, amtB);
        let coinB = coin::from_balance(balanceB, ctx);
        public_transfer(coinB, sender(ctx));
    }

    public entry fun swap_b_2_a(pool: &mut Pool, coin: Coin<TMM_FAUCET>, ctx: &mut TxContext) {
        let amtB = coin::value(&coin);
        let amtA = amtB * 10000 / 20000;

        balance::join(&mut pool.balanceB, coin::into_balance(coin));

        let balanceA = balance::split(&mut pool.balanceA, amtA);
        let coinA = coin::from_balance(balanceA, ctx);
        public_transfer(coinA, sender(ctx));
    }
}
