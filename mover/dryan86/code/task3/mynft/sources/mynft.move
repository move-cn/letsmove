module mynft::mynft;

use std::string;
use std::string::String;
use sui::tx_context::sender;

public struct MyNft has key, store {
    id: UID,
    name: String,
    image_url: String,
}

fun init(ctx: &mut TxContext){
    let my_nft = MyNft {
        id: object::new(ctx),
        name: string::utf8(b"dryan86 NFT"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/25659468?v=4"),
    };

    transfer::public_transfer(my_nft, sender(ctx))
}

public entry fun mint(url: String, ctx: &mut TxContext){
    let my_nft = MyNft{
        id: object::new(ctx),
        name: string::utf8(b"dryan86 NFT"),
        image_url: url,
    };

    transfer::public_transfer(my_nft, sender(ctx))
}

public entry fun mintTo(url: String, to: address, ctx: &mut TxContext){
    let my_nft = MyNft{
        id: object::new(ctx),
        name: string::utf8(b"dryan86 NFT"),
        image_url: url,
    };

    transfer::public_transfer(my_nft, to)
}