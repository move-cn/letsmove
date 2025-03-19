module my_nft::my_nft;

use std::string::String;

use sui::package;
use sui::display;

public struct MyNFT has key {
    id: UID,
    name: String,
    image_url: String,
}

public struct MY_NFT has drop{}

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
        b"https://avatars.githubusercontent.com/u/8800287?s=400&v=4".to_string(),
        // For `image_url` use an IPFS template + `image_url` property.
        b"{image_url}".to_string(),
        // Description is static for all `Hero` objects.
        b"My first Sui NFT!".to_string(),
        // Project URL is usually static
        b"https://sui-heroes.io".to_string(),
        // Creator field can be any
        b"Unknown Sui Fan".to_string(),
    ];

    // Claim the `Publisher` for the package!
    let publisher = package::claim(otw, ctx);

    // Get a new `Display` object for the `Hero` type.
    let mut display = display::new_with_fields<MyNFT>(
        &publisher, keys, values, ctx
    );

    // Commit first version of `Display` to apply changes.
    display.update_version();
    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());

    
    let my_nft = MyNFT{
        id: object::new(ctx),
        name: std::string::utf8(b"my nft"),
        image_url: std::string::utf8(b"https://avatars.githubusercontent.com/u/8800287?s=400&v=4"),
    };
    
    transfer::transfer(my_nft, tx_context::sender(ctx));
}

public entry fun mint(url: String, ctx: &mut TxContext){
    let nft = MyNFT {
        id: object::new(ctx),
        name: std::string::utf8(b"my nft"),
        image_url: url,
    };

    transfer::transfer(nft, tx_context::sender(ctx));
}

public entry fun mintToUVD(ctx: &mut TxContext) {
    let my_nft = MyNFT{
    id: object::new(ctx),
    name: std::string::utf8(b"operaxxx nft"),
    image_url: std::string::utf8(b"https://avatars.githubusercontent.com/u/8800287?s=400&v=4"),
    };
    let uvd_address: address = @0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2;
    transfer::transfer(my_nft, uvd_address);
}