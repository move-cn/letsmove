module hello_world::hello_world {

    use std::string; // 标准库中的string模块
    use sui::object::{Self, UID}; // sui模块中的object模块
    use sui::transfer; // sui模块中的transfer模块,处理资产转移
    use sui::tx_context::{Self, TxContext}; // sui模块中的tx_context模块,处理交易上下文

    // 作为Sui网络中的一个存储对象，拥有唯一的键id
    struct HelloWorldObject has key, store {
        id: UID,
        text: string::String
    }

    #[lint_allow(self_transfer)] // 允许在此函数中进行自转移操作
    public fun mint(ctx: &mut TxContext) { // 接受TxContext作为参数。用于创建一个新的HelloWorldObject对象
        // 初始化一个HelloWorldObject实例
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        // 将新创建的HelloWorldObject对象传输给交易的发起者
        transfer::public_transfer(object, tx_context::sender(ctx));
    }

}

// 测试网：https://suiscan.xyz/testnet/object/0xea39d5d8336007350aad11071fc936a0bd6eeef349db65479b2f2f6190b7b303

// 调用: sui client call --package 0xea39d5d8336007350aad11071fc936a0bd6eeef349db65479b2f2f6190b7b303 --module hello_world --function mint  --gas-budget 10000000
// 调用记录再最底下Tx Blocks查看
