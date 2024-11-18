module nft::mynft;
use std::string::String;
use std::string;
use sui::transfer::transfer;

public struct MyNFT has key{
    id: UID,
    name:String,
    image_url:String,
}

// public fun mint() {
//
// }

fun init(ctx:&mut TxContext){
    let my_nft = MyNFT{
        id: object::new(ctx),
        name:string::utf8(b"linqining"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/18323181?s=400&u=1a7a274db375e0ffe9f303939d3283c5cedc1e25&v=4"),
    };
    transfer(my_nft,ctx.sender());
}

public entry fun mint(url:String,ctx:&mut TxContext){
    let my_nft = MyNFT{
        id: object::new(ctx),
        name:string::utf8(b"linqining"),
        image_url: url,
    };
    transfer(my_nft,ctx.sender());
}