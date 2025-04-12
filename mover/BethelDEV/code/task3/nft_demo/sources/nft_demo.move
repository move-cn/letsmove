module nft_demo::nft_demo ;
use std::string;
use sui::tx_context::{sender};
use std::string::{utf8, String};


use sui::package;
use sui::display;

public struct MyNFT has key, store {
    id: UID,
    name: String,
    image_url: String,
}

public struct NFT_DEMO has drop {}


fun init(otw: NFT_DEMO, ctx: &mut TxContext) {
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
        utf8(b"https://github.com/BethelDev"),
        utf8(b"BethelDev")
    ];

    let publisher = package::claim(otw, ctx);

    let mut display = display::new_with_fields<MyNFT>(
        &publisher, keys, values, ctx
    );

    display::update_version(&mut display);

    transfer::public_transfer(publisher, sender(ctx));
    transfer::public_transfer(display, sender(ctx));


    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"BethelDev nft"),
        image_url: string::utf8(
            b"https://avatars.githubusercontent.com/u/50044804?v=4"
        ),
    };
    transfer::public_transfer(nft, sender(ctx));
}


public entry fun mint_nft(name: String, image_url: String, ctx: &mut TxContext) {
    let id = object::new(ctx);
    let nft = MyNFT { id, name, image_url };
    transfer::public_transfer(nft, sender(ctx));
}

public entry fun transfer_nft(
    nft: MyNFT,
    recipient: address,
    _: &mut TxContext
) {
    transfer::public_transfer(nft, recipient);
}
