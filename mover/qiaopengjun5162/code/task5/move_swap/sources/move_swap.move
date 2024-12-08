/// Module: move_swap
module move_swap::move_swap {
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    use sui::transfer::{public_transfer, share_object, transfer};
    use mycoin::mycoin::MYCOIN;
    use faucet_coin::faucet_coin::FAUCET_COIN;

    public struct AdminCap has key {
        id: UID
    }

    public struct Pool has key {
        id: UID,
        mycoin: Balance<MYCOIN>,
        faucet_coin: Balance<FAUCET_COIN>
    }

    fun init(ctx: &mut TxContext) {
        let pool = Pool {
            id: object::new(ctx),
            mycoin: balance::zero<MYCOIN>(),
            faucet_coin: balance::zero<FAUCET_COIN>()
        };
        share_object(pool);

        let adminCap = AdminCap {
            id: object::new(ctx)
        };

        transfer(adminCap, ctx.sender());
    }

    // deposit
    public entry fun deposit_mycoin(pool: &mut Pool, coin: Coin<MYCOIN>, _: &mut TxContext) {
        balance::join(&mut pool.mycoin, coin::into_balance(coin));
    }

    public entry fun deposit_faucet_coin(pool: &mut Pool, coin: Coin<FAUCET_COIN>, _: &mut TxContext) {
        pool.faucet_coin.join(coin::into_balance(coin));
    }

    // withdraw
    public entry fun withdraw_mycoin(_: &AdminCap, pool: &mut Pool, amount: u64, ctx: &mut TxContext) {
        let withdrawBalance = pool.mycoin.split(amount);
        public_transfer(coin::from_balance(withdrawBalance, ctx), ctx.sender());
    }

    public entry fun withdraw_faucet_coin(_: &AdminCap, pool: &mut Pool, amount: u64, ctx: &mut TxContext) {
        let withdrawBalance = pool.faucet_coin.split(amount);
        public_transfer(coin::from_balance(withdrawBalance, ctx), ctx.sender());
    }

    // swap
    // 1 mycoin -> 2 faucet_coin
    public entry fun mycoin_to_faucet_coin(pool: &mut Pool, coin: Coin<MYCOIN>, ctx: &mut TxContext) {
        let mycoin_amt = coin.value();
        let faucet_coin_amt = mycoin_amt * 20000 / 10000;

        pool.mycoin.join(coin::into_balance(coin));
        let faucet_coin_b = pool.faucet_coin.split(faucet_coin_amt);
        public_transfer(coin::from_balance(faucet_coin_b, ctx), ctx.sender());
    }

    // 2 faucet_coin -> 1 mycoin
    public entry fun faucet_coin_to_mycoin(pool: &mut Pool, coin: Coin<FAUCET_COIN>, ctx: &mut TxContext) {
        let faucet_coin_amt = coin.value();
        let mycoin_amt = faucet_coin_amt * 10000 / 20000;

        pool.faucet_coin.join(coin::into_balance(coin));
        let mycoin_b = pool.mycoin.split(mycoin_amt);
        public_transfer(coin::from_balance(mycoin_b, ctx), ctx.sender());
    }
}

