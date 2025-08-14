/// Module: everettfu_nft
module everettfu_nft::everettfu_nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct EverettfuNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    // ===== Events ===== 事件

    public struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    // ===== Public view functions ===== 公共视图函数

    /// 获取NFT的名称
    public fun name(nft: &EverettfuNFT): &string::String {
        &nft.name
    }

    /// 获取NFT的介绍
    public fun description(nft: &EverettfuNFT): &string::String {
        &nft.description
    }

    /// 获取NFT的链接
    public fun url(nft: &EverettfuNFT): &Url {
        &nft.url
    }

    // ===== Entrypoints ===== 入口函数

    /// 创建新的NFT
    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = EverettfuNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    /// 转移NFT给新的所有者
    public entry fun transfer(
        nft: EverettfuNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// 更新NFT的介绍
    public entry fun update_description(
        nft: &mut EverettfuNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// 永久删除NFT
    public entry fun burn(nft: EverettfuNFT, _: &mut TxContext) {
        let EverettfuNFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }
}

