module my_nft::my_nft;

use std::string;
use sui::event;
use sui::url::{Self, Url};
use sui::object::{Self, UID};
use sui::transfer;
use sui::tx_context::TxContext;

public struct MyNFT has key, store {
    id: UID,
    name: string::String,
    description: string::String,
    url: string::String,
}

public struct NFTMinted has copy, drop {
    object_id: ID,
    creator: address,
    name: string::String,
}

public fun name(nft: &MyNFT): &string::String {
    &nft.name
}

public fun description(nft: &MyNFT): &string::String {
    &nft.description
}

public fun url(nft: &MyNFT): &string::String{
    &nft.url
}

public fun mint_to_sender(
    name: vector<u8>,
    description: vector<u8>,
    url: vector<u8>,
    ctx: &mut TxContext,
) {
    let sender = ctx.sender();
    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"MUET NFT"),
        description: string::utf8(b"This is my first NFT!"),
        url: string::utf8(b"https://avatars.githubusercontent.com/u/195670331?v=4"),
    };

    event::emit(NFTMinted {
        object_id: object::id(&nft),
        creator: sender,
        name: nft.name,
    });

    transfer::public_transfer(nft, sender);
}

public fun transfer(nft: MyNFT, recipient: address, _: &mut TxContext) {
    transfer::public_transfer(nft, recipient);
}

public fun update_description(
    nft: &mut MyNFT,
    new_description: vector<u8>,
    _: &mut TxContext,
) {
    nft.description = string::utf8(new_description);
}

public fun burn(nft: MyNFT, _: &mut TxContext) {
    let MyNFT { id, name: _, description: _, url: _ } = nft;
    object::delete(id);
}

public entry fun mint(
    name: vector<u8>,
    description: vector<u8>,
    url: vector<u8>,
    ctx: &mut TxContext,
) {
    let sender = ctx.sender();
    let nft = MyNFT {
        id: object::new(ctx),
        name: string::utf8(b"MUET NFT"),
        description: string::utf8(b"This is my first NFT!"),
        url: string::utf8(b"https://avatars.githubusercontent.com/u/195670331?v=4"),
    };

    event::emit(NFTMinted {
        object_id: object::id(&nft),
        creator: sender,
        name: nft.name,
    });

    transfer::public_transfer(nft, sender);
}