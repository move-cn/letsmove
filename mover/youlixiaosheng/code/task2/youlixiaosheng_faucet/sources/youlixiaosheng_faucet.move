module youlixiaosheng_faucet::youlixiaosheng_faucet {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::url::{Self,Url};

    public struct YOULIXIAOSHENG_FAUCET has drop {}

    #[allow(lint(share_owned))]
    fun init(youlixiaosheng_faucet: YOULIXIAOSHENG_FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<YOULIXIAOSHENG_FAUCET>(
            youlixiaosheng_faucet,
            9,
            b"YOULIXIAOSHENG_FAUCET",
            b"YOULIXIAOSHENG_FAUCET",
            b"youlixiaosheng's faucet coin.",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/147264753?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<YOULIXIAOSHENG_FAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<YOULIXIAOSHENG_FAUCET>,
        coin: Coin<YOULIXIAOSHENG_FAUCET>) {
        coin::burn(treasury_cap, coin);
    }

}