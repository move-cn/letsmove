
/// Module: Phigrosx_coin
module Phigrosx_coin::Phigrosx_coin {
    use std::option;
    use sui::coin;
    use sui::coin::{TreasuryCap, Coin};
    use sui::transfer::{public_transfer, public_freeze_object};
    use sui::tx_context;
    use sui::tx_context::TxContext;

    //Package ID: 0x522255fd30868201eb396ab15dc96b897baace87ebef40d84c241893bb760e1c
    // owner: 0xc0cdb34b1296c7b8cbf28e579ca95a07cf1443fa41a8c6d9f1cd5b20005cd188
    //TreasuryCap: 0xc4dcac73cccde889b35a244b2adf8d258b5a9371217103a653b65f1af3dfdd00
    // Transaction block: 8kKgVQ42HwLi6R61i4cPztAAcfBMywCRmRELNb6icHp2

    public struct PHIGROSX_COIN has drop{}
    // initialize the module
    fun init(witness: PHIGROSX_COIN, ctx: &mut TxContext){
        // create the coin and get the treasuryCap, denyCap and CoinMetadata
        let (treasuryCap, denyCap ,metadata) = coin::create_regulated_currency(
            witness,
            8,
            b"PC",
            b"PhigrosX Coin",
            b"the managed coin for test",
            option::none(),
            ctx
        );
        // transfer the treasuryCap to the sender
        public_transfer(treasuryCap, tx_context::sender(ctx));
        // transfer the denyCap to the sender so they can freeze ro unfreeze accounts
        public_transfer(denyCap, tx_context::sender(ctx));
        // freeze the metadata
        public_freeze_object(metadata);
    }

    // mint the coin
    public entry fun mint(cap: &mut TreasuryCap<PHIGROSX_COIN>, amount: u64, recipient: address, ctx: &mut TxContext){
        let coin = coin::mint(cap, amount, ctx);
        public_transfer(coin, recipient);
    }
}

