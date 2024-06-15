/// Module: faucet
module faucet::faucet {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct FAUCET has drop {}


    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: FAUCET, ctx: &mut TxContext) {
        let (mint_id, metadata) = coin::create_currency(witness, 6, b"FAUCET", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        //transfer::public_transfer(faucet, tx_context::sender(ctx));
        transfer::public_share_object(mint_id)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET>, 
        ctx: &mut TxContext,
    ) {
        let faucet_coin = coin::mint(treasury_cap, 10000000, ctx);
        transfer::public_transfer(faucet_coin, tx_context::sender(ctx))
    }

}
