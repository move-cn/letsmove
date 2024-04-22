module liky0310_swap::liky0310_swap {
    use sui::tx_context::{Self, TxContext};
    use sui::balance::{Self, Balance};
    use sui::object::{Self, UID};
    use sui::coin::{Self, Coin};

    use sui::transfer;

    const EInsufficientBalance: u64 = 11;

    public struct AdminCap has key {
        id: UID
    }

    public struct HouseData <phantom A, phantom B> has key {
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
        let mut house_data = HouseData<A, B> {
            id: object::new(ctx),
            coin_a: balance::zero(),
            coin_b: balance::zero(),
            rate: rate,
        };

        balance::join(&mut house_data.coin_a, coin::into_balance(coin1));
        balance::join(&mut house_data.coin_b, coin::into_balance(coin2));

        transfer::share_object(house_data)
    }

    public fun set_rate<A, B>(_ :&AdminCap, house_data: &mut HouseData<A, B>, rate: u64, _ctx: &mut TxContext){
        house_data.rate = rate
    }

    public entry fun add<A, B>(coin1: Coin<A>, coin2: Coin<B>,house_data: &mut HouseData<A, B>){
        let balance1 = coin::into_balance(coin1);
        balance::join(&mut house_data.coin_a, balance1);
        let balance2 = coin::into_balance(coin2);
        balance::join(&mut house_data.coin_b, balance2);
    }

    public entry fun swapForB<A, B>(coin: Coin<A>, house_data: &mut HouseData<A, B>, ctx: &mut TxContext) {
        let v1 = coin::value(&coin);
        assert!(v1 > 0, EInsufficientBalance);
        let v2 = house_data.rate*v1;
        assert!(balance::value(&house_data.coin_b) > v2, EInsufficientBalance);

        let coin2 = coin::take(&mut house_data.coin_b, v2, ctx);
        transfer::public_transfer(coin2, tx_context::sender(ctx));
        let balance = coin::into_balance(coin);
        balance::join(&mut house_data.coin_a, balance);
    }

    public entry fun swapForA<A, B>(coin: Coin<B>, house_data: &mut HouseData<A, B>, ctx: &mut TxContext) {
        let v1 = coin::value(&coin);
        assert!(v1 > 0, EInsufficientBalance);
        let v2 = house_data.rate/v1;
        assert!(balance::value(&house_data.coin_a) > v2, EInsufficientBalance);

        let coin2 = coin::take(&mut house_data.coin_a, v2, ctx);
        transfer::public_transfer(coin2, tx_context::sender(ctx));
        let balance = coin::into_balance(coin);
        balance::join(&mut house_data.coin_b, balance);
    }

    #[allow(lint(self_transfer))]
    public fun withdraw<A, B>(_ :&AdminCap, house_data: &mut HouseData<A, B>, ctx: &mut TxContext){
        let balance1 = balance::value(&house_data.coin_a);
        let coin1 = coin::take(&mut house_data.coin_a, balance1, ctx);
        transfer::public_transfer(coin1, tx_context::sender(ctx));

        let balance2 = balance::value(&house_data.coin_b);
        let coin2 = coin::take(&mut house_data.coin_b, balance2, ctx);
        transfer::public_transfer(coin2, tx_context::sender(ctx))
    }
}