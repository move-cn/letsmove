module my_coin::faucet_coin {
    use std::option;
    use sui::coin::{Self};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct FAUCET_COIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"FauC",           // symbol
            b"Faucet Coin",       // name
            b"Get some free coins!", // description
            option::none(),   // icon url
            ctx
        );

        transfer::public_share_object(treasury);

        transfer::public_freeze_object(metadata);
    }
}
