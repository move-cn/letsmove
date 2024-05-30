module mynft::mynft {
    use sui::url::{Self,Url};
    use std::string;
    use sui::object::{Self,ID,UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};


    public struct MyNFT has key, store{
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    // Events

    public struct NFTMinted has copy, drop{
        object_id: ID,
        creator: address,
        name: string::String
    }

    // create a mynft
    public fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ){
        let sender = tx_context::sender(ctx);
        let nft = MyNFT{
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };

        event::emit(NFTMinted{
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft,sender);
    }

    public fun transfer(
        nft: MyNFT,
        recipient: address,
        _:&mut TxContext
    ){
        transfer::public_transfer(nft,recipient)
    }

    public fun burn(nft: MyNFT, _:&mut TxContext){
        let MyNFT{id,name:_,description:_,url:_} = nft;
        object::delete(id)
    }
}