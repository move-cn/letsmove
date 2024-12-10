/*
/// Module: m2887_coin
module m2887_coin::m2887_coin;
*/
/*
/// Module: m2887_coin
module m2887_coin::m2887_coin;
*/

module m2887_coin::m2887_coin {   // 定义模块 M2887_coin
    use sui::coin::{Self, Coin, TreasuryCap}; // 引入 Coin 和 TreasuryCap 相关功能
    use sui::url::{Self, Url}; // 引入 URL 相关功能

    // 定义一种新的货币类型 M2887_COIN，且具有可丢弃的特性
    public struct M2887_COIN has drop {}

    // 初始化函数，用于创建该货币
    fun init(
        witness: M2887_COIN, // 货币的见证对象
        ctx: &mut TxContext // 交易上下文
    ) {
        // 调用 coin 模块创建货币，并设置相关参数
        let (treasury_cap, metadata) = coin::create_currency<M2887_COIN>(
            witness, // 见证对象
            9, // 小数位数
            b"M2887", // 货币符号
            b"M2887_COIN", // 货币代码
            b"M2887 Coin", // 货币名称
            option::some<Url>( // 货币相关的 URL
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/49989931" // 头像链接
                )
            ),
            ctx // 交易上下文
        );
        // 冻结元数据对象，确保其在交易过程中不会被修改
        transfer::public_freeze_object(metadata);
        // 将国库资本转移到交易的发送者地址
        transfer::public_transfer(
            treasury_cap,
            tx_context::sender(ctx) // 获取发送者地址
        )
    }

    // 公共入口函数，用于铸造新的 M2887_COIN 货币
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<M2887_COIN>, // 货币国库
        amount: u64, // 铸造的数量
        recipient: address, // 接收地址
        ctx: &mut TxContext // 交易上下文
    ) {
        // 调用 coin 模块的铸造和转移函数
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    // 公共函数，用于销毁 M2887_COIN 货币
    public fun burn(
        treasury_cap: &mut TreasuryCap<M2887_COIN>, // 货币国库
        coin: Coin<M2887_COIN> // 需要销毁的货币
    ) {
        // 调用 coin 模块的销毁函数
        coin::burn(treasury_cap, coin);
    }
}
