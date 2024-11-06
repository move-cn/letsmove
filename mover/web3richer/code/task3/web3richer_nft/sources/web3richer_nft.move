/// Module: web3richer_nft
module web3richer_nft::web3richer_nft {

    use std::string;
    use sui::event;
    use sui::url;
    use sui::url::Url;

    // NFT对象
    public struct Web3RicherNFT has key, store {
        id: UID,
        /// Name for the token 代币（NFT）名
        name: string::String,
        /// Description of the token 代币（NFT）描述
        description: string::String,
        /// URL for the token 代币（NFT）链接
        url: Url
    }

    public struct Web3RicherNFTMintEvent has copy, drop {
        // The Object ID of the NFT 新铸造的NFT的ID
        object_id: ID,
        // The creator of the NFT 新铸造的NFT的创造者
        creator: address,
        // The name of the NFT 新铸造的NFT的名
        name: string::String,
    }

    public struct Web3RicherNFTTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    /// 获取NFT的名称
    /// Get the NFT's `name`
    public fun name(nft: &Web3RicherNFT): &string::String {
        &nft.name
    }

    /// 获取NFT的介绍
    /// Get the NFT's `description`
    public fun description(nft: &Web3RicherNFT): &string::String {
        &nft.description
    }

    /// 获取NFT的链接
    /// Get the NFT's `url`
    public fun url(nft: &Web3RicherNFT): &Url {
        &nft.url
    }

    // ===== Entrypoints ===== 入口函数

    /// 创建新的NFT
    /// Create a new web3richer_nft
    public entry fun mint_to_sender(name: vector<u8>,description: vector<u8>,url: vector<u8>,ctx: &mut TxContext) {
        let sender = ctx.sender();
        let nft = Web3RicherNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(Web3RicherNFTMintEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);

    }

    /// 转移NFT给新的所有者
    /// Transfer `nft` to `recipient`
    public entry fun transfer(nft: Web3RicherNFT, recipient: address, ctx: &mut TxContext) {

        event::emit(Web3RicherNFTTransferEvent {
            object_id: object::id(&nft),
            from: ctx.sender(),
            to: recipient,
        });

        transfer::public_transfer(nft, recipient);
    }

    /// 更新NFT的介绍
    /// Update the `description` of `nft` to `new_description`
    public entry fun update_description(nft: &mut Web3RicherNFT, new_description: vector<u8>, _: &mut TxContext) {
        nft.description = string::utf8(new_description)
    }

    /// 永久删除NFT
    /// Permanently delete `nft`
    public entry fun burn(nft: Web3RicherNFT, _: &mut TxContext) {
        let Web3RicherNFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }
}

