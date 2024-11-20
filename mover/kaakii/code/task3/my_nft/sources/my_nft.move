
/// Module: my_nft
module my_nft::my_nft;
use std::string;
use std::string::String;
use std::string::bytes;
use sui::object;
use sui::transfer;
use sui::tx_context::sender;
use sui::transfer::transfer;

public struct MyNFT has key{
    id: UID,
    name: String,
    image_url: String,
}

fun init(ctx: &mut TxContext){

    let my_nft = MyNFT{
        id:object::new(ctx),
        name:string::utf8(b"kakicado NFT"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/116162460?s=400&u=440d00989711b56443a340bf2d7dff01d1a2e000&v=4")
    };
    transfer(my_nft,sender(ctx));
}

public entry fun mint(url:String, ctx: &mut TxContext) {
    let my_nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"kakicado NFT"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/116162460?s=400&u=440d00989711b56443a340bf2d7dff01d1a2e000&v=4")
    };
    transfer(my_nft, @0x718314d4e9e34570f27ab0162b20da5d75930db5825598ba440ff429b873316a);
}