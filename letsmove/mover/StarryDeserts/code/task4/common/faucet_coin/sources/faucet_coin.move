/// Module: faucet_coin
module faucet_coin::faucet_coin {
    use sui::coin::{Self, TreasuryCap};

    public struct FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness,
            6,
            b"SDF",
            b"StarryDesertsFaucet",
            b"this is StarryDeserts coin",
            option::none(),
            ctx
        );
        sui::transfer::public_freeze_object(coin_metadata);
        sui::transfer::public_share_object(treasury_cap);
    }

    public fun mint_in_my_module(treasury_cap: &mut TreasuryCap<FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}