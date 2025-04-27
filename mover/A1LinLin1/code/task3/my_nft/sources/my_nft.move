/*
/// Module: my_nft
module my_nft::my_nft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module my_nft::display_nft {
    use std::string;
    use std::string::{utf8, String};
    use sui::tx_context::{Self, TxContext};
    use sui::package;
    use sui::display;
    use sui::object::{Self, UID};
    use sui::transfer;

    public struct My_NFT has key, store {
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
            utf8(b"{link}"),
            utf8(b"{image_url}"),
            utf8(b"sui nft"),
            utf8(b""),
            utf8(b"somebody"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<My_NFT>(
            &publisher,
            keys,
            values,
            ctx
        );

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));

        let nft = My_NFT {
            id: object::new(ctx),
            name: string::utf8(b"display nft"),
            image_url: string::utf8(b"https://avatars.githubusercontent.com/u/116293226?s=400&u=b9628112f43a958fd75d47efbc3bc6893397d546&v=4")
        };
        transfer::public_transfer(nft, tx_context::sender(ctx));
    }

    public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
        let id = object::new(ctx);
        let nft = My_NFT {
            id,
            name,
            image_url,
        };
        transfer::public_transfer(nft, tx_context::sender(ctx));
    }
}