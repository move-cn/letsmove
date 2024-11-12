/// Module: faucetcoin
module faucetcoin::faucetcoin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct FAUCETCOIN has drop {}

    /// Register the managed currency to acquire its `TreasuryCap`. Because
    /// this is a module initializer, it ensures the currency only gets
    /// registered once.
    fun init(otw: FAUCETCOIN, ctx: &mut TxContext) {
        // Get a treasury cap for the coin and give it to the transaction sender
        let (treasury_cap, metadata) = coin::create_currency<FAUCETCOIN>(
            otw,
            2,
            b"FAUCETCOIN",
            b"FaucetCoin",
            b"",
            option::none(),
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    // mint new coins
    public entry fun mint(treasury_cap: &mut TreasuryCap<FAUCETCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    // burn coins
    public entry fun burn(treasury_cap: &mut TreasuryCap<FAUCETCOIN>, coin: Coin<FAUCETCOIN>) {
        coin::burn(treasury_cap, coin);
    }
}
