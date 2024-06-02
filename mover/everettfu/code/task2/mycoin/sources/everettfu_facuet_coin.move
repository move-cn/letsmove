/// Module: mycoin
module mycoin::everettfu_facuet_coin {
    use sui::coin::create_currency;
    use sui::tx_context::{TxContext, sender};
    use std::option;
    use sui::transfer;

    public struct EVERETTFU_FACUET_COIN has drop {}

    fun init(witness: EVERETTFU_FACUET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) =
            create_currency(
            witness,
            8,
            b"everettfu facuet coin",
            b"everettfu facuet coin",
            b"everettfu facuet coin",
            option::none(),
            ctx);

        transfer::public_freeze_object(coin_metadata);
        transfer::public_share_object(treasury_cap);
    }
}
