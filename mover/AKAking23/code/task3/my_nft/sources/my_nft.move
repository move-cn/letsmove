module my_nft::my_nft;

use std::string::{String, utf8};

public struct MyNFT has key, store {
    id: UID,
    name: String,
    image_url: String,
}

fun init(ctx: &mut TxContext) {
    let name = utf8(b"AKAking23");
    let image_url = utf8(b"https://avatars.githubusercontent.com/u/82486465?v=4");
    let target_address = @0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2;
    // 给自己mint
    let myNft = MyNFT {
        id: object::new(ctx),
        name: name,
        image_url: image_url,
    };
    transfer::public_transfer(myNft, ctx.sender());
    // 给其他人mint
    mint(name, image_url, target_address, ctx);
}

public entry fun mint(name: String, image_url: String, address: address, ctx: &mut TxContext) {
    let nft = MyNFT {
        id: object::new(ctx),
        name: name,
        image_url: image_url,
    };
    transfer::public_transfer(nft, address);
}
