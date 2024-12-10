module task4::place {

    // === Imports ===
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};

    // === Errors ===
    const EFeeTooHigh: u64 = 0;
    const EAmountIncorrect: u64 = 1;
    const ENotAdmin: u64 = 2;

    // === Structs ===
    public struct Place<phantom T> has key, store {
        id: UID,
        // 手续费, eg: 250 = 2.5%
        fee: u64,
        // 赔率, eg: 25000 = 250%
        odds: u64,
        // 管理员
        admin: address,
        // 手续费接收人
        receiver: address,
        // 奖池
        prize_pool: Balance<T>
    }

    entry fun create<T>(fee: u64, odds: u64, admin: address, receiver: address, ctx: &mut TxContext) {
        assert!(fee <= 10000, EFeeTooHigh);
        let place = Place<T> {
            id: object::new(ctx),
            fee,
            odds,
            admin,
            receiver,
            prize_pool: balance::zero()
        };
        transfer::share_object(place);
    }

    entry fun inject<T>(place: &mut Place<T>, mut pay: Coin<T>, amount: u64, ctx: &mut TxContext) {
        assert!(coin::value(&pay) >= amount, EAmountIncorrect);

        // 从coin中切割amount数量的代币
        let pay_need = coin::split(&mut pay, amount, ctx);

        // 合并代币
        balance::join(&mut place.prize_pool, coin::into_balance(pay_need));

        // 剩余的coin返回给sender
        transfer::public_transfer(pay, tx_context::sender(ctx));
    }

    entry fun update<T>(
        place: &mut Place<T>,
        fee: u64,
        odds: u64,
        admin: address,
        receiver: address,
        ctx: &TxContext
    ) {
        assert!(fee <= 10000, EFeeTooHigh);
        assert!(tx_context::sender(ctx) == place.admin, ENotAdmin);

        place.fee = fee;
        place.odds = odds;
        place.admin = admin;
        place.receiver = receiver;
    }

    public(package) fun prize_pool_mut<T>(self: &mut Place<T>): &mut Balance<T> { &mut self.prize_pool }

    public fun fee<T>(self: &Place<T>): u64 { self.fee }

    public fun odds<T>(self: &Place<T>): u64 { self.odds }

    public fun receiver<T>(self: &Place<T>): address { self.receiver }

    public fun prize_pool<T>(self: &Place<T>): &Balance<T> { &self.prize_pool }

    // === Testing ===

    #[test_only]
    public fun destroy_for_testing<T>(place: Place<T>) {
        let Place {
            id,
            fee: _,
            odds: _,
            admin: _,
            receiver: _,
            prize_pool,
        } = place;

        balance::destroy_for_testing(prize_pool);

        object::delete(id);
    }
}