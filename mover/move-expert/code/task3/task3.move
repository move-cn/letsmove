module task3::move410nft {
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Self, Url};
    use sui::event;
    use std::string::{utf8};
 

    struct Move410NFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url:Url,
    }

    struct NFTMint has copy, drop {
        object_id: ID,
        creater: address,
        name: string::String,
    }

    public entry fun mint(name: vector<u8>, description: vector<u8>, url: vector<u8>, recipient:address, ctx: &mut TxContext) {
        let sender = tx_context::sender(ctx);
        let nft = Move410NFT{id: object::new(ctx), name:utf8(name), description:utf8(description), url: url::new_unsafe_from_bytes(url)};
        event::emit(NFTMint{object_id: object::id(&nft), creater:sender, name:nft.name});
        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer(id:vector<u8>, recipient:address, ctx: &mut TxContext) {
        let Move410NFT{id} = nft;
        transfer::public_transfer(nft, recipient);
    }

    public entry fun burn(nft:Move410NFT, _ctx: &mut TxContext){
        let Move410NFT{id, name:_, description:_, url:_} = nft;
        object::delete(id);
    }
}