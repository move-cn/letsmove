module youlixiaosheng_coin::youlixiaosheng_coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context;
    use sui::url::{Self,Url};

    public struct YOULIXIAOSHENG_COIN has drop {}

    fun init(youlixiaosheng_coin: YOULIXIAOSHENG_COIN, ctx: &mut TxContext) {
        let (treasury_cap,
            metadata) = coin::create_currency<YOULIXIAOSHENG_COIN>(
            youlixiaosheng_coin,
            9,
            b"YOULIXIAOSHENG_COIN",
            b"youlixiaosheng",
            b"youlixiaosheng",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/147264753?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<YOULIXIAOSHENG_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<YOULIXIAOSHENG_COIN>,
        coin: Coin<YOULIXIAOSHENG_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}