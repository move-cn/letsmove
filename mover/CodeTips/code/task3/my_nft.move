module my_nft::my_nft;
use std::string::String;
use sui::package;
use sui::display;
use sui::tx_context::sender;

public struct MyNFT has key, store{
    id: UID,
    name: String,
    image_url: String
}

public struct MY_NFT has drop {}

fun init(otw: MY_NFT, ctx: &mut TxContext){
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
        b"https://github.com/CodeTips".to_string(),
        b"{image_url}".to_string(),
        b"A CodeTips Test NFT!".to_string(),
        b"https://github.com/CodeTips/letsmove".to_string(),
        b"CodeTips".to_string(),
    ];

    let publisher = package::claim(otw, ctx);

    let mut display = display::new_with_fields<MyNFT>(
        &publisher, keys, values, ctx
    );

    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
}

public entry fun mint(recipient: address, name: String, image_url: String, ctx: &mut TxContext) {
    transfer::public_transfer(MyNFT {
        id: object::new(ctx),
        name,
        image_url
    },recipient)
}