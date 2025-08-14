module unidentifiable_coin::unidentifiable_coin {
    use std::ascii;
    use sui::coin::{Self, TreasuryCap};
    use sui::url;

    public struct UNIDENTIFIABLE_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: UNIDENTIFIABLE_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,
            b"UNIDENTIFIABLE_COIN",
            b"UNIDENTIFIABLE_COIN",
            b"It is unidentifiable coin. ",
            option::some(url::new_unsafe(ascii::string(b"https://cdn3.iconfinder.com/data/icons/leto-space/64/__space_cat_helmet-1024.png"))),
            ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint_in_my_module(
        treasury_cap: &mut TreasuryCap<UNIDENTIFIABLE_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}

// 0xb1f186eb0e9ded3f86e14264050ba759a2e442c1a2651229313f0d8cc1901fbe