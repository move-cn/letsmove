module coin::collaralloc_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct COLLARALLOC_COIN has drop {}

    fun init(collaralloc_coin: COLLARALLOC_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<COLLARALLOC_COIN>(
            collaralloc_coin,
            9,
            b"COLLARALLOC_COIN",
            b"collaralloc_coin",
            b"collaralloc coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/77825640?v=4")),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<COLLARALLOC_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<COLLARALLOC_COIN>, 
        coin: Coin<COLLARALLOC_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}