module task2::jintol {
    use std::option; 
    use sui::coin::{Self, Coin, TreasuryCap}; 
    use sui::transfer; 
    use sui::tx_context::{Self, TxContext}; 

    // 定义一个名为 JINTOL 的公共结构体，表示自定义的代币。
    // `has drop` 关键字表示这个结构体的实例可以被显式销毁。
    public struct JINTOL has drop {}

    // 定义一个初始化函数 `init`，用于创建和初始化 JINTOL 代币。
    fun init(witness: JINTOL, ctx: &mut TxContext) {
        // 使用 coin::create_currency 函数创建一个新的 JINTOL 代币。
        // 代币的精度为 6 位小数，名称为 "JT"，描述为 "jintol"。
        // `witness` 是创建货币的凭证，`ctx` 是交易上下文，用于管理交易的状态和事件。
        let (treasury_cap, metadata) = coin::create_currency(witness, 6, b"JT", b"jintol", b"", option::none(), ctx);
        
        // 将创建的代币元数据冻结，防止其在未来被修改。
        transfer::public_freeze_object(metadata);
        
        // 将金库权限对象 `treasury_cap` 转移给交易发送者（即初始化 JINTOL 的用户）。
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    /// 定义一个公开的铸币函数 `mint`，用于铸造新的 JINTOL 代币并将其转移给指定的接收者。
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<JINTOL>, // 引用 JINTOL 代币的金库权限，用于管理铸币操作。
        amount: u64, // 铸造的 JINTOL 代币数量。
        recipient: address, // 接收者的地址，将铸造的代币转移到这个地址。
        ctx: &mut TxContext // 交易上下文，包含交易的状态和事件。
    ) {
        // 调用 coin::mint 函数，铸造指定数量的 JINTOL 代币，并返回铸造的代币对象。
        let coin = coin::mint(treasury_cap, amount, ctx);
        
        // 使用 transfer::public_transfer 函数，将铸造的代币对象转移到接收者的地址。
        transfer::public_transfer(coin, recipient);
    }
}
