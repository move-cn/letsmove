module coin::yuhuangdadi666_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
     use sui::url::{Self,Url};

    public struct YUHUANGDADI666_COIN has drop {}

    fun init(witness: YUHUANGDADI666_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<YUHUANGDADI666_COIN>(
            witness,
            9,
            b"YUHUANGDADI666_COIN",
            b"yuhuangdadi666",
            b"yuhuangdadi666 coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/77825640?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<YUHUANGDADI666_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<YUHUANGDADI666_COIN>, 
        coin: Coin<YUHUANGDADI666_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}