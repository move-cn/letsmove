/*
/// Module: my_nft
module my_nft::my_nft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module my_nft::MyNFT;

use std::string::{utf8, String};
use sui::object::{new};
use sui::transfer::transfer;
use sui::tx_context::sender;

public struct MyNFT has key {
    id: UID,
    name: String,
    image_url: String,
}

fun init(ctx: &mut TxContext) {
    let myNft = MyNFT {
        id: new(ctx),
        name: utf8(b"Riscver NFT"),
        image_url: utf8(b"https://avatars.githubusercontent.com/u/203748122")
    };

    transfer(myNft, sender(ctx));
}

public entry fun mint(url: String, ctx: &mut TxContext) {
    let myNft = MyNFT {
        id: new(ctx),
        name: utf8(b"Riscver NFT"),
        image_url: url
    };

    transfer(myNft, sender(ctx));
}
