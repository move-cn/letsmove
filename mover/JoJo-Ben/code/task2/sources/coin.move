module task2::jojoben_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct JOJOBEN_COIN has drop {}

    fun init(witness: JOJOBEN_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<JOJOBEN_COIN>(
            witness,
            9,
            b"JOJOBEN_COIN",
            b"jojoben",
            b"jojoben coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/173065194?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<JOJOBEN_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<JOJOBEN_COIN>, 
        coin: Coin<JOJOBEN_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}