/*
/// Module: my_nft
module my_nft::my_nft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module my_nft::my_nft;

// === Imports ===
use std::string;
use std::string::String;
use sui::transfer::transfer; 
use sui::tx_context::sender; 
// === Errors ===

// === Constants ===

// === Structs ===
public struct MyNFT has key,store {
    id: UID,
    name: String,
    image_url: String
}
// === Events ===

// === Method Aliases ===

// === Public Functions ===

fun init(ctx: &mut TxContext) {
    let my_nft = MyNFT {
        id: object::new(ctx),
        name:string::utf8(b"chee NFT"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/chee-qi")
    };
    transfer(my_nft, sender(ctx));
}


// === View Functions ===

public entry fun mint(add:address, url:String,ctx: &mut TxContext) {
    let my_nft = MyNFT {
        id: object::new(ctx),
        name:string::utf8(b"chee NFT"),
        image_url: url
    };
    transfer(my_nft, add);
}

// === Admin Functions ===

// === Package Functions ===

// === Private Functions ===

// === Test Functions ===