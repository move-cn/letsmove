module nft::nft {
   use std::string::{Self, String, utf8};
    use sui::object::{UID, ID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Self, Url};
    use sui::object;
    use sui::event;

    // NFT 结构体
    public struct MYNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
        image_url: Url,
    }

    // NFT 铸造事件
    public struct MYNFTMintedEvent has copy, drop {
        object_id: ID,
        creator: address,
        name: String,
    }

    // 获取 NFT 的名称
    public fun name(nft: &MYNFT): &String {
        &nft.name
    }

    // 获取 NFT 的描述
    public fun description(nft: &MYNFT): &String {
        &nft.description
    }

    // 获取 NFT 的 URL
    public fun url(nft: &MYNFT): &Url {
        &nft.url
    }

    // 获取 NFT 的图片 URL
    public fun image_url(nft: &MYNFT): &Url {
        &nft.image_url
    }

    // 铸造 NFT
    public entry fun mint(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        image_url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = MYNFT {
            id: object::new(ctx),
            name: utf8(name),
            description: utf8(description),
            url: url::new_unsafe_from_bytes(url),
            image_url: url::new_unsafe_from_bytes(image_url),
        };
        // 发送铸造事件
        event::emit(MYNFTMintedEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });
        // 转移 NFT
        transfer::public_transfer(nft, sender);
    }

    // 转移 NFT
    public entry fun transfer(nft: MYNFT, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient);
    }

    // 更新 NFT 描述
    public entry fun update_description(
        nft: &mut MYNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = utf8(new_description);
    }

    // 销毁 NFT
    public entry fun burn(nft: MYNFT, _: &mut TxContext) {
        let MYNFT { id, name: _, description: _, url: _, image_url: _ } = nft;
        object::delete(id);
    }
}
