/*
/// Module: faucet_coin
module faucet_coin::faucet_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module faucet_coin::faucet_coin {
    use sui::coin::{Self, TreasuryCap};


    /// The type identifier of FAUCET_COIN (one-time witness type)
    public struct 
    
    FAUCET_COIN has drop {}

    /// The main Coin struct
    public struct FaucetCoin has drop {}

    /// Error codes
    const EAmountTooLarge: u64 = 0;

    /// Maximum amount that can be minted at once
    const MAX_MINT_AMOUNT: u64 = 100_000_000_000; // 100 coins (assuming 9 decimals)

    /// Module initializer is called once on module publish
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9, // decimals
            b"FAUCET", // symbol
            b"Faucet Coin", // name
            b"A faucet coin that anyone can mint", // description
            option::none(), // icon url
            ctx
        );
        // Share the treasury cap so anyone can mint
        transfer::public_share_object(treasury);
        // Make metadata immutable and share with everyone
        transfer::public_freeze_object(metadata);
    }

    /// Mint new coins. Anyone can mint, but there's a maximum amount per mint.
    public fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        // Check that mint amount is not too large
        assert!(amount <= MAX_MINT_AMOUNT, EAmountTooLarge);
        
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}


