/// Module: mycoin
module mycoin::everettfu_coin {
    use sui::coin::create_currency;
    use sui::tx_context::{TxContext, sender};
    use std::option;
    use sui::transfer;

    public struct EVERETTFU_COIN has drop {}

    fun init(witness: EVERETTFU_COIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) =
            create_currency(
            witness,
            8,
            b"everettfu coin",
            b"everettfu coin",
            b"everettfu coin",
            option::none(),
            ctx);

        transfer::public_freeze_object(coin_metadata);
        transfer::public_transfer(treasury_cap, sender(ctx));
    }
}
