module task3::nft_hero{
  use std::string::utf8;
  use sui::clock::{Self, Clock};
  use sui::display;
  use sui::package;

  public struct NFT_HERO has drop{}

  public struct MyHero has key, store {
    id: UID,
    tokenId: u64,
    hp: u64,
    mp: u64,
    xp: u64,
    level: u64,
    createTime: u64,
  }

  public struct State has key {
    id: UID,
    count: u64
  }

  fun init(witness: NFT_HERO, ctx: &mut TxContext) {
    let keys = vector[
        utf8(b"name"),
        utf8(b"image_url"),
        utf8(b"hp"),
        utf8(b"mp"),
        utf8(b"xp"),
        utf8(b"level")
    ];

    let values = vector[
        utf8(b"Bityoume NFT HERO #{tokenId}"),
        utf8(b"ipfs://QmZo2QH4dtav6HQUqztQz81sifqrp3jCcdc5jQ8axyurna"),
        utf8(b"{hp}"),
        utf8(b"{mp}"),
        utf8(b"{xp}"),
        utf8(b"{level}")
    ];

    let publisher = package::claim(witness, ctx);
    let mut display = display::new_with_fields<MyHero>(
        &publisher, keys, values, ctx);

    display::update_version(&mut display);

    transfer::public_transfer(publisher, tx_context::sender(ctx));
    transfer::public_transfer(display, tx_context::sender(ctx));

    transfer::share_object(State{
        id: object::new(ctx),
        count: 0
    });
  }

  entry public fun mint(state: &mut State, clock: &Clock, ctx: &mut TxContext) {
    let sender = tx_context::sender(ctx);
    state.count = state.count + 1;
    let nft = MyHero {
        id: object::new(ctx),
        tokenId: state.count,
        hp: 100,
        mp: 10,
        xp: 0,
        level: 1,
        createTime: clock::timestamp_ms(clock)/1000,
    };

    transfer::transfer(nft, sender);
  }

  entry public fun transfer(
    nft: MyHero, recipient: address, _: &mut TxContext
  ) {
    transfer::public_transfer(nft, recipient)
  }

  entry public fun update_hero(hero: &mut MyHero, _: &mut TxContext) {
    hero.xp = hero.xp + 1;
    if (hero.xp >= hero.level * 10) {
        hero.level = hero.level + 1;
    }
  }
}
