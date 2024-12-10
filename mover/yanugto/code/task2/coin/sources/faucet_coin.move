/// Module: my_coin
module my_coin::faucet_coin{

    use std::option::{none};
    use sui::coin::create_currency;
    use sui::url::Url;
    use sui::transfer::{public_freeze_object,public_share_object};

    public struct FAUCET_COIN has drop {}

    fun init(faucet_coin: FAUCET_COIN, ctx: &mut TxContext){

        let no = none<Url>();

        let (currency_cap,metadata) = create_currency( faucet_coin, 8, b"FaucetCoin", b"faucet coin", b"this is faucet coin", no, ctx);

        public_freeze_object(metadata);

        public_share_object(currency_cap);

    }

}
