/// Module: task3
module task3::nft_imdia {
  use sui::tx_context;
  use std::string::{String, Self};
  use sui::event;
  use sui::transfer;
  use sui::url::{Url, Self};

  public struct ImdiaNFT has key, store {
    id: UID,
    name: String,
    description: String,
    url: Url,
  }

  public struct ImdiaNFTTransferEvent has copy, drop {
    object_id: ID,
    from: address,
    to: address,
  }

  public struct ImdiaNFTMintEvent has copy, drop {
    object_id: ID,
    creator: address,
    name: String,
  }

  public struct ImdiaNFTBurnEvent has copy, drop {
    object_id: ID,
  }

  public fun name(nft: &ImdiaNFT): String {
    nft.name
  }

  public fun description(nft: &ImdiaNFT): String {
    nft.description
  }

  public fun url(nft: &ImdiaNFT): Url {
    nft.url
  }

  public entry fun mint(
    name: vector<u8>,
    description: vector<u8>,
    url: vector<u8>,
    ctx: &mut TxContext,
  ) {
    let sender = tx_context::sender(ctx);
    let nft = ImdiaNFT {
      id: object::new(ctx),
      name: string::utf8(name),
      description: string::utf8(description),
      url: url::new_unsafe_from_bytes(url),
    };

    event::emit(ImdiaNFTMintEvent {
      object_id: object::id(&nft),
      creator: sender,
      name: nft.name,
    });

    transfer::public_transfer(nft, sender);
  }
  
  public entry fun transfer_nft(
    nft: ImdiaNFT,
    recipient: address,
    _: &mut TxContext,
  ) {
    event::emit(ImdiaNFTTransferEvent {
      object_id: object::id(&nft),
      from: tx_context::sender(_),
      to: recipient,
    });

    transfer::public_transfer(nft, recipient);
  }

  public entry fun burn(
    nft: ImdiaNFT,
    _: &mut TxContext,
  ) {
    let ImdiaNFT {id, name: _, description: _, url: _} = nft;
    event::emit(ImdiaNFTBurnEvent {
      object_id: object::uid_to_inner(&id)
    });

    object::delete(id);
  }
}
