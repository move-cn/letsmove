module faucetcoin::fcoin {
    use sui::coin::{Self, TreasuryCap};

    public struct FCOIN has drop {}

    fun init(witness: FCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6, 
            b"LingLingccFaucet", 
            b"LingLingccFaucet", 
            b"faucet coin for test", 
            option::none(), 
            ctx
        );
        // freeze the currency
        transfer::public_freeze_object(metadata);
        // transfer the treasury to the sender
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<FCOIN>, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, 1000000, ctx);
        transfer::public_transfer(coin, recipient)
    }
}