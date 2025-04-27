module my_nft::my_nft;

use std::string::{String,utf8};

public struct MyNFT has key,store {
    id: UID,
    name: String,
    image_url: String,
}

fun init(ctx:&mut TxContext) {
    let name = utf8(b"coderpwh");
    let image_url = utf8(b"https://avatars.githubusercontent.com/u/56707259?v=4");
    let d_address = @0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2;
    let nft = MyNFT {
        id: object::new(ctx),
        name: name,
        image_url: image_url,
    };
    transfer::public_transfer(nft,ctx.sender());
    mint(name, image_url, d_address, ctx);
}

public entry fun mint(name: String, image_url: String, address: address, ctx: &mut TxContext) {
    let nft = MyNFT {
        id: object::new(ctx),
        name: name,
        image_url: image_url,
    };
    transfer::public_transfer(nft, address);
}
