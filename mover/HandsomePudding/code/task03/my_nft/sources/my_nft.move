module my_nft::my_nft;
use std::string::String;
use sui::transfer::transfer;
use std::string;
use sui::url::Url;
use sui::url;

public struct MYNTF has key,store{
    id: UID,
    name: String,
    image_url: Url,
}


public entry fun mint_to_self(name: String, ctx: &mut TxContext){
    let my_nft = MYNTF{
        id: object::new(ctx),
        name: name,
        image_url: url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/65163370?v=4")
    };
    transfer(my_nft, ctx.sender())
}

public entry fun mint_to_others(name: String, recipient: address, ctx: &mut TxContext){
    let my_nft = MYNTF{
        id: object::new(ctx),
        name: name,
        image_url: url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/65163370?v=4")
    };
    transfer(my_nft, recipient)
}