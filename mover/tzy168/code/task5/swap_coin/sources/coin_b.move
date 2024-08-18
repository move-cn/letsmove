module swap_coin::cb { 
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap}; 
    use sui::transfer; 
    use sui::tx_context::{Self, TxContext};

public struct CB has drop {}//coin a

fun init(witness: CB, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency<CB>(
        witness, 
        2, 
        b"COIN B", 
        b"CB", b"", 
        option::none(), 
        ctx);
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
}

public entry fun mint(
    treasury_cap: &mut TreasuryCap<CB>, 
    amount: u64, 
    recipient: address, 
    ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
}

public entry fun burn(
    treasury_cap: &mut TreasuryCap<CB>, 
    coin: Coin<CB>) {
    coin::burn(treasury_cap, coin);
}
}
