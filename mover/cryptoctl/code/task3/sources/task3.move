/*
/// Module: task3*/
module task3::MyNft;
use std::string;
use std::string::{ String };
use sui::url;
use sui::url::Url;
use sui::event;
use sui::package;
use sui::display;

public struct MyNft has key, store{
    id:UID,
    name: String,
    description: String,
    image_url: Url,
}
public struct MYNFT has drop{}


// ===== Events =====

public struct NFTMinted has copy, drop {
    object_id: ID,
    creator: address,
    name: String,
}

/// The capability granting the application admin the right to create new
/// accounts in the system.
public struct AdminCap has key, store { id: UID }

/// Create the AdminCap object on package publish and transfer it to the
/// package owner.
fun init(otw:MYNFT, ctx: &mut TxContext) {

    let keys = vector[
        b"name".to_string(),
        b"image_url".to_string(),
        b"description".to_string(),
        b"creator".to_string(),
    ];

    let values = vector[
        // For `name` one can use the `Hero.name` property
        b"{name}".to_string(),
        // For `image_url` use an IPFS template + `image_url` property.
        b"{image_url}".to_string(),
        // Description is static for all `Hero` objects.
        b"{description}".to_string(),
        // Creator field can be any
        b"CryptoCtl".to_string(),
    ];

    // Claim the `Publisher` for the package!
    let publisher = package::claim(otw, ctx);

    // Get a new `Display` object for the `MyNft` type.
    let mut display = display::new_with_fields<MyNft>(
        &publisher, keys, values, ctx
    );

    // Commit first version of `Display` to apply changes.
    display.update_version();

    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());

    transfer::transfer(
        AdminCap { id: object::new(ctx) },
        ctx.sender()
    )
}

public entry fun mint_to_sender(
    name: vector<u8>,
    description: vector<u8>,
    img_url: vector<u8>,
    ctx: &mut TxContext
) {
    let sender = ctx.sender();
    inner_mint_to(name, description, img_url, sender, ctx);
}

public entry fun mint_to(
    name: vector<u8>,
    description: vector<u8>,
    img_url: vector<u8>,
    reciver: address,
    ctx: &mut TxContext) {

    inner_mint_to(name, description, img_url, reciver, ctx);
}

fun inner_mint_to(
    name: vector<u8>,
    description: vector<u8>,
    img_url: vector<u8>,
    reciver: address,
    ctx: &mut TxContext){

    let nft = MyNft {
        id: object::new(ctx),
        name: string::utf8(name),
        description: string::utf8(description),
        image_url: url::new_unsafe_from_bytes(img_url)
        // image_url: url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/8326809?v=4")
    };

    event::emit(NFTMinted {
        object_id: object::id(&nft),
        creator: reciver,
        name: nft.name,
    });

    transfer::public_transfer(nft, reciver);
}

/// Transfer `nft` to `recipient`
public entry fun transfer(
    nft: MyNft, recipient: address, _: &mut TxContext
) {
    transfer::public_transfer(nft, recipient)
}

/// Update the `description` of `nft` to `new_description`
public entry fun update_description(
    nft: &mut MyNft,
    new_description: vector<u8>,
    _: &mut TxContext
) {
    nft.description = string::utf8(new_description)
}

/// Permanently delete `nft`
public entry fun burn(_: &AdminCap, nft: MyNft, _: &mut TxContext) {
    let MyNft { id, name: _, description: _, image_url: _ } = nft;
    id.delete()
}