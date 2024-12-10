module faucetcoin::bright_faucet_coin {
    use sui::tx_context::TxContext;
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer;
    use std::option;

    public struct BRIGHT_FAUCET_COIN has drop {}

    fun init(witness: BRIGHT_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6,
            b"BrightFaucet", 
            b"bright faucet coin", 
            b"faucet_token", 
            option::none(), 
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<BRIGHT_FAUCET_COIN>, 
        amount: u64, 
        recipient: address, 
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}