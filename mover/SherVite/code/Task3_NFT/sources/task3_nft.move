/*
/// Module: task3_nft
module task3_nft::task3_nft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module task3_nft::task3_nft{
    use std::string::{String,utf8};    
    use sui::transfer::transfer;     
    use sui::tx_context::sender;

    public struct NFT has key{
        id:UID,
        name:String,
        description:String,
        image_url:String,
    }

    fun init(ctx: &mut TxContext){
        let nft = NFT{
            id: object::new(ctx),
            name: utf8(b"SherVite NFT"),
            description: utf8(b"Task3 NFT"),
            image_url: utf8(b"https://avatars.githubusercontent.com/u/201323230?v=4"),
        };
        transfer(nft, sender(ctx));
    }

    public entry fun mint(ctx: &mut TxContext){
        let nft = NFT{
            id: object::new(ctx),
            name: utf8(b"SherVite NFT"),
            description: utf8(b"Task3 NFT"),
            image_url: utf8(b"https://avatars.githubusercontent.com/u/201323230?v=4"),
        };
        transfer(nft, sender(ctx)); 
    }

    public entry fun transfer_nft(receiver: address,ctx: &mut TxContext){
        let nft = NFT{
            id: object::new(ctx),
            name: utf8(b"SherVite NFT"),
            description: utf8(b"Task3 NFT"),
            image_url: utf8(b"https://avatars.githubusercontent.com/u/201323230?v=4"),
        };
        transfer(nft, receiver);
    }

}