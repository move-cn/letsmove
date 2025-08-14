module whn_coin_facuet::whn_coin{
    use sui::coin::create_currency;

    public struct WHN_COIN has drop {}

    fun init(whn_coin:WHN_COIN,ctx: &mut TxContext) {
        
        let (treasury_cap,coin_metadata ) = create_currency(
            whn_coin,
            3,
            b"WHN_FACUET",
            b"WHN",
            b"whn facuet",
            option::none(),
            ctx,
        );
        transfer::public_freeze_object(coin_metadata);

        transfer::public_share_object(treasury_cap);
    }
    
}
