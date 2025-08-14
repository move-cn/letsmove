module zhuaiballlcoin::zhuaiballlcoin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, sender};

    public struct ZHUAIBALLLCOIN has drop {}

    fun init(witness: ZHUAIBALLLCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 18, b"ZBC", b"Zbc", b"ZBC is zhuaiballl's coin", option::none(), ctx);
        transfer::public_freeze_object(metadata);

        transfer::public_transfer(treasury, ctx.sender())
    }
}