module counter::counter;
use std::string;
use std::string::String;
use sui::transfer::transfer;
use sui::tx_context::sender;
// The creator bundle: these two packages often go together.
use sui::package;
use sui::display;

public struct MyNft has key {
    id: UID,
    name: String,
    image_url: String
}

public struct COUNTER has drop {}

fun init(otw: COUNTER, ctx: &mut TxContext) {
    let keys = vector[
        b"name".to_string(),
        b"link".to_string(),
        b"image_url".to_string(),
        b"description".to_string(),
        b"project_url".to_string(),
        b"creator".to_string(),
    ];

    let values = vector[
        // For `name` one can use the `Ant.name` property
        b"{name}".to_string(),
        // For `link` one can build a URL using an `id` property
        b"".to_string(),
        // For `image_url` use an IPFS template + `image_url` property.
        b"{image_url}".to_string(),
        // Description is static for all `Ant` objects.
        b"An Ant of the Sui ecosystem!".to_string(),
        // Project URL is usually static
        b"".to_string(),
        // Creator field can be any
        b"yhfysun Sui Fan".to_string(),
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

    let my_nft = MyNft {
        id: object::new(ctx),
        name: string::utf8(b"yhfysun NFT"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/48269774?v=4&size=64"),
    };
    transfer(my_nft, sender(ctx));
}

public entry fun mint(name: String, image_url: String, address: address, ctx: &mut TxContext) {
    let my_nft = MyNft {
        id: object::new(ctx),
        name,
        image_url,
    };
    transfer(my_nft, address);
}