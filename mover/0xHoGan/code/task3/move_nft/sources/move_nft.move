module move_nft::move_nft;

use std::string;
use std::string::String;

use sui::package;
use sui::display;

public struct NFT has key, store {
    id: UID,
    name: String,
    image_url: String,
}

public struct MOVE_NFT has drop {}

fun init(otw: MOVE_NFT, ctx: &mut TxContext) {
    let keys = vector[
        b"name".to_string(),
        b"image_url".to_string(),
    ];

    let values = vector[
        b"{name}".to_string(),
        b"{image_url}".to_string(),
    ];

    let publisher = package::claim(otw, ctx);

    let mut display = display::new_with_fields<NFT> (&publisher, keys, values, ctx);

    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender())
}

public entry fun mint(name: String, recipient: address, ctx: &mut TxContext) {
    let nft = NFT {
        id: object::new(ctx),
        name,
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/132683833?v=4")
    };
    transfer::public_transfer(nft, recipient);
}