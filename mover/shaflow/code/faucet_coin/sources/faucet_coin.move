
/// Module: faucet_coin
module faucet_coin::faucetcoin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    public struct FAUCETCOIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"FAUCETCOIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public fun airdrop(treasury: &mut coin::TreasuryCap<FAUCETCOIN>,ctx: &mut TxContext){
        let airdrop_coin = coin::mint(treasury,100,ctx);
        transfer::public_transfer(airdrop_coin,tx_context::sender(ctx));
    }
}

