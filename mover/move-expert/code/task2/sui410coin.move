module task2::sui410coin {
    use std::option;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin, TreasuryCap};

    // SUI410COIN要大写，不然报错
    struct SUI410COIN has drop {}

    fun init(witness: SUI410COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 9, b"SUI410COIN", b"S410", b"build coin on 20240410", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx)); 
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<SUI410COIN>, amount:u64, recipient:address, ctx: &mut TxContext) {
        let coinObject = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coinObject, recipient);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<SUI410COIN>, coin: Coin<SUI410COIN>, _ctx: &mut TxContext) {
        coin::burn(treasury_cap, coin);
    }
}