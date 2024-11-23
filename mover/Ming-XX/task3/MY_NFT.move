module my_nft::MY_NFT;
use std::string;
use std::string::{String, utf8};
use sui::transfer::transfer;
use sui::package;
use sui::display;


public struct MyNFT has key{
    id:UID,
    name:String,
    image_url:String,
}

public struct MY_NFT has drop{}

fun init(otw:MY_NFT,ctx:&mut TxContext){
    let keys=vector[
        utf8(b"name"),
        utf8(b"image_url"),
    ];

    let values=vector[
        utf8(b"{name}"),
        utf8(b"{image_url}"),
    ];

    let publisher = package::claim(otw, ctx);

    let mut display = display::new_with_fields<MyNFT>(
        &publisher, keys, values, ctx
    );

    display::update_version(&mut display);

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
}

public entry fun mint(url:String, recipient:address, ctx:&mut TxContext){
    let my_nft=MyNFT{
        id:object::new(ctx),
        name:string::utf8(b"Ming-XX NFT"),
        image_url:url,
    };

    let send_nft=MyNFT{
        id:object::new(ctx),
        name:string::utf8(b"send_nft"),
        image_url:string::utf8(b"https://img1.baidu.com/it/u=2774048779,1307844049&fm=253&fmt=auto&app=138&f=JPEG?w=609&h=609"),
    };

    transfer(my_nft,ctx.sender());

    transfer(send_nft,recipient);
}