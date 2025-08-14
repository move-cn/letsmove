module ganeshys_faucet_coin::ganeshys_faucet_coin{
    use sui::coin::create_currency;
    use std::option::{Self, none, some};
    use sui::transfer::{ public_share_object, public_freeze_object };
    use sui::url::{Self, Url};

    public struct GANESHYS_FAUCET_COIN has drop {}

    fun init(ganeshys_faucet_coin: GANESHYS_FAUCET_COIN, ctx: &mut TxContext) {
        let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/27858108?v=4");
        let yes = some<Url>(url);

        // 创建代币并设置元信息
        let (treasury, coin_metadata) = create_currency(
            ganeshys_faucet_coin,
            8,  // 精度，小数点后8位
            b"ganeshys_FAUCET_COIN",  // 代币名称
            b"ganeshys_FAUCET_COIN",  // 代币符号
            b"This is my faucet coin",  // 描述
            yes,
            ctx
        );

        // 冻结元信息，禁止修改
        public_freeze_object(coin_metadata);

        // 分享代币对象供他人使用
        public_share_object(treasury)
    }
}
