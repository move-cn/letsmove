module TheonInAuCoin::mycoin {
    use sui::coin;

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct MYCOIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"MYC",           // symbol
            b"TheonInAu Coin",       // name
            b"First Coin", // description
            option::none(),   // icon url
            ctx
        );

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_transfer(treasury, ctx.sender());
        // transfer::public_transfer(treasury, 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2);

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);
    }
}