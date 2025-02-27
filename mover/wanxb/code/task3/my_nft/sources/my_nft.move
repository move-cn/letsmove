/// Module: my_nft
module my_nft::my_nft;
use std::string;
use std::string::String;
use sui::transfer::transfer;
use sui::tx_context::sender;

public struct MyNFT has key{
    id: UID,
    name: String,
    image_url: String,
}
 
fun init(ctx: &mut TxContext){

    let my_nft = MyNFT{
        id: object::new(ctx),
        name: string::utf8(b"wanxb NFT"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/20410636"),
    };

    transfer(my_nft,sender(ctx));
}

public entry fun mint(url: String,ctx:&mut TxContext){

    let my_nft = MyNFT{
        id: object::new(ctx),
        name: string::utf8(b"wanxb NFT"),
        image_url: url,
    };

    transfer(my_nft,sender(ctx));
}