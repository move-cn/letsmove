// Module: marktranet_coin
module marktranet_coin::marktranet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct MARKTRANET_COIN has drop {}

    fun init(witness: MARKTRANET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MARKTRANET_COIN>(
            witness,
            9,
            b"MARKTRANET_COIN",
            b"marktranet's",
            b"first coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/167279101")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MARKTRANET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<MARKTRANET_COIN>, 
        coin: Coin<MARKTRANET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}