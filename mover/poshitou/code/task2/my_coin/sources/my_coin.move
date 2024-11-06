module my_coin::my_coin {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::sender;

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness,
            6,
            b"mycoin",
            b"",
            b"",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(coin_metadata);

        transfer::public_transfer(treasury_cap, sender(ctx));
    }
}