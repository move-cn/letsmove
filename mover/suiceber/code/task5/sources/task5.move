
module task5::task5 {
    use sui::coin::{Self, Coin};
    use suiceber_coin::suiceber_coin::SUICEBER_COIN;
    use suiceber_faucet_coin::suiceber_faucet_coin::SUICEBER_FAUCET_COIN;
    use sui::balance::{Self, Balance};

    const EInsufficientBalance: u64 = 1000;

    public struct Pool has key {
        id: UID,
        coin_balance: Balance<SUICEBER_COIN>,
        faucet_balance: Balance<SUICEBER_FAUCET_COIN>,
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
    public entry fun Deposit(
        pool: &mut Pool,
        coin: &mut Coin<SUICEBER_COIN>,
        faucet: &mut Coin<SUICEBER_FAUCET_COIN>,
        coin_amount: u64,
        faucet_amount: u64

    ) {
        let split_coin_balance = balance::split(
            coin::balance_mut(coin),
            coin_amount
        );
        balance::join(
            &mut pool.coin_balance,
            split_coin_balance
        );
        let split_faucet_balance = balance::split(
            coin::balance_mut(faucet),
            faucet_amount
        );
        balance::join(
            &mut pool.faucet_balance,
            split_faucet_balance
        );
    }

    public entry fun swap_coin_to_faucet(
        pool: &mut Pool,
        coin: &mut Coin<SUICEBER_COIN>,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(
            pool.faucet_balance.value() >= amount,
            EInsufficientBalance
        );
        let split_coin_balance = balance::split(coin::balance_mut(coin), amount);
        balance::join(
            &mut pool.coin_balance,
            split_coin_balance
        );
        let faucet = coin::take(
            &mut pool.faucet_balance,
            amount,
            ctx
        );
        transfer::public_transfer(faucet, ctx.sender());
    }

    public entry fun swap_faucet_to_coin(
        pool: &mut Pool,
        faucet: &mut Coin<SUICEBER_FAUCET_COIN>,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(
            pool.coin_balance.value() >= amount,
            EInsufficientBalance
        );
        let split_faucet_balance = balance::split(coin::balance_mut(faucet), amount);
        balance::join(
            &mut pool.faucet_balance,
            split_faucet_balance
        );
        let coin = coin::take(&mut pool.coin_balance, amount, ctx);
        transfer::public_transfer(coin, ctx.sender());
    }
}
