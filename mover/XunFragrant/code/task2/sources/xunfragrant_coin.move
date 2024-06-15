module task2::xunfragrant_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct XUNFRAGRANT_COIN has drop {}

    fun init(witness: XUNFRAGRANT_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<XUNFRAGRANT_COIN>(
            witness,
            9,
            b"XUNFRAGRANT_COIN",
            b"XUNFRAGRANT",
            b"xunfragrant coin, my first ft coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/100562605")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<XUNFRAGRANT_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<XUNFRAGRANT_COIN>, 
        coin: Coin<XUNFRAGRANT_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}