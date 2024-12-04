module TheonInAuCoin::faucetcoin {
    use sui::coin;

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct FAUCETCOIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"MYC",           // symbol
            b"TheonInAu Faucet",       // name
            b"First Faucet", // description
            option::none(),   // icon url
            ctx
        );

        // transfer the 'TreasuryCap' to public
        transfer::public_share_object(treasury);
        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);
    }
}