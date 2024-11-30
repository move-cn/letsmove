/*
/// Module: my_nft
module my_nft::my_nft;
*/
module my_nft::my_nft;

use sui::package;
use sui::display;
use std::string::{String, utf8};
use sui::tx_context::sender;

public struct JETHROZZ_NFT02 has key, store{
    id: UID,
    name: String,
    image_url: String,
}

public struct MY_NFT has drop {

}

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
        // For `name` one can use the `Hero.name` property
        b"{name}".to_string(),
        // For `link` one can build a URL using an `id` property
        b"https://sui-heroes.io/hero/{id}".to_string(),
        // For `image_url` use an IPFS template + `image_url` property.
        b"{image_url}".to_string(),
        // Description is static for all `Hero` objects.
        b"A true Hero of the Sui ecosystem!".to_string(),
        // Project URL is usually static
        b"https://sui-heroes.io".to_string(),
        // Creator field can be any
        b"Unknown Sui Fan".to_string(),
    ];

    // Claim the `Publisher` for the package!
    let publisher = package::claim(otw, ctx);

    // Get a new `Display` object for the `Hero` type.
    let mut display = display::new_with_fields<JETHROZZ_NFT02>(
        &publisher, keys, values, ctx
    );

    // Commit first version of `Display` to apply changes.
    display.update_version();


    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
    let nft = JETHROZZ_NFT02 {
        id: object::new(ctx),
        name: utf8(b"jethrozz_nft"),
        image_url: utf8(b"https://jethrowiki-1308786690.cos.ap-chongqing.myqcloud.com/mypicture%2Fimage%2Fdonkey.jpg")
    };
    transfer::public_transfer(nft, sender(ctx));
}

/// Anyone can mint their `Hero`!
public fun mint(name: String, image_url: String, ctx: &mut TxContext) {
    let nft = JETHROZZ_NFT02 {
        id: object::new(ctx),
        name,
        image_url
    };

    //生成一个nft转移给自己
    transfer::public_transfer(nft, sender(ctx));
}