/*
/// Module: my_nft
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions
module my_nft::my_nft;

use std::string::{Self, String};
use sui::display;
use sui::package;

public struct MyNFT has key, store {
    id: UID,
    name: String,
    image_url: String,
}

public struct MY_NFT has drop {}

fun init(otw: MY_NFT, ctx: &mut TxContext) {
    let keys = vector[
        b"name".to_string(),
        b"link".to_string(),
        b"image_url".to_string(),
        b"description".to_string(),
        b"project_url".to_string(),
        b"creator".to_string(),
    ];

    let values = vector[
        b"{name}".to_string(),
        b"https://github.com/HKing147".to_string(),
        b"{image_url}".to_string(),
        b"A true Hero of the Sui ecosystem!".to_string(),
        b"https://github.com/HKing147".to_string(),
        b"HKing147".to_string(),
    ];

    let publisher = package::claim(otw, ctx);

    let mut display = display::new_with_fields<MyNFT>(
        &publisher,
        keys,
        values,
        ctx,
    );

    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());

    let my_nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"HKing147-NFT"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/63294617?v=4"),
    };
    transfer::public_transfer(my_nft, ctx.sender());
}

/// 给调用者 mint 一个 NFT
public entry fun mint(url: String, ctx: &mut TxContext) {
    let my_nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"bytes"),
        image_url: url,
    };
    transfer::transfer(my_nft, ctx.sender());
}

/// 给指定地址 mint 一个 NFT
public entry fun mint_to(url: String, recipient: address, ctx: &mut TxContext) {
    let my_nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"bytes"),
        image_url: url,
    };
    transfer::transfer(my_nft, recipient);
}

