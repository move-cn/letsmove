/*
/// Module: my_nft
module my_nft::my_nft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module my_nft::my_nft;

use std::string;
use std::string::String;
use sui::transfer::transfer;
use sui::tx_context::sender;

public struct MyNFT has key {
    id: UID,
    name: String,
    // description: String,
    image_url: String,
}

fun init(ctx: &mut TxContext) {
    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"0x-zeros NFT"),
        image_url: string::utf8(b"https://madlads.s3.us-west-2.amazonaws.com/images/7308.png"),
    };

    transfer(nft, sender(ctx));

}

public entry fun mint(to: address, ctx: &mut TxContext) {
    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"0x-zeros NFT"),
        image_url: string::utf8(b"https://madlads.s3.us-west-2.amazonaws.com/images/7308.png"),
    };
    transfer(nft, to);
}