/*
/// Module: my_coin
module my_coin::my_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module my_coin::my_coin {
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// The type identifier of MY_COIN (one-time witness type)
    public struct MY_COIN has drop {}

    /// The main Coin struct
    public struct MyCoin has drop {}

    /// Designated minter address
    const MINTER_ADDRESS: address = @0xfbe99c31d90be3aedaec6f25f837eeb32665a19416c51856a2feab6dce50da99;

    /// Error codes
    const ENotAuthorized: u64 = 0;

    /// Module initializer is called once on module publish
    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9, // decimals
            b"MYCOIN", // symbol
            b"My Coin", // name
            b"A custom coin for learning purposes", // description
            option::none(), // icon url
            ctx
        );
        // Transfer the treasury cap to the designated minter address
        transfer::public_transfer(treasury, MINTER_ADDRESS);
        // Make metadata immutable and share with everyone
        transfer::public_freeze_object(metadata);
    }

    /// Mint new coins. Only the designated minter address can mint.
    public fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        assert!(tx_context::sender(ctx) == MINTER_ADDRESS, ENotAuthorized);
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}