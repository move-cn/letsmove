/// Module: faucet_coin
module faucet_coin::faucet_coin {
    use sui::coin::{Self, TreasuryCap};

    public struct FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            8,
            b"FAUCET_COIN",
            b"FAUCET_COIN",
            b"FAUCET_COIN",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(
        treasry: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasry, amount, recipient, ctx);
    }
}
