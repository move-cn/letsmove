module coin::julieeking_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct JULIEEKING_COIN has drop {}

    fun init(witness: JULIEEKING_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<JULIEEKING_COIN>(
            witness,
            9,
            b"JULIEEKING_COIN",
            b"JULIEEKING_COIN",
            b"coin create by mqh",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/168746609?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<JULIEEKING_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<JULIEEKING_COIN>, 
        coin: Coin<JULIEEKING_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}