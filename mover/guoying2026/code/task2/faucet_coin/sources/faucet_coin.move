module faucet_coin::rmb {
    use sui::coin::{TreasuryCap, mint_and_transfer, burn, Coin};

    public struct RMB has drop {}

    /// 创建 `GY` 的 `TreasuryCap`
    /// 使用 `public_transfer` 模拟独享 mint 权限
    /// 为什么不用entry。是为了不让外部调用r
    /// 去掉public，也不要被其他模块调用
    /// gy是无法外部构造：GY 的实例只能由模块内部逻辑控制。
    fun init(rmb: RMB,ctx: &mut TxContext) {
        let (treasury_cap, metadata) = sui::coin::create_currency<RMB>(
            rmb,
            8,                  // decimals
            b"RMB",              // symbol
            b"RMB",     // name
            b"Guoying2026RMB", // description
            option::none(),     // icon_url
            ctx
        );

        // 冻结 metadata
        transfer::public_freeze_object(metadata);
        // 将 `TreasuryCap` 共享给所有人
        transfer::public_share_object(treasury_cap);
    }

    /// 独享 mint 权限
    public entry fun my_mint(treasury_cap: &mut TreasuryCap<RMB>, amount: u64, recipient: address, ctx: &mut TxContext) {
        mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    /// 支持销毁功能
    public entry fun my_burn(treasury_cap: &mut TreasuryCap<RMB>, coin: Coin<RMB>) {
        burn(treasury_cap, coin);
    }
}