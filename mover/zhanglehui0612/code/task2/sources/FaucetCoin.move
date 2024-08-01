module currency::faucet_coin {
    use sui::coin;
    use sui::tx_context::{TxContext, sender};
    use std::option;
    use sui::transfer;

    public struct FAUCET_COIN has drop {}

    fun init (faucet_coin: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) = coin::create_currency(
            faucet_coin,
            8,
            b"FAUCET_COIN",
            b"FAUCET_COIN",
            b"FAUCET_COIN",
            option::none(),
            ctx);
        transfer::public_freeze_object(coin_metadata);
        transfer::public_share_object(treasury_cap);
    }
}