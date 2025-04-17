/// Module: my_nft
module my_nft::my_nft;
use std::string::{String, Self};
use sui::object;
use sui::transfer;
use sui::tx_context::sender;

public struct MyNFT has key {
    id: UID,
    name: String,
    image_url: String,
}

fun init(ctx: &mut TxContext) {
    let my_nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"Test NFT"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/48359478?s=400&u=a7010a302f736f46d1a815074735d789f812ca68&v=4"),
    };

    // 转移
    transfer::transfer(my_nft, sender(ctx));
}

// js访问方法需要用 entry

public entry fun mint(receiveAddress: address, ctx: &mut TxContext) {
    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"ProcariHana NFT"),
        image_url: string::utf8(
            b"https://avatars.githubusercontent.com/u/48359478?s=400&u=a7010a302f736f46d1a815074735d789f812ca68&v=4"
        ),
    };
    transfer::transfer(nft, receiveAddress);
}