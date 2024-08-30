/// Module: oliverxl_faucet
module move_coin::oliverxl_faucet {
    use std::option;
    use sui::coin;
    use sui::transfer::{public_freeze_object, public_share_object};
    use sui::url::Url;

    //OTW
    public struct OLIVERXL_FAUCET has drop {}

    fun init(witness: OLIVERXL_FAUCET, ctx: &mut TxContext) {
        // public fun create_currency<T: drop>(
        // witness: T,
        // decimals: u8,  6-10
        // symbol: vector<u8>,
        // name: vector<u8>,
        // description: vector<u8>,
        // icon_url: Option<Url>,
        // ctx: &mut TxContext
        // ): (TreasuryCap<T>, CoinMetadata<T>)
        let icon_url = option::none<Url>();

        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness,
            6,
            b"Faucet Coin",
            b"Faucet Coin",
            b"this is my Faucet Coin",
            icon_url,
            ctx
        );

        //不可变对象
        public_freeze_object(coin_metadata);

        //共享国库权限
        public_share_object(treasury_cap);
    }
}
