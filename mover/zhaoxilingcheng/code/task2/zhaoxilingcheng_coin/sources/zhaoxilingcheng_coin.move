// Module: zhaoxilingcheng_coin
module zhaoxilingcheng_coin::zhaoxilingcheng_coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context;
    use sui::url::{Self,Url};

    public struct ZHAOXILINGCHENG_COIN has drop {}

    fun init(witness: ZHAOXILINGCHENG_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<ZHAOXILINGCHENG_COIN>(
            witness,
            9,
            b"ZHAOXILINGCHENG_COIN",
            b"zhaoxilingcheng's",
            b"first coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/30566370?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<ZHAOXILINGCHENG_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<ZHAOXILINGCHENG_COIN>,
        coin: Coin<ZHAOXILINGCHENG_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}