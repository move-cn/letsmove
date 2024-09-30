module hello_world::HUIWANG_WORLD_NFT {
    use sui::url::{Self, Url};
    use std::string;
    use sui::transfer::{ public_transfer};

    /// 有这个权限的才能调用当前合约铸造nft
    public struct AdminCap has key, store {
        id: UID
    }

    /// 定义结构体
    public struct NFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }


    /// 程序初始化逻辑
    fun init(ctx: &mut TxContext) {
        public_transfer(AdminCap { id: object::new(ctx) }, tx_context::sender(ctx));
    }

    /// 屏蔽警告
    #[allow(lint(self_transfer))]
    /// 铸造nft
    public entry fun mint(_: &mut AdminCap, name: vector<u8>, description: vector<u8>, url: vector<u8>, ctx: &mut TxContext) {
        //url链接转URL对象
        let urlObj = url::new_unsafe_from_bytes(url);

        // 构建nft对象
        let nft = NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: urlObj,
        };
        public_transfer(nft, tx_context::sender(ctx));
    }

    /// 转移
    public entry fun transfer(nft: NFT, recipient: address, _: &mut TxContext) {
        public_transfer(nft, recipient);
    }

    /// 销毁
    public entry fun burn(nft: NFT, _: &mut TxContext) {
        let NFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id);
    }
}
