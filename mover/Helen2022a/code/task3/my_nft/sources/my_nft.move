module my_nft::my_nft;

use std::string::String;

// The creator bundle: these two packages often go together.
use sui::package;
use sui::display;

/// The MyNft - an outstanding collection of digital art.
public struct MyNft has key, store {
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
        // For `name` one can use the `MyNft.name` property
        b"{name}".to_string(),
        // For `link` one can build a URL using an `id` property
        b"https://github.com/{name}".to_string(),
        // For `image_url` use an IPFS template + `image_url` property.
        b"{image_url}".to_string(),
        // Description is static for all `MyNft` objects.
        b"First NFT from Helen2022a !".to_string(),
        // Project URL is usually static
        b"https://github.com/{name}/letsmove".to_string(),
        // Creator field can be any
        b"Helen2022a".to_string(),
    ];

    // Claim the `Publisher` for the package!
    let publisher = package::claim(otw, ctx);

    // Get a new `Display` object for the `MyNft` type.
    let mut display = display::new_with_fields<MyNft>(
        &publisher, keys, values, ctx
    );

    // Commit first version of `Display` to apply changes.
    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
}

public entry fun mint_and_send(name: String, image_url: String, recipient:address, ctx: &mut TxContext) {
    let myNFT = MyNft {
        id: object::new(ctx),
        name,
        image_url
    };
    transfer::transfer(myNFT,recipient);
}
