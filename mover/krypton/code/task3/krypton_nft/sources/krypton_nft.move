module krypton_nft::krypton_nft;

use std::string;
use std::string::String;
use sui::transfer::transfer;
use sui::tx_context::sender;
use sui::object::UID; // 引入 UID 类型

// MyNFT 结构体，包含 creator 字段
public struct MyNFT has key {
    id: UID,
    name: String,
    image_url: String,
    creator: address,  // 添加 creator 字段，用于存储创建者地址
}

// 初始化功能：创建并转移 NFT 到发送者
fun init(ctx: &mut TxContext) {
    let my_nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"Kry NFT"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/154910746?v=4"),
        creator: ctx.sender(), // 设置 creator 字段
    };
    transfer(my_nft, sender(ctx));
}

// 铸造 NFT 并转移给发送者
public entry fun mint(url: String, ctx: &mut TxContext) {
    let my_nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"Kry NFT"),
        image_url: url,
        creator: ctx.sender(), // 设置 creator 字段
    };
    transfer(my_nft, sender(ctx));
}

// 转移 NFT 到另一个地址
public entry fun transfer_nft(nft: MyNFT, to_address: address, ctx: &mut TxContext) {
    // 确保转移 NFT 的地址与发送者一致
    assert!(nft.creator == sender(ctx));

    transfer(nft, to_address);  // 将 NFT 转移到目标地址
}
