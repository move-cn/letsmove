/// Module: task2
module task2::halsey929_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct HALSEY929_COIN has drop {}

    fun init(witness: HALSEY929_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<HALSEY929_COIN>(
            witness,
            9,
            b"HALSEY929_COIN",
            b"halsey929",
            b"virtual coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/77434939")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<HALSEY929_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<HALSEY929_COIN>, 
        coin: Coin<HALSEY929_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}