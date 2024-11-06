// 定义模块名为 dyjj_coin，地址为 0x0
module 0x0::dyjj_coin {
    // 导入标准库和 Sui 相关模块
    use std::ascii::{ String, string };  // 字符串处理
    use std::string;                      // 字符串相关功能
    use sui::coin::{Self, Coin, TreasuryCap}; // 代币和财库的定义
    use std::option;                      // 选项类型
    use sui::transfer;                    // 转移功能
    use sui::tx_context::{Self, TxContext}; // 交易上下文
    use sui::url;                         // URL 处理
    
    // 定义常量 MIST，用于处理代币的单位（1 DYJJ_COIN = 1,000,000,000 MIST）
    const MIST: u64 = 1_000_000_000;

    // 定义公开结构体 DYJJ_COIN，具有 drop 特性（允许被销毁）
    public struct DYJJ_COIN has drop {}

    // 初始化函数，接收一个 DYJJ_COIN 的 witness 和交易上下文
    fun init(witness: DYJJ_COIN, ctx: &mut TxContext) {
        // 创建货币，并返回 treasury 和 metadata
        let (mut treasury, metadata) = coin::create_currency(
            witness,                        // 代币的见证
            9,                              // 小数位数
            b"DYJJ-Cyper",                 // 代币名称
            b"One Piece!",                 // 代币符号
            b"DYJJ game coin",             // 代币描述
            option::some(url::new_unsafe(string(b"https://avatars.githubusercontent.com/u/79622407"))), // 代币图标的 URL
            ctx                             // 交易上下文
        );

        // 冻结元数据对象，确保其不可变
        transfer::public_freeze_object(metadata);
        
        // 将铸币权限转移给交易发起者
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    // 公开入口函数，用于铸造新的 DYJJ_COIN
    public entry fun mint_in_my_module(treasury_cap: &mut TreasuryCap<DYJJ_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        // 铸造新的代币，数量为 amount * MIST
        let coin = coin::mint(treasury_cap, amount * MIST, ctx);
        
        // 将铸造的代币转移给指定接收者
        transfer::public_transfer(coin, recipient);
    }
}
