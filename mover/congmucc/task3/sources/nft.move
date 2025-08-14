module task3::nft {
    use std::string;
    use sui::event;
    use sui::object::{Self,ID,UID};
    use sui::url;
    use sui::url::Url;

    public struct EasonNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url
    }

    // events 事件
    public struct NFTMinted has copy, drop {
        Object_id: ID,
        creator: address,
        name: string::String
    }

    public fun get_name(nft: &EasonNFT): &string::String{
        &nft.name
    }
    public fun get_description(nft: &EasonNFT): &string::String {
        &nft.description
    }

    public fun get_url(nft: &EasonNFT): &Url {
        &nft.url
    }

    /// 创建新的nft
    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = EasonNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted{
            Object_id: object::id(&nft),
            creator: sender,
            name: nft.name
        });

        transfer::public_transfer(nft, sender);
    }

    /// 转移给新的所有者
    public entry fun transfer(nft: EasonNFT, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient);
    }

    /// 更新nft的介绍
    public entry fun update_description(
        nft: &mut EasonNFT,
        description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(description);
    }

    /// 销毁nft
    public entry fun burn(nft: EasonNFT, _: &mut TxContext) {
        let EasonNFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id);
    }

}