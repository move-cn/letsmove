module task3::mint_nft;

use std::string::String;
use sui::package;
use sui::display;
use sui::tx_context::sender;
use sui::transfer::transfer;

public struct Mint has key, store {
    id: UID,
    name: String,
    image_url: String,
}

/// One-Time-Witness for the module.
public struct MINT_NFT has drop {}

/// Claim the `Publisher` object in the module initializer
/// to then create a `Display`. The `Display` is initialized with
/// a set of fields (but can be modified later) and published via
/// the `update_version` call.
///
/// Keys and values are set in the initializer but could also be
/// set after publishing if a `Publisher` object was created.
fun init(otw: MINT_NFT, ctx: &mut TxContext) {
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
        b"https://suivision.xyz/object/{id}".to_string(),
        b"{image_url}".to_string(),
        b"Welcome to 2025".to_string(),
        b"https://www.youtube.com/watch?v=dxSHl52rxCo".to_string(),
        b"V".to_string(),
    ];

    let publisher = package::claim(otw, ctx);

    let mut display = display::new_with_fields<Mint>(
        &publisher, keys, values, ctx
    );

    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
}


public entry fun mint_and_transfer(name: String, image_url: String, receiver: address, ctx: &mut TxContext) {
    let nft = Mint {
        id: object::new(ctx),
        name,
        image_url
    };
    transfer(nft, receiver);
}

public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
    let nft = Mint {
        id: object::new(ctx),
        name,
        image_url
    };
    transfer(nft, sender(ctx));
}