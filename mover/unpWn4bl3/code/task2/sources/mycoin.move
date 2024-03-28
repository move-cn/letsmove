module task2::mycoin{
    use std::option;
    use sui::coin::{Self,Coin,TreasuryCap};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;

    struct MYCOIN has drop {}

    fun init(witness:MYCOIN, ctx: &mut TxContext) {
        let (treasury,metadata) = coin::create_currency(witness,6,b"MYCOIN",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury,tx_context::sender(ctx));
    }
}