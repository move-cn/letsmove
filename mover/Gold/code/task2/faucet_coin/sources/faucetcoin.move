/// Module: faucetcoin
module faucet_coin::faucetcoin {

    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::faucet_coin::FAUCETCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct FAUCETCOIN has drop {}

    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6, // decimals
            b"FGMC", // symbol
            b"Faucet Coin", // name
            b"Don't ask why", // description
            option::none(), // icon url
            ctx
        );

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_transfer(treasury, tx_context::sender(ctx));

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);
    }

    public entry fun mint(cap: &mut coin::TreasuryCap<FAUCETCOIN>, amount: u64, recv: address, ctx: &mut TxContext) {
        coin::mint_and_transfer<FAUCETCOIN>(cap, amount, recv, ctx);
    }

    public entry fun burn(treasury: &mut coin::TreasuryCap<FAUCETCOIN>, coin: coin::Coin<FAUCETCOIN>) {
        coin::burn(treasury, coin);
    }
}
