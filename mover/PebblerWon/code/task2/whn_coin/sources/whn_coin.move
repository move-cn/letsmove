module whn_coin::whn_coin{
    use sui::coin::create_currency;
    use sui::tx_context::{ sender};

    public struct WHN_COIN has drop {}

    fun init(whn_coin:WHN_COIN,ctx: &mut TxContext) {
        
        let (treasury_cap,coin_metadata ) = create_currency(
            whn_coin,
            3,
            b"WHN",
            b"WHN",
            b"just for whn",
            option::none(),
            ctx,
        );
        transfer::public_freeze_object(coin_metadata);

        let my_address = sender(ctx);
        transfer::public_transfer(treasury_cap, my_address);
    }
    
}
