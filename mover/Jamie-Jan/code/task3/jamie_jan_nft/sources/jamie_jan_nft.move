module jamie_jan_nft::JANMIE_JAN_NFT;
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

public struct JANMIE_JAN_NFT has drop{}

fun init(otw:JANMIE_JAN_NFT,ctx:&mut TxContext){
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
    let jamie_jan_nft=MyNFT{
        id:object::new(ctx),
        name:string::utf8(b"JANMIE_JAN NFT"),
        image_url:url,
    };

    let send_nft=MyNFT{
        id:object::new(ctx),
        name:string::utf8(b"send_nft"),
        image_url:string::utf8(b"https://s1.imagehub.cc/images/2024/12/06/f2f657ee77dd947a09732e86afd886ac.jpg"),
    };

    transfer(jamie_jan_nft,ctx.sender());

    transfer(send_nft,recipient);
}