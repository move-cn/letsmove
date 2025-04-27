module my_nft::my_nft;
use sui::transfer::transfer;
use sui::tx_context::sender;
use std::string;
use std::string::String;


public struct MyNft has key{
    id: UID,
    name: String,
    image_url: String,
}

fun init(ctx: &mut TxContext){
    let my_nft = MyNft{
        id:object::new(ctx),
        name:string::utf8(b"cyhzuishuai"),
        image_url:string::utf8(b"https://github.com/cyhzuishuai/images/blob/main/%E5%A4%B4%E5%83%8F.jpg?raw=true")
    };
    transfer(my_nft,sender(ctx))
}

public entry fun mint(recipient: address, ctx: &mut TxContext){
    let my_nft = MyNft{
        id:object::new(ctx),
        name:string::utf8(b"cyhzuishuai"),
        image_url:string::utf8(b"https://github.com/cyhzuishuai/images/blob/main/%E5%A4%B4%E5%83%8F.jpg?raw=true")
    };
    transfer(my_nft,recipient);
}

