
/// Module: my_nft
module PhigrosX_NFT::PhigrosX_nft {

    use std::string;
    use sui::event;
    use sui::object;
    use sui::object::{UID, ID};
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;
    use sui::url;
    use sui::url::Url;

    // define the struct of an NFT
    public struct PHIGROSX_NFT has key, store{
        id: UID,
        name: string::String,
        description: string::String,
        url: Url
    }
    // define the mint event
    // need copy because event::emit
    public struct NFTMinted has drop, copy{
        // use the ID because the relavnt function returns such
        object_id: ID,
        creator: address,
        // name the the NFT
        name: string::String
    }

    // mint the NFT
    entry  public fun mint_NFT(ctx: &mut TxContext){
        // get the sender via the TxContent
        let sender = tx_context::sender(ctx);
        //create the NFT
        let name = b"PhigrosX_NFT";
        let description = b"PhigrosX's NFT";
        let url = b"https://pic.imgdb.cn/item/661cc52c68eb93571375dea9.png";
        let nft = PHIGROSX_NFT{
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            // get the url through this way, which return Url
            url: url::new_unsafe_from_bytes(url)
        };
        // emit the event
        event::emit(NFTMinted{
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name
        });
        // transfer to the sender
        transfer::public_transfer(nft, sender);
    }

    // transfer the NFT to someone
    // here the ctx is useless so use _
   entry public fun transferNFT(nft: PHIGROSX_NFT, recipient: address, _: &mut TxContext){
        transfer::public_transfer(nft, recipient);
    }

    #[test_only]
    public fun test_mint(ctx: &mut TxContext){
        mint_NFT(ctx);
    }
    #[test_only]
    public fun test_transfer(nft:PHIGROSX_NFT ,addrB: address, _: &mut TxContext){
        transferNFT(nft, addrB,_);
    }
}

