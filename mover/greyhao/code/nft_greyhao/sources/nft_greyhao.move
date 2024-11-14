/// Module: nft_greyhao
module nft_greyhao::nft_greyhao;

use std::string::{String , utf8};
use sui::url::{Self, Url};
use sui::event;

public struct GreyhaoNFT has key, store {
  id: UID,
  name: String,
  description: String,
  url: Url,
}

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
public fun url(nft: &GreyhaoNFT): &Url {
  &nft.url
}

/// update the `description` of `nft` to `new_description`
public fun update_description(nft: &mut GreyhaoNFT, new_description: vector<u8>, _: &mut TxContext) {
  nft.description = utf8(new_description)
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
    url: url,
  }
}

/// delete `nft`
public fun burn(nft: GreyhaoNFT, _: &mut TxContext) {
  let GreyhaoNFT {id, name: _, description: _, url: _} = nft;
  id.delete()
}