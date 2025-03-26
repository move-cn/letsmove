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
use sui::transfer::{public_transfer, transfer};
use sui::tx_context::{TxContext};

public struct Beson77NFT has key {
    id: UID,
    name: String,
    description: String,
    image_url: String

}

public entry fun mint_nft(url: String, mint:address, ctx: &mut TxContext) {
    let nft = Beson77NFT{
        id: object::new(ctx),
        name: string::utf8(b"Beson77-NFT"),
        description: string::utf8(b"Beson77-NFT desc"),
        image_url:url
    };
    transfer(nft, mint);
}
