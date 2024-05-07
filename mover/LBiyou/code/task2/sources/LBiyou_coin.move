/// Module: LBiyou_coin
module task2::lbiyou_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct LBIYOU_COIN has drop {}

    fun init(witness: LBIYOU_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<LBIYOU_COIN>(
            witness,
            9,
            b"LBIYOU_COIN",
            b"lbiyou",
            b"first coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/104566270?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<LBIYOU_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<LBIYOU_COIN>, 
        coin: Coin<LBIYOU_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}
