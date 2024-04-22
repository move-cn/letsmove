
/// Module: lz1998_coin
module lz1998_coin::lz1998_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    public struct Lz1998Coin has drop {}
    fun init(witness: Lz1998Coin, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"Lz1998 COIN",           // symbol
            b"Lz1998 COIN",       // name
            b"Amazing Coin", // description
            option:: none(),   // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<Lz1998Coin>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<Lz1998Coin>, coin: Coin<Lz1998Coin>) {
        coin::burn(treasury_cap, coin);
    }
}

