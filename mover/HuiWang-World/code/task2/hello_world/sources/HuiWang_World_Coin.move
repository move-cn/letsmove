module hello_world::HuiWang_World_Coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Url,Self};

    /// 定义结构体
    public struct HUIWANG_WORLD_COIN has drop {

    }
    /// 屏蔽警告
    #[allow(lint(share_owned))]
    /// 初始化方法 合约在部署的的时候会进行初始化
    fun init(witness:HUIWANG_WORLD_COIN, ctx: &mut TxContext) {
        // 创建一个 coin
        let (treasury_cap, metadata) = coin::create_currency<HUIWANG_WORLD_COIN>(
            witness,
            3,
            b"HuiWang_World",
            b"HuiWang_World",
            b"Move-cn Faucet Task Coin by HuiWang_World",
        option::some<Url>(url::new_unsafe_from_bytes(b"https://imagedelivery.net/cBNDGgkrsEA-b_ixIp9SkQ/sui.svg/public")),
            ctx
        );

        transfer::public_freeze_object(metadata);//冻结coin原数据
        transfer::public_share_object(treasury_cap);//共享coin所有权
    }
    /// 铸造币 mint
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<HUIWANG_WORLD_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    /// 销毁币 Coin
    public entry fun burn(treasury_cap: &mut TreasuryCap<HUIWANG_WORLD_COIN>, coin: Coin<HUIWANG_WORLD_COIN>) {
        coin::burn(treasury_cap, coin);
    }
    /// 水龙头 cap:coin类型,amount:token数量,recv:接收地址
    public entry fun faucet(cap: &mut coin::TreasuryCap<HUIWANG_WORLD_COIN>, amount: u64, recv: address, ctx: &mut TxContext) {
        coin::mint_and_transfer<HUIWANG_WORLD_COIN>(cap, amount, recv, ctx);
    }
}