module task2::giizhang_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct GIIZHANG_COIN has drop {}

    fun init(witness: GIIZHANG_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<GIIZHANG_COIN>(
            witness,
            9,
            b"GIIZHANG_COIN",
            b"GIIZHANG_COIN",
            b"coin create by mqh",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/169957055?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<GIIZHANG_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<GIIZHANG_COIN>, 
        coin: Coin<GIIZHANG_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}