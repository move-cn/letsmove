
/// Module: Phigrosx_Faucet_coin
module Phigrosx_Faucet_coin::Phigrosx_Faucet_coin {
    use std::option;
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::transfer::{ public_transfer, public_freeze_object};
    use sui::tx_context;
    use sui::tx_context::{TxContext};

    //PackageID: 0x0a70fab0335c3a65192c686d2df34c0074f0d08e30471428a5f9819401e3e381
    //Sender: 0xc0cdb34b1296c7b8cbf28e579ca95a07cf1443fa41a8c6d9f1cd5b20005cd188
    //TreasuryCap: 0x82f57fdc88aa31913808c17d4d6a5f19db127c9c53ffcca555ea90deb1013119


    // create an one time witness
    public struct PHIGROSX_FAUCET_COIN has drop{}

    // create a module initializer
    fun init(witness: PHIGROSX_FAUCET_COIN, ctx: &mut TxContext){
        // create the coin and get the treasuryCap and CoinMetadata
        let (treasury, metadata) = coin::create_currency(
            witness,
            8,
            b"PFC",
            b"PhigrosX Faucet coin",
            b"the faucet coin for test",
            option::none(),
            ctx
        );
        // transfer the treasuryCap to the sender
        public_transfer(treasury, tx_context::sender(ctx));
        // freaze the metadate
        public_freeze_object(metadata);
    }

    // mint the move coin
    // ctx SHOULD BE THE LAST ONE
    // only the contract deployer can use the function
    public entry fun mint(cap: &mut TreasuryCap<PHIGROSX_FAUCET_COIN>, value: u64,  recipient: address, ctx: &mut TxContext){
        // mint and ytansfer to the recipient
        coin::mint_and_transfer(cap, value, recipient, ctx);
    }
}

