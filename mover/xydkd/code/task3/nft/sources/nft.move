/*
/// Module: nft
module nft::nft;
*/
/// Example of an unlimited "Sui Hero" collection - anyone can
/// mint their Hero. Shows how to initialize the `Publisher` and how
/// to use it to get the `Display<Hero>` object - a way to describe a
/// type for the ecosystem.
module nft::nft;

use std::string::String;
use sui::package;
use sui::display;
use sui::transfer::transfer;
use sui::tx_context::sender;

/// The Hero - an outstanding collection of digital art.
public struct Gitnft has key, store {
    id: UID,
    name: String,
    image_url: String,
}

/// One-Time-Witness for the module.
public struct NFT has drop {}

/// Claim the `Publisher` object in the module initializer 
/// to then create a `Display`. The `Display` is initialized with
/// a set of fields (but can be modified later) and published via
/// the `update_version` call.
///
/// Keys and values are set in the initializer but could also be
/// set after publishing if a `Publisher` object was created.
fun init(otw: NFT, ctx: &mut TxContext) {
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
        b"https://avatars.githubusercontent.com/u/77824857?v=4&size=64".to_string(),
        // Description is static for all `Hero` objects.
        b"A true Hero of the Sui ecosystem!".to_string(),
        // Project URL is usually static
        b"nothing".to_string(),
        // Creator field can be any
        b"xydkd".to_string(),
    ];

    // Claim the `Publisher` for the package!
    let publisher = package::claim(otw, ctx);

    // Get a new `Display` object for the `Hero` type.
    let mut display = display::new_with_fields<Gitnft>(
        &publisher, keys, values, ctx
    );

    // Commit first version of `Display` to apply changes.
    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
}

/// Anyone can mint their `Hero`!
public entry fun mint(name: String, image_url: String, ctx: &mut TxContext){
    let mygitnft = Gitnft {
        id: object::new(ctx),
        name,
        image_url
    };
    transfer(mygitnft,sender(ctx))
}

/// Anyone can mint their `Hero`!
public entry fun mint_to_anyone(name: String, image_url: String,recive:address, ctx: &mut TxContext){
    let mygitnft = Gitnft {
        id: object::new(ctx),
        name,
        image_url
    };
    transfer(mygitnft,recive)
}