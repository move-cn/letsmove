module my_coin::my_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self};

    // testnet package id:0xb348eb4b51b41b3dec746fde61b609849b52259e4d279cbf3b9fc269c28c9cf4 creator:0x6b1d06a358a3dbcf61c0f17bfa3813c199c1f23b90f0e8aa7fbfa9e9433c4f9c

    /// 代币的结构体，必须是模块名的大写版本
    public struct MY_COIN has drop {}

    /// 初始化代币
    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MY_COIN>(
            witness,                          // 代币的单例见证
            6,                                // 小数位数
            b"CPWH",                          // 符号
            b"coderpwh",                      // 名称
            b"CoderPWH (CPWH) 是一个基于 Sui 区块链的自定义代币，由开发者 pwh-pwh（GitHub: github.com/pwh-pwh）创建。CPWH 旨在为开发者社区提供一种轻量级、去中心化的价值交换工具，激励编程创新、知识分享和协作开发", // 描述
            option::some(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/56707259?v=4&size=128")), // 图标 URL
            ctx
        );
        transfer::public_freeze_object(metadata);       // 冻结元数据
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx)); // 转移 TreasuryCap
    }

    /// 铸造代币
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    /// 销毁代币
    public entry fun burn(
        treasury_cap: &mut TreasuryCap<MY_COIN>,
        coin: Coin<MY_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}
