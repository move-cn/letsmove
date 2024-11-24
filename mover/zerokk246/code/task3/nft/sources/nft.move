/// Module: nft
module nft::nft;
use std::string::{String};

public struct MyNFT has key {
    id: UID,
    name: String,
    image_url: String,
}

public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
    let nft = MyNFT{
        id: object::new(ctx),
        name: name,
        image_url: image_url,
    };

    transfer::transfer(nft, ctx.sender());
}   

public entry fun send(nft: MyNFT, to: address, _ctx: &mut TxContext) {
    transfer::transfer(nft, to);
}   

#[test_only]
public fun get_name(nft: &MyNFT): String {
    nft.name
}