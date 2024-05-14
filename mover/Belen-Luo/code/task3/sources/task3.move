module task3::BelenLuoNft {
  // Part-1: Imports
  use std::string;
  use sui::url::{Self, Url};

  // Part-2: Type Definition
  public struct NFT_TYPE has key, store {
    id: UID,
    name: string::String,
    description: string::String,
    url: Url
  }

  // Part-2: Mint NFT
  #[allow(lint(self_transfer))]
  public fun mint(
    name: vector<u8>,
    description: vector<u8>,
    url: vector<u8>,
    recipient: address,
    ctx: &mut TxContext
  ) {
    let nft = NFT_TYPE {
      id: object::new(ctx),
      name: string::utf8(name),
      description: string::utf8(description),
      url: url::new_unsafe_from_bytes(url)
    };

    transfer::public_transfer(nft, recipient);
  }
}