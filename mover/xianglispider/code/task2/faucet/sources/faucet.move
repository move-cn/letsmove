/*
/// Module: faucet
module faucet::faucet {

}
*/
module faucet::faucet {
    use sui::coin;
    // use sui::transfer;  
    use sui::tx_context::sender;
    use sui::url::Url;

    public struct FAUCET has drop {}

    fun init(witness: FAUCET, ctx: &mut TxContext) {
        let icon_url = option::none<Url>();

        let (treasury_cap, coin_metadata) =
            coin::create_currency(witness, 6, b"xianglispiderFaucet", b"xianglispider's coin Faucet", b"this is qian", icon_url, ctx);

        // 所有权共享  不可变共享
        transfer::public_freeze_object(coin_metadata);

        // 共享 国库管理权限
        transfer::public_share_object(treasury_cap);
    }
}
