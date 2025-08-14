/// Module: tangyuan2323_coin
module tangyuan2323_coin::tangyuan2323coin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct TANGYUAN2323COIN has drop {}

    fun init(witness: TANGYUAN2323COIN, ctx: &mut TxContext) {
        let (treasury, metadata) =
            coin::create_currency(witness, 6, b"TANGYUAN2323COIN", b"", b"", option::none(), ctx);

        transfer::public_freeze_object(metadata);

        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }
}

