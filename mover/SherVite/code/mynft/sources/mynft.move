/*
/// Module: mynft
module mynft::mynft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module mynft::mynft {
    use std::string;
    use sui::tx_context::{sender};
    use std::string::{utf8, String};
 
 
    use sui::package;
    use sui::display;
 
public struct MyNFT has key, store {
     id: UID,
     name: String,
     image_url: String,
 }
 
public struct MyNFT has drop {}
 
 
 fun init(otw: DISPLAY_NFT, ctx: &mut TxContext) {
     let keys = vector[
         utf8(b"SherVite"),
         utf8(b"https://avatars.githubusercontent.com/u/201323230?v=4"),
         utf8(b"description"),
         utf8(b"project_url"),
         utf8(b"creator"),
     ];
 
     let values = vector[
         utf8(b"{name}"),
         utf8(b"{image_url}"),
         utf8(b"Task3"),
         utf8(b"https://github.com/SherVite"),
         utf8(b"SherVite")
     ];
 
     let publisher = package::claim(otw, ctx);
 
     let display = display::new_with_fields<MyNFT>(
         &publisher, keys, values, ctx
     );
 
     display::update_version(&mut display);
 
     transfer::public_transfer(publisher, sender(ctx));
     transfer::public_transfer(display, sender(ctx));
 
 
     let nft = MyNFT {
         id: object::new(ctx),
         name: string::utf8(b"SherVite nft"),
         image_url: string::utf8(
             b"https://avatars.githubusercontent.com/u/201323230?v=4"
         ),
     };
     transfer::public_transfer(nft, sender(ctx));
 }
 
 
 public entry fun mint_nft(name: String, image_url: String, ctx: &mut TxContext) {
     let id = object::new(ctx);
     let nft = MyNFT { id, name, image_url };
     transfer::public_transfer(nft, sender(ctx));
 }
 
 public entry fun transfer_nft(
     nft: MyNFT,
     recipient: address,
     _: &mut TxContext
 ) {
     transfer::public_transfer(nft, recipient);
 }
 }