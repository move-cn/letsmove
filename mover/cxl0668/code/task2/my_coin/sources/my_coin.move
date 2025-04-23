/*
/// Module: task2
*/
module my_coin::cxl0668_coin{
    use sui::coin::create_currency;
    use std::option::{Self, none, some};
    use sui::transfer::{ public_transfer, public_freeze_object };
    use sui::url::{Self, Url};

    public struct CXL0668_COIN has drop {}

    fun init(cxl0668_coin: CXL0668_COIN, ctx: &mut TxContext) {
        let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/30109256?s=400&v=4");
        let yes = some<Url>(url);
        
        // 创建代币并设置元信息
        let (treasury, coin_metadata) = create_currency(
            cxl0668_coin,
            8,  // 精度，小数点后8位
            b"CXL0668_COIN",  // 代币名称
            b"CXL0668_COIN_COIN",  // 代币符号
            b"This is my coin",  // 描述
            yes,
            ctx
        );

		// 冻结元信息，禁止修改
        public_freeze_object(coin_metadata);
        
        // 将铸造的代币转移到部署地址
        public_transfer(treasury, ctx.sender())
    }
}
