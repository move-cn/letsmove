/// Module: nft_greyhao
module nft_greyhao::nft_greyhao;

use std::string::{String , utf8};
use sui::url::{Self, Url};
use sui::event;
use sui::package;
use sui::display;

public struct GreyhaoNFT has key, store {
  id: UID,
  name: String,
  description: String,
  image_url: Url,
}

// OTW for module
public struct NFT_GREYHAO has drop {}

//  ====Evens ====
public struct NFTMinted has copy, drop {
  object_id: ID,
  creator: address,
  name: String,
}

// ==== Public view functions ====

/// Get NFT's name
public fun name(nft: &GreyhaoNFT): &String {
  &nft.name
}

/// Get NFT's description
public fun description(nft: &GreyhaoNFT): &String {
  &nft.description
}

/// Get NFT's url
public fun image_url(nft: &GreyhaoNFT): &Url {
  &nft.image_url
}

/// update the `description` of `nft` to `new_description`
public fun update_description(nft: &mut GreyhaoNFT, new_description: vector<u8>, _: &mut TxContext) {
  nft.description = utf8(new_description)
}

fun init(otw: NFT_GREYHAO, ctx: &mut TxContext) {
  // key包含的值就是 GreyhaoNFT 对象中除 id 外的字段
  let keys = vector[
    b"name".to_string(),
    b"description".to_string(),
    b"image_url".to_string(),
  ];

  let values = vector[
    b"{name}".to_string(),
    b"{description}".to_string(),
    b"{image_url}".to_string(),
  ];

  let publisher = package::claim(otw, ctx);

  let mut display = display::new_with_fields<GreyhaoNFT>(&publisher, keys, values, ctx);

  display.update_version();

  transfer::public_transfer(publisher, ctx.sender());
  transfer::public_transfer(display, ctx.sender());

  let nft = nftInfo(ctx);
  transfer::transfer(nft, tx_context::sender(ctx));
}

#[allow(lint(self_transfer))]
public fun mint(ctx: &mut TxContext){
  let recipient = tx_context::sender(ctx);

  let nft = nftInfo(ctx);

  event::emit(NFTMinted {
    object_id: object::id(&nft),
    creator: recipient,
    name: nft.name,
  });

  transfer::public_transfer(nft, recipient);
}

/// Transfer `NFT` to `recipient`
public fun transfer(nft: GreyhaoNFT, recipient: address, _: &mut TxContext) {
  transfer::public_transfer(nft, recipient)
}

/// Transfer `NFT` to `recipient`
public fun mint_and_transfer(recipient: address, ctx: &mut TxContext) {
  let nft = nftInfo(ctx);
  transfer::public_transfer(nft, recipient)
}

/// return `NFT` info
fun nftInfo(ctx: &mut TxContext): GreyhaoNFT {
  let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/107107440");
  GreyhaoNFT {
    id: object::new(ctx),
    name: utf8(b"GREYHAO"),
    description: utf8(b"NFT was created by GreyHao."),
    image_url: url,
  }
}

/// delete `nft`
public fun burn(nft: GreyhaoNFT, _: &mut TxContext) {
  let GreyhaoNFT {id, name: _, description: _, image_url: _} = nft;
  id.delete()
}