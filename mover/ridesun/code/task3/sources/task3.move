module task3::ridesun_nft {
  use std::string::{String, utf8};
  use sui::package;
  use sui::display;
  use sui::table::{Self, Table};
  use sui::event;

  public struct RIDESUN_NFT has drop {}

  public struct RidesunNFT has key, store {
    id: UID,
    nft_id: u64,
    name: String,
    image_url: String,
    creator: address,
    recipient: address,
  }

  public struct NFTMinted has copy, drop {
    object_id: ID,
    creator: address,
    name: String,
  }

  public struct MintRecord has key {
    id: UID,
    record: Table<address, u64>,
  }

  const MAX_SUPPLY: u64 = 10;

  const ENotEnoughSupply: u64 = 0;

  const EDontMintAgain: u64 = 1;

  fun init(otw: RIDESUN_NFT, ctx: &mut TxContext) {
    let keys = vector[
      utf8(b"name"),
      utf8(b"description"),
      utf8(b"image_url"),
      utf8(b"creator"),
    ];
    let values = vector[
      utf8(b"{name} #{nft_id}"),
      utf8(b"A NFT for your Github avatar"),
      utf8(b"{image_url}"),
      utf8(b"{creator}"),
    ];
    let mint_record = MintRecord {
      id: object::new(ctx),
      record: table::new<address, u64>(ctx),
    };
    
    let publisher = package::claim(otw, ctx);
    let mut display = display::new_with_fields<RidesunNFT>(&publisher, keys, values, ctx);

    transfer::share_object(mint_record);
    display::update_version(&mut display);
    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
  }

  public entry fun mint(mint_record: &mut MintRecord, name: String, image_url: String, recipient: address, ctx: &mut TxContext) {
    assert!(!table::contains(&mint_record.record, recipient), EDontMintAgain);
  
    let nft_id: u64 = table::length(&mint_record.record) + 1;
    table::add(&mut mint_record.record, recipient, nft_id);
    assert!(nft_id <= MAX_SUPPLY, ENotEnoughSupply);

    let nft = RidesunNFT {
      id: object::new(ctx),
      nft_id,
      name,
      image_url,
      creator: ctx.sender(),
      recipient,
    };

    event::emit(NFTMinted {
      object_id: object::id(&nft),
      creator: ctx.sender(),
      name: nft.name,
    });

    transfer::public_transfer(nft, recipient);
  }

  public entry fun burn(mint_record: &mut MintRecord, nft: RidesunNFT) {
    table::remove(&mut mint_record.record, nft.recipient);
    let RidesunNFT { id, nft_id: _, name: _, image_url: _, creator: _, recipient: _, } = nft;
    object::delete(id);
  }
}
