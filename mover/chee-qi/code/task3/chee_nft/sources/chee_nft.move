/*
/// Module: chee_nft
module chee_nft::chee_nft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module chee_nft::chee_nft;

// === Imports ===
use std::string;
use std::string::String;
use sui::transfer::transfer; 
use sui::tx_context::sender; 
use sui::package;
use sui::display;
// === Errors ===

// === Constants ===

// === Structs ===
public struct CheeNFT has key, store {
    id: UID,
    name: String,
    image_url: String,
}

public struct CHEE_NFT has drop {}

// === Events ===

// === Method Aliases ===

// === Public Functions ===


/// Claim the `Publisher` object in the module initializer 
/// to then create a `Display`. The `Display` is initialized with
/// a set of fields (but can be modified later) and published via
/// the `update_version` call.
///
/// Keys and values are set in the initializer but could also be
/// set after publishing if a `Publisher` object was created.
fun init(otw: CHEE_NFT, ctx: &mut TxContext) {
    let keys = vector[
        b"name".to_string(),
        b"link".to_string(),
        b"image_url".to_string(),
        b"description".to_string(),
        b"project_url".to_string(),
        b"creator".to_string(),
    ];

    let values = vector[
        b"{name}".to_string(),
        b"{link}".to_string(),
        b"{image_url}".to_string(),
        b"{description}".to_string(),
        b"{project_url}".to_string(),
        b"Unknown Chee Fan".to_string(),
    ];

    // Claim the `Publisher` for the package!
    let publisher = package::claim(otw, ctx);

    // Get a new `Display` object for the `Hero` type.
    let mut display = display::new_with_fields<CheeNFT>(
        &publisher, keys, values, ctx
    );

    // Commit first version of `Display` to apply changes.
    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());

    let nft = CheeNFT {
        id: object::new(ctx),
        name:string::utf8(b"chee NFT"),
        image_url: string::utf8(b"https://avatars.githubusercontent.com/chee-qi")
    };
    transfer::public_transfer(nft, sender(ctx));

}

/// Anyone can mint and send `CheeNFT`!
public entry fun mint(addr:address, url:String,ctx: &mut TxContext) {
    let nft = CheeNFT {
        id: object::new(ctx),
        name:string::utf8(b"chee NFT"),
        image_url: url
    };
    transfer(nft, addr);
}

// === View Functions ===

// === Admin Functions ===

// === Package Functions ===

// === Private Functions ===

// === Test Functions ===

// objectid:0xe6384eeac3a6f0d707a477bf194f5cae8a17affcdaf31481b16ac611fb54298e
// objectid:0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 这个有用

// 自己的nft ：https://suiscan.xyz/mainnet/object/0xca2810d1a6525bdb705b460534b2c49299a1e9a98760f058e6a6b806807dad0c/tx-blocks

// mint 给地址的交易 https://suiscan.xyz/mainnet/tx/3dC25ebLvJxZDnvdenLPQhkJLR6JNXkHu7W4LY84Br1j


