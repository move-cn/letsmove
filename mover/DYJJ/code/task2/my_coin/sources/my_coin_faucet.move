module 0x0::dyjj_faucet {
    use std::ascii::{ String, string }; // 导入字符串处理模块
    use std::string; // 导入字符串类型
    use sui::coin::{Self, Coin, TreasuryCap}; // 导入币相关结构和特性
    use std::option; // 导入选项类型
    use sui::transfer; // 导入转账模块
    // self导入前面的module本身。如果没有self，后面使用的时候就要写sui::tx_context::xx.写了self就只需tx_context::就好了
    use sui::tx_context::{Self, TxContext}; // 导入交易上下文
    const MIST:u64 = 1_000_000_000; // 定义单位常量，用于代币精度
    use sui::url; // 导入URL处理模块

    public struct DYJJ_FAUCET has drop{} // 定义公共结构体DYJJ_FAUCET，带有drop特性
    fun init(witness: DYJJ_FAUCET, ctx: &mut TxContext){ // 初始化函数，接收结构体和上下文
        let (treasury, metadata) = coin::create_currency(witness,9,b"Dyjj-faucet",b"dyjj_faucet",b"Dyjj_token",option::some(url::new_unsafe(string(b"http://i2.hdslb.com/bfs/face/a959c72407b2ac553d4328fd76d55d0134e20f65.png"))),ctx); // 创建新的货币，并返回国库和元数据
        transfer::public_freeze_object(metadata); // 将元数据对象冻结
        // Sender: tx_context 模块中的 sender 函数会根据接收的上下文提取并返回发起交易的账户的地址。
        // 以下是将铸币权限转移给合约部署者。treasury控制着代币的铸造权，只有拥有TreasuryCap的实体才能铸造新的代币。
        transfer::public_share_object(treasury); // 分享国库对象，使其可被其他对象使用
    }
    public entry fun mint_in_my_module(treasury_cap: &mut TreasuryCap<DYJJ_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) { // 公共入口函数，铸币功能
        let coin = coin::mint(treasury_cap,  amount*MIST, ctx); // 使用国库铸造指定数量的代币
        transfer::public_transfer(coin, recipient); // 将铸造的代币转移给指定接收者
    }
}
