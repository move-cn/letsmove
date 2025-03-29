/*
/// Module: first_move_nft
module first_move_nft::first_move_nft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module first_move_nft::first_move_nft{
    use std::string::{String,utf8};
    use sui::transfer::transfer;
     use sui::tx_context::sender;
    public struct NFT has key{
        id: UID,
        name: String,
        description: String,
        image_url: String,
    }

    fun init(ctx: &mut TxContext){
        let nft = NFT{
            id: object::new(ctx),
            name: utf8(b"Firefly NFT"),
            description: utf8(b"My first move NFT"),
            image_url: utf8(b"https://avatars.githubusercontent.com/u/143856635?v=4"),
        };
        transfer(nft, sender(ctx));
    }

    public entry fun mint(ctx: &mut TxContext){
        let nft = NFT{
            id: object::new(ctx),
            name: utf8(b"Firefly NFT"),
            description: utf8(b"My first move NFT"),
            image_url: utf8(b"https://avatars.githubusercontent.com/u/143856635?v=4"),
        };
        transfer(nft, sender(ctx));
    }

    public entry fun transfer_nft(receiver: address,ctx: &mut TxContext){
        let nft = NFT{
            id: object::new(ctx),
            name: utf8(b"Firefly NFT"),
            description: utf8(b"My first move NFT"),
            image_url: utf8(b"https://avatars.githubusercontent.com/u/143856635?v=4"),
        };
        transfer(nft, receiver);
    }
}
