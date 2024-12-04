/*
/// Module: my_nft
module my_nft::my_nft;
*/
module my_nft::my_nft;
use std::string;
use std::string::String;
use sui::transfer::transfer;
use sui::tx_context::sender;

public struct MYNFT has key{
    id:UID,
    name:String,
    image_url:String,
}

fun init(ctx:&mut TxContext){
    let my_nft = MYNFT{
        id:object::new(ctx),
        name:string::utf8(b"xushuhui346 NFT"),
        image_url:string::utf8(b"https://avatars.githubusercontent.com/u/19965482?s=400&u=a17a3e2ec8a1f020682d5e2a9413b61889be5968&v=4")
    };
    transfer(my_nft,sender(ctx));
}

public entry fun mint(url:address,image_url:String,ctx:&mut TxContext){
    let my_nft = MYNFT{
        id:object::new(ctx),
        name:string::utf8(b"xushuhui346 NFT"),
        image_url:image_url
    };
    transfer(my_nft,url);
}