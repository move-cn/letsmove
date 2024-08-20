/*
/// Module: my_token

*/

module my_token::july_nana_faucet_token {
    use std::option;
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::transfer::{public_transfer, public_freeze_object, public_share_object};
    use sui::tx_context::TxContext;

    public struct JULY_NANA_FAUCET_TOKEN has drop {}

    fun init(witness: JULY_NANA_FAUCET_TOKEN, ctx:&mut TxContext){
        let (treasuryCap,metadata)=coin::create_currency(
            witness,
            8,
            b"July-NANA Faucet",
            b"July-NANA Faucet Coin",
            b"Faucet coin published by July-NANA",
            option::none(),
            ctx
        );
        public_share_object(treasuryCap);
        public_freeze_object(metadata);
    }

    public fun mint(cap: &mut TreasuryCap<JULY_NANA_FAUCET_TOKEN>, amount:u64, recipient:address, ctx:&mut TxContext){
        coin::mint_and_transfer(cap,amount,recipient,ctx);
    }
}
