module move_coin::my_move_coin {
    use sui::coin;
    use sui::pay;
    
    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct MY_MOVE_COIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: MY_MOVE_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"MCN",           // symbol
            b"My move coin",       // name
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
        treasury_cap: &mut coin::TreasuryCap<MY_MOVE_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    /// Manager can burn coins
    public fun burn(treasury_cap: &mut coin::TreasuryCap<MY_MOVE_COIN>, target: coin::Coin<MY_MOVE_COIN>) {
        coin::burn(treasury_cap, target);
    }

    /// Manager can mint new coins
    public entry fun faucet(
        treasury_cap: &mut coin::TreasuryCap<MY_MOVE_COIN>, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, 1000, tx_context::sender(ctx), ctx);
        coin::
    }


}
