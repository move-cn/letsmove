module sony9997_swap::sony9997_swap {
    use sui::tx_context::{Self, TxContext};
    use sui::balance::{Self, Balance};
    use sui::object::{Self, UID};
    use sui::coin::{Self, Coin};

    use sui::transfer;

    const EInsufficientBalance: u64 = 11;

    public struct AdminCap has key {
        id: UID
    }

    public struct Bank <phantom A, phantom B> has key {
        id: UID,
        coin_a: Balance<A>,
        coin_b: Balance<B>,
        rate: u64
    }

    fun init(ctx: &mut TxContext) {
        let admin_cap = AdminCap {
            id: object::new(ctx)
        };
        transfer::transfer(admin_cap, tx_context::sender(ctx))
    }

    public fun initialize<A,B>(_ :&AdminCap, coin1: Coin<A>, coin2: Coin<B>, rate:u64, ctx: &mut TxContext) {
        let mut bank = Bank<A, B> {
            id: object::new(ctx),
            coin_a: balance::zero<A>(),
            coin_b: balance::zero<B>(),
            rate: rate,
        };

        balance::join(&mut bank.coin_a, coin::into_balance(coin1));
        balance::join(&mut bank.coin_b, coin::into_balance(coin2));

        transfer::share_object(bank)
    }

    public fun set_rate<A, B>(_ :&AdminCap, bank: &mut Bank<A, B>, rate: u64, _ctx: &mut TxContext){
        bank.rate = rate
    }

    public entry fun add<A, B>(coin1: Coin<A>, coin2: Coin<B>,bank: &mut Bank<A, B>){
        let balance1 = coin::into_balance(coin1);
        balance::join(&mut bank.coin_a, balance1);
        let balance2 = coin::into_balance(coin2);
        balance::join(&mut bank.coin_b, balance2);
    }

    public entry fun swap_a_b<A, B>(coin: Coin<A>, bank: &mut Bank<A, B>, ctx: &mut TxContext) {
        let v1 = coin::value(&coin);
        assert!(v1 > 0, EInsufficientBalance);
        let v2 = v1 * bank.rate;
        assert!(balance::value(&bank.coin_b) > v2, EInsufficientBalance);

        let coin2 = coin::take(&mut bank.coin_b, v2, ctx);
        
        let balance = coin::into_balance(coin);
        balance::join(&mut bank.coin_a, balance);
        transfer::public_transfer(coin2, tx_context::sender(ctx));
    }

    public entry fun swap_b_a<A, B>(coin: Coin<B>, bank: &mut Bank<A, B>, ctx: &mut TxContext) {
        let v1 = coin::value(&coin);
        assert!(v1 > 0, EInsufficientBalance);
        let v2 = v1/bank.rate;
        assert!(balance::value(&bank.coin_a) > v2, EInsufficientBalance);

        let coin2 = coin::take(&mut bank.coin_a, v2, ctx);
        
        let balance = coin::into_balance(coin);
        balance::join(&mut bank.coin_b, balance);
        transfer::public_transfer(coin2, tx_context::sender(ctx));
    }

    #[allow(lint(self_transfer))]
    public fun withdraw<A, B>(_ :&AdminCap, bank: &mut Bank<A, B>, ctx: &mut TxContext){
        let balance1 = balance::value(&bank.coin_a);
        let coin1 = coin::take(&mut bank.coin_a, balance1, ctx);
        transfer::public_transfer(coin1, tx_context::sender(ctx));

        let balance2 = balance::value(&bank.coin_b);
        let coin2 = coin::take(&mut bank.coin_b, balance2, ctx);
        transfer::public_transfer(coin2, tx_context::sender(ctx))
    }
}