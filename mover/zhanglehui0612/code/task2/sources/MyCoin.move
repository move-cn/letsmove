module currency::my_coin {
    use sui::coin;
    use sui::tx_context::{TxContext, sender};
    use std::option;
    use sui::transfer;

    public struct MY_COIN has drop {}

    fun init (my_coin: MY_COIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) = coin::create_currency(
            my_coin,
            8,
            b"MY_COIN",
            b"MY_COIN",
            b"MY_COIN",
            option::none(),
            ctx);
        transfer::public_freeze_object(coin_metadata);
        transfer::public_transfer(treasury_cap, sender(ctx));
    }
}