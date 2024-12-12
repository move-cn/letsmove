// 定义模块为 unlizhao 的 NFT 模块
module task3::unlizhaonft {
    // 导入必要的标准库和 Sui 框架模块
    use std::string::{Self, String};
    use sui::object::{Self,UID, ID};
    use sui::tx_context::{TxContext, sender};

    // 定义 NFT 的总供应量常量
    const TOTAL_SUPPLY: u64 = 237u64;
    
    // 定义 NFT 的图像 URL 和描述
    const URL: vector<u8> = b"https://avatars.githubusercontent.com/u/25890413?v=4";
    const DISCRIPTION: vector<u8> = b"unlizhao nft";
    
    // 定义错误码，用于供应量超限时的错误处理
    const ETooManyNums: u64 = 0;

    // 定义 UnlizhaoNft 结构体，代表具体的 NFT
    // has key 表示可以作为区块链上的对象存储
    // has store 表示可以被转移和存储
    public struct UnlizhaoNft has key, store {
        id: UID,           // 唯一标识符
        idx: u64,          // NFT 的索引号
        description: String, // NFT 描述
        url: String,       // NFT 图像 URL
    }

    // 定义 NFT 铸造能力结构体，用于追踪和控制 NFT 铸造
    public struct UnlizhaoNftCap has key, store {
        id: UID,           // 唯一标识符
        cur_supply: u64    // 当前已铸造的 NFT 数量
    }

    // 初始化函数，在部署合约时创建 NFT 铸造能力
    fun init(ctx: &mut TxContext) {
        let unlizhao_nft_cap = UnlizhaoNftCap {
            id: object::new(ctx),     // 创建唯一 ID
            cur_supply: 0              // 初始供应量为 0
        };
        // 将 NFT 铸造能力转移给合约部署者
        transfer::public_transfer(unlizhao_nft_cap, sender(ctx));
    }

    // 公共入口函数，用于铸造新的 NFT
    public entry fun mint_nft(
        mint_cap: &mut UnlizhaoNftCap, // NFT 铸造能力引用
        ctx: &mut TxContext,           // 交易上下文
    ) {
        // 增加当前供应量
        mint_cap.cur_supply = mint_cap.cur_supply + 1;
        
        // 创建新的 NFT
        let nft = UnlizhaoNft {
            id: object::new(ctx),              // 创建唯一 ID
            idx: mint_cap.cur_supply,          // 设置 NFT 索引
            description: string::utf8(DISCRIPTION), // 设置描述
            url: string::utf8(URL)             // 设置 URL
        };
        
        // 检查是否超过总供应量
        assert!(mint_cap.cur_supply <= TOTAL_SUPPLY, ETooManyNums);
        
        // 将 NFT 转移给发送者
        transfer::public_transfer(nft, sender(ctx));
    }

    // 公共入口函数，用于转移 NFT 到指定地址
    public entry fun transfer(nft: UnlizhaoNft, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient)
    }
}