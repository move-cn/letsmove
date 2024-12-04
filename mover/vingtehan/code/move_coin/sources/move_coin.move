// Module: move_coin
module move_coin::vingtehan_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct VINGTEHAN_COIN has drop {}

    fun init(witness: VINGTEHAN_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<VINGTEHAN_COIN>(
            witness,
            9,
            b"VINGTEHAN_COIN",
            b"VINGTEHAN_COIN",
            b"coin create by mqh",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/169867954")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<VINGTEHAN_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<VINGTEHAN_COIN>, 
        coin: Coin<VINGTEHAN_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}