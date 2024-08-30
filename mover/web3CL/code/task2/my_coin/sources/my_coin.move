
/// Module: coin_test
module my_coin::my_coin {
    use sui::coin;
    use sui::url::Url;
    use sui::transfer::{public_transfer, public_freeze_object};
    use sui::tx_context::sender;
    


    public struct MY_COIN has drop{}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        
        let icon_url = option::none<Url>();

        
        let (treasury_cap, coin_metadata) = 
        coin::create_currency(witness, 8, b"web3CL_coin", b"web3CL's coin", b"this is a test coin from web3CL",icon_url, ctx);

        public_freeze_object(coin_metadata);

        public_transfer(treasury_cap, sender(ctx));

    }
    

}
