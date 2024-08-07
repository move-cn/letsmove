module unidentifiable_coin_no_share::unidentifiable_coin_no_share {
    use std::ascii;
    use sui::coin::{Self, TreasuryCap};
    use sui::url;

    public struct UNIDENTIFIABLE_COIN_NO_SHARE has drop {}

    fun init(witness: UNIDENTIFIABLE_COIN_NO_SHARE, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,
            b"UNIDENTIFIABLE_COIN_NO_SHARE",
            b"UNIDENTIFIABLE_COIN_NO_SHARE",
            b"It is no share unidentifiable coin. ",
            option::some(url::new_unsafe(ascii::string(b"https://cdn3.iconfinder.com/data/icons/leto-space/64/__space_cat_helmet-1024.png"))),
            ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, ctx.sender());
    }

    public entry fun mint_in_my_module(
        treasury_cap: &mut TreasuryCap<UNIDENTIFIABLE_COIN_NO_SHARE>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}

// 0xb1f186eb0e9ded3f86e14264050ba759a2e442c1a2651229313f0d8cc1901fbe