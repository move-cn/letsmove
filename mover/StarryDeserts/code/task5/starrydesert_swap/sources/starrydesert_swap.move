module starrydesert_swap::swap {
    use sui::coin::{Self, Coin};
    use starrydesert_swap::sd_coin::SD_COIN;
    use starrydesert_swap::sd_faucet_coin::SD_FAUCET_COIN;
    use sui::balance::{Self, Balance};

    const EInsufficientBalance: u64 = 1000;

    public struct Pool has key {
        id: UID,
        coin_balance: Balance<SD_COIN>,
        faucet_balance: Balance<SD_FAUCET_COIN>,
    }

    fun init(ctx: &mut TxContext) {
        let pool = Pool {
            id: object::new(ctx),
            coin_balance: balance::zero(),
            faucet_balance: balance::zero()
        };
        transfer::share_object(pool);
    }

    // 填充资金池
    public entry fun deposit(
        pool: &mut Pool,
        coin: &mut Coin<SD_COIN>,
        faucet: &mut Coin<SD_FAUCET_COIN>,
        coin_amount: u64,
        faucet_amount: u64

    ) {
        let split_coin_balance = coin::balance_mut(coin).split(coin_amount);
        pool.coin_balance.join(split_coin_balance);
        let split_faucet_balance = coin::balance_mut(faucet).split(faucet_amount);
        pool.faucet_balance.join(split_faucet_balance);
    }

    public entry fun swap_coin_to_faucet(
        pool: &mut Pool,
        coin: &mut Coin<SD_COIN>,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(
            pool.faucet_balance.value() >= amount,
            EInsufficientBalance
        );
        let split_coin_balance = coin::balance_mut(coin).split(amount);
        pool.coin_balance.join(split_coin_balance);
        let faucet = coin::take(
            &mut pool.faucet_balance,
            amount,
            ctx
        );
        transfer::public_transfer(faucet, ctx.sender());
    }

    public entry fun swap_faucet_to_coin(
        pool: &mut Pool,
        faucet: &mut Coin<SD_FAUCET_COIN>,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(
            pool.coin_balance.value() >= amount,
            EInsufficientBalance
        );
        let split_faucet_balance = coin::balance_mut(faucet).split(amount);
        pool.faucet_balance.join(split_faucet_balance);
        let coin = coin::take(&mut pool.coin_balance, amount, ctx);
        transfer::public_transfer(coin, ctx.sender());
    }
}
