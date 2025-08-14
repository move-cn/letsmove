module hstar::hstar_nft {
  use std::string;
  use sui::event;
  use sui::url;
  use sui::url::{Url};
  
  public struct HstarNFT has key, store {
    id: UID,
    name: string::String,
    description: string::String,
    url: Url
  }
  
  // events
  public struct NFTMintedEvent has copy, drop {
    object_id: ID,
    recipient: address,
    name: string::String
  }
  
  public struct NFTTransferEvent has copy, drop {
    object_id: ID,
    from: address,
    to: address
  }
  
  // update nft description
  public entry fun update_desc(
    nft: &mut HstarNFT,
    new_description: vector<u8>,
  ) {
    nft.description = string::utf8(new_description)
  }
  
  /// Permanently delete `nft`
  public entry fun burn(nft: HstarNFT, _: &mut TxContext) {
    let HstarNFT { id, name: _, description: _, url: _ } = nft;
    object::delete(id)
  }
  
  public entry fun mint(
    name: vector<u8>,
    description: vector<u8>,
    url: vector<u8>,
    ctx: &mut TxContext
  ) {
    let sender = tx_context::sender(ctx);
    let nft = HstarNFT {
      id: object::new(ctx),
      name: string::utf8(name),
      description: string::utf8(description),
      url: url::new_unsafe_from_bytes(url)
    };
    
    event::emit(NFTMintedEvent {
      object_id: object::id(&nft),
      recipient: sender,
      name: nft.name,
    });
    
    transfer::public_transfer(nft, sender);
  }
  
  /// Transfer `nft` to `recipient`
  public fun transfer(
    nft: HstarNFT, recipient: address, ctx: &mut TxContext
  ) {
    let sender = tx_context::sender(ctx);
    event::emit(NFTTransferEvent {
      object_id: object::id(&nft),
      from: sender,
      to: recipient
    });
    
    transfer::public_transfer(nft, recipient)
  }
}
