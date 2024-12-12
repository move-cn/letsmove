module move_nft::move_nft {
    use std::string;

    /// 定义 NFT 的结构体
    public struct MoveNFT has key, store {
        id: object::UID,
        name: string::String, // 使用标准库的 String 类型
        image_url: string::String, // 使用标准库的 String 类型
    }

    /// 铸造 NFT
    public entry fun mint(name: string::String, url: string::String, ctx: &mut tx_context::TxContext) {
        // 创建 NFT 实例
        let my_nft = MoveNFT {
            id: object::new(ctx),
            name,
            image_url: url,
        };

        // 获取发送者地址并转移 NFT
        let recipient = tx_context::sender(ctx);
        transfer::public_transfer(my_nft, recipient);
    }
}