module my_nft::my_nft;
use std::string;
use std::string::String;
use sui::tx_context::sender;
use sui::transfer::transfer;

public struct MyNFT has key {
    id: UID,
    name: String,
    url: String
}

fun init(ctx: &mut TxContext) {
    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"RecursionHs NFT"),
        url: string::utf8(b"https://avatars.githubusercontent.com/u/36094328?v=4")
    };
    transfer(nft, sender(ctx));
}

public entry fun mint(url: String, ctx: &mut TxContext) {
    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"RecursionHs input url NFT"),
        url
    };
    transfer(nft, sender(ctx));
}
