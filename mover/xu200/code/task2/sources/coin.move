module task2::xu200_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    // 定义一个公共结构体 XU200_COIN，具有 drop 权限
    public struct XU200_COIN has drop {}

    // 初始化函数，创建新的货币
    fun init(witness: XU200_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<XU200_COIN>(
            witness,
            9, // 小数位数
            b"XU200_COIN", // 名称
            b"XU200", // 符号
            b"learning for letsmove, power by supersodawater", // 描述
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/87858460")),
            ctx
        );
        transfer::public_freeze_object(metadata); // 冻结元数据对象
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx)) // 转移国库对象给发送者
    }

    // 公开入口函数，用于铸造新币并转移给接收者
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<XU200_COIN>,
        amount: u64, // 铸造的金额
        recipient: address, // 接收者地址
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx); // 铸造并转移币
    }

    // 公开函数，用于销毁指定的货币
    public fun burn(
        treasury_cap: &mut TreasuryCap<XU200_COIN>, 
        coin: Coin<XU200_COIN> // 要销毁的币
    ) {
        coin::burn(treasury_cap, coin); // 销毁币
    }
}
