/*
/// Module: flynft
*/
module flynft::flynft;

use std::string;
use std::string::{utf8, String};
use sui::tx_context::{sender};
use sui::package;
use sui::display;


// 定义 NFT 对象类型
public struct FlyNFT has key, store {
    id: UID,
    name: String,
    image_url: String,
}

// 定义具备 drop 能力的模块大写同名结构体
public struct FLYNFT has drop {}

// 初始化函数，设置 NFT 显示信息

fun init(otw: FLYNFT, ctx: &mut TxContext) {
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
        utf8(b""),
        utf8(b"{image_url}"),
        utf8(b"TFly's Personal NFT"),
        utf8(b""),
        utf8(b"TFly"),
    ];

    let publisher = package::claim(otw, ctx);

    let mut display = display::new_with_fields<FlyNFT>(
                            &publisher, 
                            keys, 
                            values,
                            ctx);

    display::update_version(&mut display);

    transfer::public_transfer(publisher, sender(ctx));
    transfer::public_transfer(display, sender(ctx));

    let nft = FlyNFT {
        id: object::new(ctx),
        name: string::utf8(b"TFly's NFT"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/u/57241557?s=400&u=cdf0873e82f6f5cb0e1612e3d1fad24d036305bf&v=4"),
    };
    transfer::public_transfer(nft, sender(ctx));
}

public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
    let nft = FlyNFT {
        id: object::new(ctx),
        name: name,
        image_url: image_url,
    };
    transfer::public_transfer(nft, sender(ctx));
}
// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


