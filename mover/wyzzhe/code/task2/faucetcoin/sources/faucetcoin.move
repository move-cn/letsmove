module faucetcoin::wyzzheFaucet {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct WYZZHEFAUCET has drop {}

    fun init(witness: WYZZHEFAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6, 
            b"WYZZHEFAUCET", 
            b"WYZ", 
            b"Power by wyz", 
            option::none(), 
            ctx
        );
        transfer::public_freeze_object(metadata);
        // treasury belong to anyone
        transfer::public_share_object(treasury)
    }

    // mint
    public fun mint(
    treasury_cap: &mut TreasuryCap<WYZZHEFAUCET>, 
    amount: u64, 
    recipient: address, 
    ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}