module task2::jintol_faucet {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // 定义一个新的结构体 JINTOL_FAUCET，表示水龙头代币。`has drop` 关键字表示
    // 这个结构体可以被显式销毁，尽管它没有定义任何字段。
    public struct JINTOL_FAUCET has drop {}

    // 初始化 JINTOL_FAUCET 货币。这个函数通常在货币第一次创建时调用。
    fun init(witness: JINTOL_FAUCET, ctx: &mut TxContext) {
        // 创建货币并指定小数位数（这里是6位）。
        // 货币的名称是 "JTF"，描述为 "jintolFaucet"。额外的元数据（符号、描述等）
        // 可以传递，但这里大部分都留空。`option::none()` 用于可选元数据的位置。
        let (treasury_cap, metadata) = coin::create_currency(witness, 6, b"JTF", b"jintolFaucet", b"", option::none(), ctx);
        
        // 冻结元数据对象，防止其进一步修改。
        transfer::public_freeze_object(metadata);
        
        // 共享库藏对象，允许多个账户访问和使用这个代币库藏。
        transfer::public_share_object(treasury_cap);
    }

    // 定义一个公开函数，用于铸造新的 JINTOL_FAUCET 代币并将其转移给接收者。
    public entry fun mint(
        // 对 TreasuryCap 的可变引用，这是铸造新代币所需的。
        treasury_cap: &mut TreasuryCap<JINTOL_FAUCET>, 
        
        // 要铸造的 JINTOL_FAUCET 代币的数量。
        amount: u64, 
        
        // 接收者的地址，铸造的代币将发送给这个地址。
        recipient: address, 
        
        // 交易上下文，携带有关交易发起者和其他细节的信息。
        ctx: &mut TxContext
    ) {
        // 铸造指定数量的 JINTOL_FAUCET 代币。
        let coin = coin::mint(treasury_cap, amount, ctx);
        
        // 将铸造的 JINTOL_FAUCET 代币转移给接收者。
        transfer::public_transfer(coin, recipient);
    }
}


