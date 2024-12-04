module mygame::mygame {
    use sui::balance::Balance;
    use sui::coin::{Self, Coin};
    use sui::random::{Self, Random};
    use sui::bcs::{Self, BCS};
    
    const ECallerNotHouse: u64 = 1;
    const EInvalidAmount: u64 = 2;
    const EInsufficientFunds: u64 = 3;
    public struct Pool<phantom T> has key, store {
        id: UID,
        house: address,
        funds: Balance<T>
    }

    public entry fun create_pool_transfer<T> (coin: Coin<T>, ctx: &mut TxContext) {
        let pool = Pool {
            id: object::new(ctx),
            house: ctx.sender(),
            funds: coin.into_balance()
        };
        transfer::public_transfer(pool, ctx.sender());
    }

    public entry fun top_up<T> (coin: Coin<T>, pool: &mut Pool<T>, ctx: &mut TxContext) {
        assert!(ctx.sender() == pool.house, ECallerNotHouse);
        
        pool.funds.join(coin.into_balance());
    }

    public entry fun withdraw<T> (pool: &mut Pool<T>, ctx: &mut TxContext) {
        assert!(ctx.sender() == pool.house, ECallerNotHouse);

        let amt = pool.funds.value();
        let balance = pool.funds.split(amt);
        let coin = coin::from_balance<T> (balance, ctx);
        transfer::public_transfer(coin, ctx.sender());
    }

    entry fun random_number(ctx: &mut TxContext): u8 {
        let tx_digest = tx_context::digest(ctx);
        let tx_digest_u64= bcs::peel_u8(&mut bcs::new(*tx_digest));
        let random_index: u8 = (tx_digest_u64 % 6) + 1;
        random_index
    }

    // guess the number of dice
    public entry fun play_dice<T> (pool: &mut Pool<T>, guess: u8, fee: Coin<T>, ctx: &mut TxContext) {
        // Pay for the turn, fee is 1 faucetcoin
        assert!(coin::value(&fee) == 1, EInvalidAmount);
        assert!(pool.funds.value() >= 1, EInsufficientFunds);
        
        let amt = coin::value(&fee);

        transfer::public_transfer(fee, pool.house);
        // Roll the dice
        if (guess == random_number(ctx)) { 
            let balance = pool.funds.split(amt);
            let coin = coin::from_balance<T> (balance, ctx);
            transfer::public_transfer(coin, ctx.sender());
        }
        else {
            let balance = pool.funds.split(0);
            let coin = coin::from_balance<T> (balance, ctx);
            transfer::public_transfer(coin, ctx.sender());
        }
  }


}