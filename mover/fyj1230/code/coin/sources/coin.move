module coin::fyj1230_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct FYJ1230_COIN has drop {}

    fun init(witness: FYJ1230_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<FYJ1230_COIN>(
            witness,
            9,
            b"FYJ1230_COIN",
            b"fyj1230",
            b"virtual coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/167277561")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FYJ1230_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<FYJ1230_COIN>, 
        coin: Coin<FYJ1230_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}