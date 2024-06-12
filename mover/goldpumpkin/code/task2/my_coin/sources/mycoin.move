/// Module: my_coin
module my_coin::mycoin {

    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct MYCOIN has drop {}

    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6, // decimals
            b"GMC", // symbol
            b"My Coin", // name
            b"Don't ask why", // description
            option::none(), // icon url
            ctx
        );

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_transfer(treasury, tx_context::sender(ctx));

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);
    }

    public entry fun mint(cap: &mut coin::TreasuryCap<MYCOIN>, amount: u64, recv: address, ctx: &mut TxContext) {
        coin::mint_and_transfer<MYCOIN>(cap, amount, recv, ctx);
    }

    public entry fun burn(treasury: &mut coin::TreasuryCap<MYCOIN>, coin: coin::Coin<MYCOIN>) {
        coin::burn(treasury, coin);
    }
}
