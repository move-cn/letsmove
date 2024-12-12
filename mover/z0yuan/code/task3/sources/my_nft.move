#[allow(unused_use, duplicate_alias)]
module my_nft::My_nft{
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    //NFT对象
    public struct NFT has key,store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }
    //NFT事件对象
    public struct NFTMinted has copy,drop{
        object_id: ID,
        creator: address,
        name: string::String,
    }
    //获取NFT名称
    public fun Get_name(nft: &NFT): &string::String {
        &nft.name
    }
    //获取NFT描述
    public fun Get_description(nft: &NFT): &string::String {
        &nft.description
    }
    //获取NFT图片链接
    public fun Get_url(nft: &NFT): &Url {
        &nft.url
    }
    //铸造NFT
    public entry fun Mint_to_sender(name: vector<u8>,description: vector<u8>,url: vector<u8>,ctx: &mut TxContext) {
        let sender = tx_context::sender(ctx);
        let nft = NFT{id: object::new(ctx),name: string::utf8(name),description: string::utf8(description),url: url::new_unsafe_from_bytes(url)};
        
        event::emit(NFTMinted{object_id: object::id(&nft),creator: sender,name: nft.name});

        transfer::public_transfer(nft, sender);
    }
    //发送NFT
    public entry fun transfer(nft: NFT, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient)
    }
    //更新NFT描述
    public entry fun update_description(nft: &mut NFT,new_description: vector<u8>,_: &mut TxContext) {
        nft.description = string::utf8(new_description)
    }
    //销毁NFT
    public entry fun burn(nft: NFT, _: &mut TxContext) {
        let NFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }
}