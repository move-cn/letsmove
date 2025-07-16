/*
/// Module: nft
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module nft::nft_demo;

use std::string::{Self, utf8, String};
use sui::display;
use sui::package;
use sui::tx_context::sender;

/// NFT結構體，代表一個可收藏的數位資產
public struct MyNFT has key, store {
    id: UID,
    name: String,
    image_url: String,
}

/// One-time witness 用於創建 Display
public struct NFT_DEMO has drop {}

/// 初始化函數，設置 NFT Display 並鑄造第一個 NFT
fun init(otw: NFT_DEMO, ctx: &mut TxContext) {
    // 定義 Display 的 keys
    let keys = vector[
        utf8(b"name"),
        utf8(b"link"),
        utf8(b"image_url"),
        utf8(b"description"),
        utf8(b"project_url"),
        utf8(b"creator"),
    ];

    // 定義 Display 的 values
    let values = vector[
        utf8(b"{name}"),
        utf8(b"https://sui-heroes.io/hero/{id}"),
        utf8(b"{image_url}"),
        utf8(b"A true Hero of the Sui ecosystem!"),
        utf8(b"https://github.com/Jack-751"),
        utf8(b"Jack-751"),
    ];

    // 聲明 publisher
    let publisher = package::claim(otw, ctx);

    // 創建 Display 對象
    let mut display = display::new_with_fields<MyNFT>(
        &publisher, 
        keys, 
        values, 
        ctx
    );

    // 更新 Display 版本
    display::update_version(&mut display);

    // 轉移 publisher 和 display 給發送者
    transfer::public_transfer(publisher, sender(ctx));
    transfer::public_transfer(display, sender(ctx));

    // 鑄造第一個 NFT
    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"Jack-751 NFT"),
        image_url: string::utf8(
            b"https://avatars.githubusercontent.com/u/81602637?v=4"
        ),
    };
    
    transfer::public_transfer(nft, sender(ctx));
}

/// 公共鑄造函數，允許任何人鑄造新的 NFT
public entry fun mint_nft(
    name: String, 
    image_url: String, 
    ctx: &mut TxContext
) {
    let id = object::new(ctx);
    let nft = MyNFT { id, name, image_url };
    transfer::public_transfer(nft, sender(ctx));
}

/// 轉移 NFT 給指定接收者
public entry fun transfer_nft(
    nft: MyNFT,
    recipient: address,
    _: &mut TxContext
) {
    transfer::public_transfer(nft, recipient);
}
