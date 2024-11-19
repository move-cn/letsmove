module my_nft::my_nft;

use std::string;
use std::string::String;
use sui::package;
use sui::display;
use sui::tx_context::sender;

public struct NFT has key,store {
    id: UID,
    name: String,
    image_url: String,
}
public struct MY_NFT has drop {}

fun init(otw:MY_NFT,ctx: &mut TxContext){
    let keys = vector[
        b"id".to_string(),
        b"name".to_string(),
        b"image_url".to_string(),
    ];

    let values = vector[
        b"{id}".to_string(),
        b"{name}".to_string(),
        b"{image_url}".to_string(),
    ];

    // Claim the `Publisher` for the package!
    let publisher = package::claim(otw, ctx);

    // Get a new `Display` object for the `NFT` type.
    let mut display = display::new_with_fields<NFT>(
        &publisher, keys, values, ctx
    );

    // Commit first version of `Display` to apply changes.
    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());

    let mynft = NFT{
        id:object::new(ctx),
        name:string::utf8(b"zacarx nft"),
        image_url:string::utf8(b"https://aggregator.walrus-testnet.walrus.space/v1/3om0zV4j9AHvC5KSrcg3iyMU8zOavKhg3uT8q1rwap0"),
    };

    transfer::public_transfer(mynft,ctx.sender());
}


public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
    let mint_nft = NFT {
        id: object::new(ctx),
        name,
        image_url
    };
    transfer::public_transfer(mint_nft,ctx.sender());
}

public entry fun transfer_nft(nft: NFT, to: address) {
    transfer::public_transfer(nft, to);
}
