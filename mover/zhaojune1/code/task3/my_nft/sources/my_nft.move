module my_nft::my_nft;
use std::string;
use std::string::String;
use sui::tx_context::sender;
use sui::transfer::transfer;

public struct MyNFT has key {
    id: UID,
    name: String,
    image_url: String
}

fun init(ctx: &mut TxContext) {
    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"zhaojune1 NFT"),
        image_url: string::utf8(
            b"https://avatars.githubusercontent.com/u/55168968?s=400&u=cc1dbe3c3074a5d47d1729ca75f80a494ec246ac&v=4"
        ),
    };
    transfer(nft, sender(ctx));
}

public fun mint(ctx: &mut TxContext) {
    // todo:缺少验证
    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"zhaojune1 NFT"),
        image_url: string::utf8(
            b"https://avatars.githubusercontent.com/u/55168968?s=400&u=cc1dbe3c3074a5d47d1729ca75f80a494ec246ac&v=4"
        ),
    };
    transfer(nft, @0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2);
}

