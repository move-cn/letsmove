
module nft::nft;

use std::string::{Self, String};
use sui::url::{Self, Url};
use sui::transfer::transfer;

public struct NFT has key {
    id: UID,
    name: String,
    url: Url
}

fun init(ctx: &mut TxContext) {
    let nft = NFT {
        id: object::new(ctx),
        name: string::utf8(b"sahab NFT"),
        url: url::new_unsafe(b"https://avatars.githubusercontent.com/u/162699534".to_ascii_string())
    };

    transfer(nft, ctx.sender());
}

public entry fun mint_to(receiver: address, ctx: &mut TxContext) {
    let nft = NFT {
        id: object::new(ctx),
        name: string::utf8(b"sahab NFT"),
        url: url::new_unsafe(b"https://avatars.githubusercontent.com/u/162699534".to_ascii_string())
    };

    transfer(nft, receiver);
}