module coin::lyanna95_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct LYANNA95_COIN has drop {}

    fun init(witness: LYANNA95_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<LYANNA95_COIN>(
            witness,
            9,
            b"LYANNA95_COIN",
            b"lyanna95",
            b"lyanna95 coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/172299107?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<LYANNA95_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<LYANNA95_COIN>, 
        coin: Coin<LYANNA95_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}