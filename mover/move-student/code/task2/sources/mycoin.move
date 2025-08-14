module task2::mycoin {
    use std::option;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin, TreasuryCap};

    // SUI410COIN要大写，不然报错
    struct MYCOIN has drop {}

    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 9, b"MYCOIN", b"MYCOIN2", b"build coin", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx)); 
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<MYCOIN>, amount:u64, recipient:address, ctx: &mut TxContext) {
        let coinObject = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coinObject, recipient);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<MYCOIN>, coin: Coin<MYCOIN>, _ctx: &mut TxContext) {
        coin::burn(treasury_cap, coin);
    }
}