module coin_study::faucetcoin {
    use sui::tx_context::TxContext;
    use sui::coin::{Self, TreasuryCap};
    use std::option;
    use sui::url;
    use sui::transfer;

    struct FAUCETCOIN has drop {}

    #[allow(lint(share_owned))]
    fun init(otw: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            otw,
            9,
            b"BLACK MYTH WUKONG",
            b"WUKONG",
            b"CONFRONT DESTINY AUGUST 20, 2024",
            option::some(url::new_unsafe_from_bytes(b"https://github.com/zcy1024/SuiStudy/blob/main/coin_study/imgs/WUKONG.png?raw=true")),
            ctx,
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    entry fun mint(treasury_cap: &mut TreasuryCap<FAUCETCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}