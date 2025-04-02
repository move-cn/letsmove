module my_coin::usd {
    use sui::coin::create_currency;
    use sui::url::Url;
    use std::option::none;
    public struct USD has drop {}

    fun init(usd: USD, ctx: &mut TxContext) {
        let no = none<Url>();
        let (treasury_cap, coin_metadata) = create_currency(
            usd,
            8,
            b"USD",
            b"USD",
            b"this id a USD",
            no,
            ctx
        );
        sui::transfer::public_freeze_object(coin_metadata);
        sui::transfer::public_transfer(
            treasury_cap,
            sui::tx_context::sender(ctx)
        )
    }

}
