module my_nft::my_nft;

use std::string;
use std::string::String;
use sui::tx_context::{sender};

public struct My_NFT has key, store {
    id: UID,
    name: String,
    image_url: String,
}

// 初始化
fun init(ctx: &mut TxContext) {
    // 创建 My_NFT 实例
    let myNFT = My_NFT {
        id: object::new(ctx),
        name: string::utf8(b"Blaze Leon's NFT!"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/48305889?v=4"),
    };
    transfer::public_transfer(myNFT, sender(ctx));
}

// 用户自定义 mint nft
public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
    let myNFT = My_NFT {
        id: object::new(ctx),
        name: name,
        image_url: image_url,
    };
    transfer::public_transfer(myNFT, sender(ctx));
}

// mint nft 给指定用户地址
public entry fun mint_and_transfer(reciever: address, ctx: &mut TxContext) {
    // 创建 My_NFT 实例
    let myNFT = My_NFT {
        id: object::new(ctx),
        name: string::utf8(b"Blaze Leon"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/48305889?v=4"),
    };
    // 将 NFT 发送给接收地址
    transfer::public_transfer(myNFT, reciever);
}
