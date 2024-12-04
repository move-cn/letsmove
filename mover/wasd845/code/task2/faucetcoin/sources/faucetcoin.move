
/// Module: faucetcoin
module faucetcoin::faucetcoin {
    use sui::coin::{Self, TreasuryCap};

    public struct FAUCETCOIN has drop {}

    fun init(waitness: FAUCETCOIN, ctx: &mut sui::tx_context::TxContext) {
        let (treasury_cap, meta) = coin::create_currency(waitness, 8, b"WFCC", b"wasd845Faucet", b"wasd845Faucet Coin on task02", option::none(), ctx);
        transfer::public_freeze_object(meta);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(treasury_cap: &mut TreasuryCap<FAUCETCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}

