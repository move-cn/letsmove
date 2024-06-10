module systemx10_coin::systemx10_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct SYSTEMX10_COIN has drop {}

    fun init(witness: SYSTEMX10_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<SYSTEMX10_COIN>(
            witness,
            9,
            b"SYSTEMX10_COIN",
            b"SYSTEMX10",
            b"first coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/161659965")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<SYSTEMX10_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<SYSTEMX10_COIN>, 
        coin: Coin<SYSTEMX10_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}