/*
/// Module: my_nft
module my_nft::my_nft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module my_nft::my_nft;

// use std::ascii::{String, string};
use std::string;
use sui::tx_context::{sender};
use std::string::{utf8, String};
// use sui::transfer::transfer;



// The creator bundle: these two packages often go together.
use sui::package;
use sui::display;

public struct MyNFT has key, store {
    id: UID,
    name: String,
    image_url: String,
}

/// One-Time-Witness for the module.
public struct MY_NFT has drop {}

fun init(otw: MY_NFT, ctx: &mut TxContext) {
    let keys = vector[
        utf8(b"name"),
        utf8(b"link"),
        utf8(b"image_url"),
        utf8(b"description"),
        utf8(b"project_url"),
        utf8(b"creator"),
    ];

    let values = vector[
        utf8(b"{name}"),
        utf8(b"https://sui-heroes.io/hero/{id}"),
        utf8(b"{image_url}"),
        utf8(b"I love Aragaki Yui! always~"),
        utf8(b"https://sui-heroes.io"),
        utf8(b"Unknown Sui Fan")
    ];
    // Claim the `Publisher` for the package!
    let publisher = package::claim(otw, ctx);


    let mut display = display::new_with_fields<MyNFT>(
        &publisher, keys, values, ctx
    );

    display::update_version(&mut display);

    transfer::public_transfer(publisher, sender(ctx));
    transfer::public_transfer(display, sender(ctx));


    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"Aragaki Yui"),
        image_url: string::utf8(
            b"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMf7IFKBVMp8OCIQkww75L9bv9pUO0WAOLLA&s"
        ),
    };
    transfer::public_transfer(nft, sender(ctx));
}


public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
    let id = object::new(ctx);
    let nft = MyNFT { id, name, image_url };
    transfer::public_transfer(nft, sender(ctx));
}
// Aragaki Yui
// https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMf7IFKBVMp8OCIQkww75L9bv9pUO0WAOLLA&s
