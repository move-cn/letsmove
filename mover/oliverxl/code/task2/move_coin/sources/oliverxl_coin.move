/// Module: oliverxl_coin
module move_coin::oliverxl_coin {
    use std::option;
    use sui::coin;
    use sui::transfer::{public_freeze_object, public_transfer};
    use sui::tx_context::sender;
    use sui::url::Url;

    //OTW
    public struct OLIVERXL_COIN has drop {}

    fun init(witness: OLIVERXL_COIN, ctx: &mut TxContext) {
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
            b"CNY",
            b"RMB",
            b"this is my money",
            icon_url,
            ctx
        );

        //PackageID: 0x2fabc8d957987484eae7f3fe7e193affe32af5d2f79f6fb0bf24f4265e67d0ee
        //不可变对象
        public_freeze_object(coin_metadata);

        //独享国库权限 转移   0xd971214111ea63857a9064c413e93bef5361f70714f4a4b3a0f217c5523d563c
        public_transfer(treasury_cap,sender(ctx));
    }
}
