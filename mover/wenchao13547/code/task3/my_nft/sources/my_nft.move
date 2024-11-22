module my_nft::my_nft;
use std::string;
use std::string::String;
use sui::transfer::transfer;
use sui::tx_context::sender;
public struct MyNFT has key {
    id: UID,
    name: String,
    image_url: String,
}

fun init(ctx: &mut TxContext) {
    let my_nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"wenchao13547_my_nft"),
        image_url: string::utf8(
            b"https://th.bing.com/th/id/OIP.lmmCSF58ToGg5yqFOQqh8wHaHa?w=198&h=198&c=7&r=0&o=5&pid=1.7"
        )
    };
    transfer(my_nft, sender(ctx));
}


public entry fun mint(url: String, ctx: &mut TxContext) {
    let my_nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"wenchao13547_my_nft"),
        image_url: url
    };
    transfer(my_nft, sender(ctx));
}
public entry fun mint2(url: String, ctx: &mut TxContext) {
    let my_nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"wenchao13547_my_nft"),
        image_url: url
    };
    transfer(my_nft, sender(ctx));
}
public entry fun transfer_nft(nft: MyNFT, recipient: address) {
    transfer(nft, recipient);
}
