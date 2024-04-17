module lidashu_coin::lidashu_coin {
    use sui::coin;
    
    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct LIDASHU_COIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: LIDASHU_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"LDS",           // symbol
            b"LIDASHU move coin",       // name
            b"first step in sui move", // description
            option::none(),   // icon url
            ctx
        );

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_transfer(treasury, tx_context::sender(ctx));

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);
    }

    /// Manager can mint new coins
    public fun mint(
        treasury_cap: &mut coin::TreasuryCap<LIDASHU_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    /// Manager can burn coins
    public fun burn(treasury_cap: &mut coin::TreasuryCap<LIDASHU_COIN>, target: coin::Coin<LIDASHU_COIN>) {
        coin::burn(treasury_cap, target);
    }

}
