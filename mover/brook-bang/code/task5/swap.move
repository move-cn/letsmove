module brookbang::swap {

    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{balance, Coin};
    use sui::object;
    use sui::object::UID;
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    public struct Pool<phantom CoinA, phantom CoinB> has key {
        id: UID,
        a: Balance<CoinA>,
        b: Balance<CoinB>
    }

    public entry fun create_pool<CoinA,CoinB>(ctx: &mut TxContext) {
        let pool = Pool<CoinA,CoinB>{
            id: object::new(ctx),
            a: balance::zero(),
            b: balance::zero(),
        };
        transfer::share_object(pool);
    }

    public entry fun deposit_a<CoinA,CoinB>(pool: &mut Pool<CoinA,CoinB>,a: Coin<CoinA>){
        let a_balance = coin::into_balance(a);
        balance::join(&mut pool.a , a_balance);
    }

    public entry fun deposit_b<CoinA,CoinB>(pool: &mut Pool<CoinA,CoinB>,b: Coin<CoinB>){
        let b_balance = coin::into_balance(b);
        balance::join(&mut pool.b, b_balance);
    }

    public entry fun swap_a_b<CoinA,CoinB>(pool: &mut Pool<CoinA,CoinB>,a: Coin<CoinA>, ctx: &mut TxContext) {
        let amount = coin::value(&a);

        balance::join(&mut pool.a, coin::into_balance(a));

        let amount_b = amount;

        let b_balance = balance::split(&mut pool.b, amount_b);

        let b = coin::from_balance(b_balance, ctx);

        transfer::public_transfer(b, tx_context::sender(ctx));
    }


}

