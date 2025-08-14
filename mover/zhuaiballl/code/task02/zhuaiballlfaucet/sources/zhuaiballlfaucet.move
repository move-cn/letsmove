module zhuaiballlfaucet::zhuaiballlfaucet {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, sender};

    public struct ZHUAIBALLLFAUCET has drop {}

    fun init(witness: ZHUAIBALLLFAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 18, b"ZBF", b"Zbf", b"ZBF is zhuaiballl's faucet", option::none(), ctx);
        transfer::public_freeze_object(metadata);

        transfer::public_share_object(treasury);
    }
}