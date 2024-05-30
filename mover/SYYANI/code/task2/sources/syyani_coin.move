module task2::syyani_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct SYYANI_COIN has drop {}

    fun init(witness: SYYANI_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<SYYANI_COIN>(
            witness,
            9,
            b"SYYANI_COIN",
            b"SYYANI",
            b"syyani coin, my first coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/40732861")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<SYYANI_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<SYYANI_COIN>, 
        coin: Coin<SYYANI_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}