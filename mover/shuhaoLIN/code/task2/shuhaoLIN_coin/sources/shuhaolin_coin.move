/*
/// Module: shuhaolin_coin
module shuhaolin_coin::shuhaolin_coin {

}
*/
module shuhaolin_coin::shuhaolin_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    public struct SHUHAOLIN_COIN has drop {}
    fun init(witness: SHUHAOLIN_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"shuhaolin COIN",           // symbol
            b"shuhaolin COIN",       // name
            b"Amazing Coin", // description
            option:: none(),   // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<SHUHAOLIN_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<SHUHAOLIN_COIN>, coin: Coin<SHUHAOLIN_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}