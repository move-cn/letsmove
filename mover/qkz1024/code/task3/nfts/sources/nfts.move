module nfts::nfts;
use std::string::String;
use sui::package;
use sui::display;
use sui::transfer::public_transfer;

public struct NFTS has drop {}

public struct NFT has key, store {
    id: UID,
    name: String,
    image_url: String,
}

fun init(otw: NFTS, ctx: &mut TxContext) {
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
    let mut display = display::new_with_fields<NFT>(
        &publisher, keys, values, ctx
    );

    // Commit first version of `Display` to apply changes.
    display.update_version();

    public_transfer(publisher, ctx.sender());
    public_transfer(display, ctx.sender());
}

public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
    let nft = NFT {id: object::new(ctx), name, image_url};
    public_transfer(nft, ctx.sender());
}