module my_coin::rmb {
    use sui::coin::create_currency;
    use sui::url::Url;
    use std::option::none;
    public struct RMB has drop {}

    fun init(usd: RMB, ctx: &mut TxContext) {
        let no = none<Url>();
        let (treasury_cap, coin_metadata) = create_currency(
            usd,
            8,
            b"RMB",
            b"RMB",
            b"this id a RMB",
            no,
            ctx
        );
        sui::transfer::public_freeze_object(coin_metadata);
        sui::transfer::public_share_object(treasury_cap)
    }

}
