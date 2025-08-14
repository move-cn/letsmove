module task5::Pithos23CoinSwap {

    use sui::balance::{Self, Balance, zero};
    use sui::coin::{Self, Coin};
    use sui::object::{Self, UID};
    use sui::transfer::{public_transfer, share_object, transfer};
    use sui::tx_context::{Self, TxContext};

    const EBanlanceNotEnough: u64 = 1;

    public

    struct AdminCap has key {
        id: UID
    }


    // PITHOS23COIN  PITHOS23COINFAUCET
    public struct Bank<phantom X, phantom Y> has key {
        id: UID,
        coin_x: Balance<X>,
        coin_y: Balance<Y>
    }

    fun init(ctx: &mut TxContext) {
        let adminCap = AdminCap { id: object::new(ctx) };
        transfer(adminCap, tx_context::sender(ctx));
    }

    public entry fun createPoool<X, Y>(ctx: &mut TxContext) {
        let bank = Bank {
            id: object::new(ctx),
            coin_x: zero<X>(),
            coin_y: zero<Y>()
        };
        share_object(bank);
    }

    // deposit X
    public entry fun depositX<X, Y>(bank: &mut Bank<X, Y>, coin_x: Coin<X>, ctx: &mut TxContext) {
        let balance = coin::into_balance<X>(coin_x);
        balance::join<X>(&mut bank.coin_x, balance);
    }

    // withdraw X
    public entry fun withdrawX<X, Y>(bank: &mut Bank<X, Y>, amount: u64, ctx: &mut TxContext) {
        let a_balance = balance::split<X>(&mut bank.coin_x, amount);
        let coinX = coin::from_balance<X>(a_balance, ctx);
        public_transfer(coinX, tx_context::sender(ctx));
    }


    // deposit Y
    public entry fun depositY<X, Y>(bank: &mut Bank<X, Y>, coin_y: Coin<Y>, ctx: &mut TxContext) {
        let balance = coin::into_balance<Y>(coin_y);
        balance::join<Y>(&mut bank.coin_y, balance);
    }

    // withdraw Y
    public entry fun withdrawY<X, Y>(bank: &mut Bank<X, Y>, amount: u64, ctx: &mut TxContext) {
        let a_balance = balance::split<Y>(&mut bank.coin_y, amount);
        let coinX = coin::from_balance<Y>(a_balance, ctx);
        public_transfer(coinX, tx_context::sender(ctx));
    }

    // X swap Y with 1:1.
    public entry fun swapX_to_Y<X, Y>(bank: &mut Bank<X, Y>, coinX: Coin<X>, ctx: &mut TxContext) {
        let amount_x = coin::value<X>(&coinX);

        // step1
        let amount_y = bank.coin_y.
        value();
        assert!(amount_y >= amount_x, EBanlanceNotEnough);

        // step2
        let remain_coin_y = balance::split<Y>(&mut bank.coin_y, amount_x);
        let coin_y = coin::from_balance<Y>(remain_coin_y, ctx);
        public_transfer(coin_y, tx_context::sender(ctx));

        // step3
        let a_balance = coin::into_balance<X>(coinX);
        balance::join<X>(&mut bank.coin_x, a_balance);
    }


    //  Y swap X with 1:1.
    public entry fun swapY_to_X<X, Y>(bank: &mut Bank<X, Y>, coinY: Coin<Y>, ctx: &mut TxContext) {
        let amount_y = coin::value<Y>(&coinY);
        let amount_x = bank.coin_x.
        value();

        // step1
        assert!(amount_x >= amount_y, EBanlanceNotEnough);

        // step2
        let remain_coin_y = balance::split<X>(&mut bank.coin_x, amount_y);
        let coin_x = coin::from_balance<X>(remain_coin_y, ctx);
        public_transfer(coin_x, tx_context::sender(ctx));

        // step3
        let a_balance = coin::into_balance<Y>(coinY);
        balance::join<Y>(&mut bank.coin_y, a_balance);
    }
}
