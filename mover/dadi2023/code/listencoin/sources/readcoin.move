module listencoin::readcoin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct READCOIN has drop {}

    fun init(witness: READCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) =
            coin::create_currency(witness, 6, b"read", b"read and get coin", b"read and get coin", option::none(), ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }
}