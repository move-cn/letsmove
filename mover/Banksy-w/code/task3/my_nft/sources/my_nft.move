
module my_nft::my_nft;


use std::string;
use std::string::{String, utf8};

// The creator bundle: these two packages often go together.
use sui::package;
use sui::display;
use sui::transfer;
use sui::transfer::public_transfer;
use sui::tx_context::sender;


/// The Hero - an outstanding collection of digital art.
public struct MYNFT has key, store {
    id: UID,
    name: String,
    image_url: String,
}

/// One-Time-Witness for the module.
public struct MY_NFT has drop {}

/// Claim the `Publisher` object in the module initializer
/// to then create a `Display`. The `Display` is initialized with
/// a set of fields (but can be modified later) and published via
/// the `update_version` call.
///
/// Keys and values are set in the initializer but could also be
/// set after publishing if a `Publisher` object was created.
fun init(otw:MY_NFT, ctx: &mut TxContext) {
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
        utf8(b"A true Hero of the Sui ecosystem!"),
        utf8(b"https://sui-heroes.io"),
        utf8(b"Unknown Sui Fan")
    ];

    // Claim the `Publisher` for the package!
    let publisher = package::claim(otw, ctx);

    // Get a new `Display` object for the `Hero` type.
    let mut display = display::new_with_fields<MYNFT>(
        &publisher, keys, values, ctx
    );

    // Commit first version of `Display` to apply changes.
    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
    let nft = MYNFT {
        id: object::new(ctx),
        name:string::utf8(b"Banksy-w"),
        image_url:string::utf8(b"https://avatars.githubusercontent.com/u/197375449?v=4"),
    };
    transfer::public_transfer(nft, sender(ctx));
}

/// Anyone can mint their `Hero`!
public entry fun mint(name: String, image_url: String, ctx: &mut TxContext)  {
    let nft = MYNFT {
        id: object::new(ctx),
        name,
        image_url
    };
    transfer::public_transfer(nft, sender(ctx));
}

