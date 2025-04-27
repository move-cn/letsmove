module display_nft::display_nft ;
use std::string;
use sui::tx_context::{sender};
use std::string::{utf8, String};


use sui::package;
use sui::display;

public struct MyNFT has key, store {
    id: UID,
    name: String,
    image_url: String,
}

public struct DISPLAY_NFT has drop {}


fun init(otw: DISPLAY_NFT, ctx: &mut TxContext) {
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
        utf8(b"https://suivision.xyz/object/{id}"),
        utf8(b"{image_url}"),
        utf8(b"sui move dev!"),
        utf8(b"https://docs.sui.io/standards/display"),
        utf8(b"0x-zeros")
    ];

    let publisher = package::claim(otw, ctx);

    let mut display = display::new_with_fields<MyNFT>(
        &publisher, keys, values, ctx
    );

    display::update_version(&mut display);

    transfer::public_transfer(publisher, sender(ctx));
    transfer::public_transfer(display, sender(ctx));


    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"0x-zeros display nft"),
        image_url: string::utf8(
            b"https://madlads.s3.us-west-2.amazonaws.com/images/7308.png"
        ),
    };
    transfer::public_transfer(nft, sender(ctx));
}


public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
    let id = object::new(ctx);
    let nft = MyNFT { id, name, image_url };
    transfer::public_transfer(nft, sender(ctx));
}

public entry fun mintTo(to: address, ctx: &mut TxContext) {
    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"0x-zeros display nft"),
        image_url: string::utf8(
            b"https://madlads.s3.us-west-2.amazonaws.com/images/7308.png"
        ),
    };
    transfer::public_transfer(nft, to);
}