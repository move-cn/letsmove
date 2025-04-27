/*
/// Module: task3
module task3::task3;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module task3::task3;
use std::string;
use std::string::String;
use sui::object;
use sui::object::UID;
use sui::transfer::transfer;
use sui::tx_context::{TxContext, sender};

public struct QweNFT has key{
    id: UID,
    name: String,
    image_url: String,
}


fun init(ctx: &mut TxContext) {
    let nft = QweNFT{
    id:object::new(ctx),
        name: string::utf8(b"qwe563470907 NFT"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/26663441?v=4"),
    };
    transfer(nft, ctx.sender() )
}

public entry fun mint(url: String, add: address, ctx: &mut TxContext) {
    let nft = QweNFT{
        id:object::new(ctx),
        name: string::utf8(b"qwe563470907 NFT"),
        image_url: url,
    };
    transfer(nft, add)
}