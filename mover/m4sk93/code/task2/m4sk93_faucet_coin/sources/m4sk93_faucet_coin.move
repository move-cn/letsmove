/// Module: m4sk93_faucet_coin
module m4sk93_faucet_coin::m4sk93_faucet_coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::M4SK93_FAUCET_COIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct M4SK93_FAUCET_COIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: M4SK93_FAUCET_COIN, ctx: &mut TxContext) {
        ///let (treasury, metadata) = coin::create_currency(witness, 6, b"M4SK93_FAUCET_COIN", b"", b"", option::none(), ctx);
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                  // decimals
            b"MK",              // symbol
            b"M4sk93 Coin",     // name
            b"",                // description
            option::none(),     // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);

        ///transfer::public_transfer(treasury, tx_context::sender(ctx));
        ///The Coin<T> is a generic implementation of a coin on Sui.
        ///Access to the TreasuryCap provides control over the minting and burning of coins.
        ///Further transactions can be sent directly to the sui::coin::Coin with TreasuryCap object as authorization.


        transfer::public_share_object(treasury)
    }

    ///public fun mint(
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<M4SK93_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}
