/// Module: my_nft
module my_nft::my_nft;
use std::string::String;
use sui::package;
use sui::display;
use sui::tx_context::sender;

public struct MyNFT has key, store {
    id: UID,
    name: String,
    image_url: String,
    description: String,
}

public struct MY_NFT has drop{}

fun init(otw: MY_NFT, ctx: &mut TxContext){
    let keys = vector[
        b"name".to_string(),
        b"image_url".to_string(),
        b"description".to_string(),
        b"project_url".to_string(),
        b"creator".to_string(),
    ];

    let values = vector[
        b"{name}".to_string(),
        b"{image_url}".to_string(),
        b"{description}".to_string(),
        b"https://github.com/wanxb".to_string(),
        b"wanxb".to_string(),
    ];

    let publisher = package::claim(otw, ctx);

    let mut display = display::new_with_fields<MyNFT>(
        &publisher, keys, values, ctx
    );

    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
}

public entry fun mint(name: String, image_url: String, description: String, ctx: &mut TxContext){
   let nft = MyNFT{
        id: object::new(ctx),
        name,
        image_url,
        description
    };

    transfer::public_transfer(nft, ctx.sender());
}

public entry fun transfer(
    nft: MyNFT, recipient: address, _: &mut TxContext
) {
    transfer::public_transfer(nft, recipient)
}