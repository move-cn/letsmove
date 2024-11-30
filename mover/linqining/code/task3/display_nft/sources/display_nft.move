module display_nft::display_nft;
use std::string::String;
use std::string;
use sui::package;
use sui::display;

public struct MyNFT has key,store{
    id: UID,
    name:String,
    image_url:String,
}

public struct DISPLAY_NFT has drop{

}

fun init(otw:DISPLAY_NFT,ctx:&mut TxContext){

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
    let mut display = display::new_with_fields<MyNFT>(
        &publisher, keys, values, ctx
    );

    // Commit first version of `Display` to apply changes.
    display.update_version();
    transfer::public_transfer(publisher,ctx.sender());
    transfer::public_transfer(display,ctx.sender());

    let my_nft = MyNFT{
        id: object::new(ctx),
        name:string::utf8(b"linqining"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/18323181?s=400&u=1a7a274db375e0ffe9f303939d3283c5cedc1e25&v=4"),
    };
    transfer::public_transfer(my_nft,ctx.sender())
}

public entry fun mint(url:String,ctx:&mut TxContext){
    let my_nft = MyNFT{
        id: object::new(ctx),
        name:string::utf8(b"linqining"),
        image_url: url,
    };
    transfer::public_transfer(my_nft,ctx.sender());
}