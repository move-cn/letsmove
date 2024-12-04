/// Module: task3
module task3::nft_tutustack {
  use sui::url::{Url, Self};
  use std::string;
  use sui::object::{Self, ID, UID};
  use sui::event;
  use sui::transfer;
  use sui::tx_context::{TxContext, Self};

  struct TutustackNFT has key, store {
    id: UID,
    name: string::String,
    description: string::String,
    url: Url,
  }

  struct TutustackNFTTransferEvent has copy, drop {
    object_id: ID,
    from: address,
    to: address,
  }
  
  struct TutustackNFTMintEvent has copy, drop {
    object_id: ID,
    creator: address,
    name: string::String,
  }

  struct TutustackNFTBurnEvent has copy, drop {
    object_id: ID,
  }

  public fun name(nft: &TutustackNFT): string::String {
    nft.name
  }

  public fun description(nft: &TutustackNFT): string::String {
    nft.description
  }

  public fun url(nft: &TutustackNFT): Url {
    nft.url
  }

  public entry fun mint_nft(
    name: vector<u8>,
    description: vector<u8>,
    url: vector<u8>,
    ctx: &mut TxContext
  ) {
    let sender = tx_context::sender(ctx);
    let nft = TutustackNFT {
      id: object::new(ctx),
      name: string::utf8(name),
      description: string::utf8(description),
      url: url::new_unsafe_from_bytes(url),
    };

    event::emit(TutustackNFTMintEvent {
      object_id: object::id(&nft),
      creator: sender,
      name: nft.name,
    });

    transfer::public_transfer(nft, sender);
  }
  
  public entry fun transfer_nft(
    nft: TutustackNFT,
    recipient: address,
    _: &mut TxContext,
  ) {
    event::emit(TutustackNFTTransferEvent {
      object_id: object::id(&nft),
      from: tx_context::sender(_),
      to: recipient,
    });

    transfer::public_transfer(nft, recipient);
  }

  public entry fun update_description(
    nft: &mut TutustackNFT,
    description: vector<u8>,
    _: &mut TxContext
  ) {
    nft.description = string::utf8(description);
  }

  public entry fun burn(
    nft: TutustackNFT,
    _: &mut TxContext
  ) {
    let TutustackNFT {id, name: _, description: _, url: _} = nft;
    event::emit(TutustackNFTBurnEvent {
      object_id: object::uid_to_inner(&id),
    });

    object::delete(id);
  }

}
