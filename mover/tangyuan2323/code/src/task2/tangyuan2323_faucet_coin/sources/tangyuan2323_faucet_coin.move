
/// Module: tangyuan2323_faucet_coin
module tangyuan2323_faucet_coin::tangyuan2323faucetcoin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{TxContext};

    public struct TANGYUAN2323FAUCETCOIN has drop {}

    fun init(witness: TANGYUAN2323FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"TANGYUAN2323FAUCETCOIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);

        transfer::public_share_object(treasury);
    }
}

