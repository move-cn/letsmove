/// Module: my_coin
module my_coin::usd{

    use std::option::{none};
    use sui::coin::create_currency;
    use sui::url::Url;
    use sui::transfer::{public_freeze_object,public_transfer};

    public struct USD has drop {}

    fun init(usd: USD, ctx: &mut TxContext){

        let no = none<Url>();

        let (currency_cap,metadata) = create_currency( usd, 8, b"USD", b"dollar", b"this is usd", no, ctx);

        public_freeze_object(metadata);

        public_transfer(currency_cap,ctx.sender());

    }

}
