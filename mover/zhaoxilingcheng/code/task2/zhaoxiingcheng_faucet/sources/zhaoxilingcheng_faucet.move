// Module: zhaoxilingcheng_faucet
module zhaoxilingcheng_faucet::zhaoxilingcheng_faucet {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::url::{Self,Url};

    public struct ZHAOXILINGCHENG_FAUCET has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: ZHAOXILINGCHENG_FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<ZHAOXILINGCHENG_FAUCET>(
            witness,
            9,
            b"ZHAOXILINGCHENG_FAUCET",
            b"ZHAOXILINGCHENG_FAUCET",
            b"zhaoxilingcheng's faucet coin, everyone can access and mutate.",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/30566370?v=4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<ZHAOXILINGCHENG_FAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<ZHAOXILINGCHENG_FAUCET>,
        coin: Coin<ZHAOXILINGCHENG_FAUCET>
    ) {
        coin::burn(treasury_cap, coin);
    }
}