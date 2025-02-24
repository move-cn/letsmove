module maybeok_nft::maybeok_nft;
use std::string;
use std::string::String;
use sui::transfer::transfer;
use sui::tx_context::{sender};

public struct MaybeokNFT has key{
    id:UID,
    name:String,
    image_url:String,

}

fun init(ctx:&mut TxContext){

    let maybeoknft=MaybeokNFT{
        id:object::new(ctx),
        name:string::utf8( b"MaybeOk NFT"),
        image_url:string::utf8(b"https://avatars.githubusercontent.com/u/22394215?u=ac963b3b1ad2ea8e81ba9a2e8416095c80a78076&v=4")
    };

     transfer(maybeoknft,sender(ctx));
}

public entry fun mint(url:String,ctx:&mut TxContext){
     let maybeoknft=MaybeokNFT{
        id:object::new(ctx),
        name:string::utf8(b"MaybeOk NFT"),
        image_url:url
    };

    transfer(maybeoknft,sender(ctx));


}