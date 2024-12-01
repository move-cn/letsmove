module my_nft::my_nft;
use std::string;
use std::string::String;
use sui::transfer::transfer;
use sui::tx_context::sender;

public struct MyNFT has key,store{
    id:UID,
    name:String,
    image_url: String,

}


fun init(ctx: &mut TxContext){

    let my_nft =MyNFT{
        id: object::new(ctx),
        name:string::utf8(b"cmdscz NFT"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/169383631"),
    };


    transfer(my_nft,sender(ctx));
}

public entry fun mint(url:String,ctx: &mut TxContext) {
    let my_nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"cmdscz NFT"),
        image_url: url
    };

    transfer(my_nft, sender(ctx));

}

public entry fun transfer_nft(nft: MyNFT, to: address) {
    transfer::public_transfer(nft, to);
}

