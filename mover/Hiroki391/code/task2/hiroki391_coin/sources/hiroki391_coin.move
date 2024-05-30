// Module: hiroki391_coin
module hiroki391_coin::hiroki391_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct HIROKI391_COIN has drop {}

    fun init(witness: HIROKI391_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<HIROKI391_COIN>(
            witness,
            9,
            b"HIROKI391_COIN",
            b"Hiroki's",
            b"first coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/165958351?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<HIROKI391_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<HIROKI391_COIN>, 
        coin: Coin<HIROKI391_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}