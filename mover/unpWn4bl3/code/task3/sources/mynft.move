module task3::movernft {
    use sui::url::{Self,Url};
    use sui::object::{Self,ID,UID};
    use std::string;
    use sui::tx_context::{Self,TxContext};
    use sui::event;
    use sui::transfer;

    struct MoverNFT has key,store{
        id:UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    struct NFTMinted has copy, drop{
        object_id:ID,
        creator:address,
        name:string::String,
    }

    public fun name(nft:&MoverNFT): &string::String {
        &nft.name
    }

    public fun description(nft:&MoverNFT): &string::String {
        &nft.description
    }

    public fun url(nft:&MoverNFT): &Url {
        &nft.url
    }

    public entry fun mint(
        name:vector<u8>,
        description:vector<u8>,
        url:vector<u8>,
        ctx:&mut TxContext
    ){
        let sender = tx_context::sender(ctx);
        let nft = MoverNFT{
            id:object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };
        event::emit(NFTMinted{
            object_id:object::id(&nft),
            creator:sender,
            name:nft.name,
        });
        transfer::public_transfer(nft,sender);
    }

    public entry fun transfer(
        nft:MoverNFT,
        recipient:address,
        _:&mut TxContext,
    ){
        transfer::public_transfer(nft,recipient)
    }

    public entry fun update_description(
        nft:&mut MoverNFT,
        new_description:vector<u8>,
        _:&mut TxContext,
    ){
        nft.description = string::utf8(new_description)
    }

    public entry fun burn(
        nft:MoverNFT,
        _:&mut TxContext
    ){
        let MoverNFT{id,name:_,url:_,description:_} = nft;
        object::delete(id)
    }
}