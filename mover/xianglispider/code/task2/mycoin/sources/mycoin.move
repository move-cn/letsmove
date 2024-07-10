module mycoin::mycoin {
    use sui::coin;
    // use sui::transfer;  
    use sui::tx_context::sender;
    use sui::url::Url;

    // public struct MY_COIN has drop {}
    public struct MYCOIN has drop {}

    // fun init(witness: MY_COIN, ctx: &mut TxContext) {
    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let icon_url = option::none<Url>();

        let (treasury_cap, coin_metadata) =
            coin::create_currency(witness, 6, b"xianglispider", b"xianglispider's coin", b"this is qian", icon_url, ctx);

        // 所有权共享  不可变共享
        transfer::public_freeze_object(coin_metadata);

        // 独享 国库管理权限菜单
        transfer::public_transfer(treasury_cap, sender(ctx));
    }
}
