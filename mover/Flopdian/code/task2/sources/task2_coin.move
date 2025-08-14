/// Module: task2
module task2::flopdian_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct FLOPDIAN_COIN has drop {}

    fun init(witness: FLOPDIAN_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<FLOPDIAN_COIN>(
            witness,
            9,
            b"FLOPDIAN_COIN",
            b"flopdian",
            b"virtual coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/167522723")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FLOPDIAN_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<FLOPDIAN_COIN>, 
        coin: Coin<FLOPDIAN_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}