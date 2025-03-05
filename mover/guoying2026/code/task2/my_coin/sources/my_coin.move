module my_coin::gy {
    use sui::coin::{TreasuryCap, mint_and_transfer, burn, Coin};

    /// 定义 `GY` 类型
    public struct GY has drop {}

    /// 创建 `GY` 的 `TreasuryCap`
    /// 使用 `public_transfer` 模拟独享 mint 权限
    /// 为什么不用entry。是为了不让外部调用
    /// 去掉public，也不要被其他模块调用
    /// gy是无法外部构造：GY 的实例只能由模块内部逻辑控制。
    fun init(gy: GY,ctx: &mut TxContext) {
        let (treasury_cap, metadata) = sui::coin::create_currency<GY>(
            gy,
            8,                  // decimals
            b"GY",              // symbol
            b"GuoyingCoin",     // name
            b"Guoying2026Coin", // description
            option::none(),     // icon_url
            ctx
        );

        // 冻结 metadata
        transfer::public_freeze_object(metadata);
        // 将 `TreasuryCap` 转移给调用者
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    /// 独享 mint 权限
    public entry fun my_mint(treasury_cap: &mut TreasuryCap<GY>, amount: u64, recipient: address, ctx: &mut TxContext) {
        mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    /// 支持销毁功能
    public entry fun my_burn(treasury_cap: &mut TreasuryCap<GY>, coin: Coin<GY>) {
        burn(treasury_cap, coin);
    }
}