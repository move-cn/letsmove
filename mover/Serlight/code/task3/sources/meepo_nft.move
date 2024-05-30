/// Module: meepo_nft
module meepo_nft::meepo_nft {
  use std::string::{Self, String};
  use sui::event;
  use sui::url::{Self, Url};

  public struct Meepo_NFT has key, store {
    id: UID,
    name: String,
    description: String,
    url: Url
  }

  public struct Meepo_NFT_MintedEvent has copy, drop {
    id: ID,
    minted_by: address,
    name: String,
  }

  public entry fun mint(name: vector<u8>, description: vector<u8>, url: vector<u8>, ctx: &mut TxContext) {

    let nft =  Meepo_NFT {
      id: object::new(ctx), 
      name: string::utf8(name), 
      description: string::utf8(description), 
      url: url::new_unsafe_from_bytes(url)
    };

    event::emit(Meepo_NFT_MintedEvent{
      id: object::id(&nft),
      minted_by: ctx.sender(),
      name: string::utf8(name),
    });

    transfer::public_transfer(nft, tx_context::sender(ctx))
  }

  public entry fun set_url(meepo: &mut Meepo_NFT, url: vector<u8>) {
    meepo.url = url::new_unsafe_from_bytes(url);
  }

  public fun delete(meepo: Meepo_NFT) {
    let Meepo_NFT { id, name, description, url } = meepo;
    object::delete(id);

    let _name = name;
    let _description = description;
    let _url = url;
  }

  public fun name(meepo: &Meepo_NFT): &String {
    &meepo.name
  }

  public fun descripton(meepo: &Meepo_NFT): &String {
    &meepo.description
  }

  public fun url(meepo: &Meepo_NFT): &Url {
    &meepo.url
  }
}
