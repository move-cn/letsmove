module task2::lahepard_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct LAHEPARD_COIN has drop {}

    fun init(witness: LAHEPARD_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<LAHEPARD_COIN>(
            witness,
            9,
            b"LAHEPARD_COIN",
            b"LAHEPARD_COIN",
            b"coin create by mqh",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/169073119")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<LAHEPARD_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<LAHEPARD_COIN>, 
        coin: Coin<LAHEPARD_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}