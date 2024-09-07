module my_token::july_nana_token {
    use std::option;
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::transfer::{public_transfer, public_freeze_object};
    use sui::tx_context::TxContext;

    public struct JULY_NANA_TOKEN has drop {}

    fun init(witness: JULY_NANA_TOKEN, ctx:&mut TxContext){
        let (treasuryCap,denyCap,metadata)=coin::create_regulated_currency(
            witness,
            8,
            b"July-NANA",
            b"July-NANA Coin",
            b"coin published by July-NANA",
            option::none(),
            ctx
        );
        public_transfer(treasuryCap,ctx.sender());
        public_transfer(denyCap,ctx.sender());
        public_freeze_object(metadata);
    }

    public fun mint(cap: &mut TreasuryCap<JULY_NANA_TOKEN>, amount:u64, recipient:address, ctx:&mut TxContext){
        let coin=coin::mint(cap,amount,ctx);
        public_transfer(coin,recipient);
    }
}
