module my_coin::refecoin { 
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap}; 
    use sui::transfer; 
    use sui::tx_context::{Self, TxContext};

public struct REFECOIN has drop {}

fun init(witness: REFECOIN, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency<REFECOIN>(
        witness, 2, 
        b"refe Coin", 
        b"RC", b"", 
        option::none(), 
        ctx);
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
}

public entry fun mint(
    treasury_cap: &mut TreasuryCap<REFECOIN>, 
    amount: u64, 
    recipient: address, 
    ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
}

public entry fun burn(
    treasury_cap: &mut TreasuryCap<REFECOIN>, 
    coin: Coin<REFECOIN>) {
    coin::burn(treasury_cap, coin);
}
}
