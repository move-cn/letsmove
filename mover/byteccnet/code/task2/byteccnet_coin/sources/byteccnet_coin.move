/*
/// Module: byteccnet_coin
module byteccnet_coin::byteccnet_coin {

}
*/
module byteccnet_coin::byteccnet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    public struct BYTECCNET_COIN has drop {}
    fun init(witness: BYTECCNET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"byteccnet COIN",           // symbol
            b"byteccnet COIN",       // name
            b"Amazing Coin", // description
            option:: none(),   // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<BYTECCNET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<BYTECCNET_COIN>, coin: Coin<BYTECCNET_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}