/*
/// Module: my_nft
module my_nft::my_nft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module my_nft::my_nft {
    use std::{ 
        string::{String, utf8} 
    };
    use sui::{
        package,
        display,
        transfer::transfer,
        tx_context::sender
    };

    public struct NFT has key, store {
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
            b"https://github.com/{id}".to_string(),
            b"{image_url}".to_string(),
            b"tyasrioChao's first NFT!".to_string(),
            b"https://github.com/tyasrioChao".to_string(),
            b"tyasrioChao".to_string(),
        ];

        // Claim the `Publisher` for the package!
        let publisher = package::claim(otw, ctx);

        // Get a new `Display` object for the `NFT` type.
        let mut display = display::new_with_fields<NFT>(
            &publisher, keys, values, ctx
        );

        // Commit first version of `Display` to apply changes.
        display.update_version();

        transfer::public_transfer(publisher, ctx.sender());
        transfer::public_transfer(display, ctx.sender());
    }

    /// Anyone can mint their `NFT`!
    public fun mint(name: String, image_url: String, ctx: &mut TxContext): NFT {
        NFT {
            id: object::new(ctx),
            name,
            image_url
        }
    }

    public entry fun mint_and_transfer(recipient: address,ctx: &mut TxContext) {
        let nft = mint(
            utf8(b"tyasrioChao NFT"), 
            utf8(b"https://avatars.githubusercontent.com/u/19268838?s=400&u=ff7faa3dca89a24680e28a78d6562b2d69cf7246&v=4"), 
            ctx
        );
        transfer(nft, recipient);
    }
}
