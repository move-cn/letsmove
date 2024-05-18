module my_coin::guizhenyu_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct GUIZHENYU_COIN has drop {}

    fun init(witness: GUIZHENYU_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<GUIZHENYU_COIN>(
            witness,
            9,
            b"GUIZHENYU_COIN",
            b"GUIZHENYU",
            b"gzy first coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/51150541")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<GUIZHENYU_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<GUIZHENYU_COIN>, 
        coin: Coin<GUIZHENYU_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}