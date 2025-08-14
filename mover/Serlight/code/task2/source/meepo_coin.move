
/// Module: meepo_coin
module meepo_coin::meepo_coin {
  use sui::coin::{Self, Coin, TreasuryCap};

  public struct MEEPO_COIN has drop {}

  fun init(witness: MEEPO_COIN, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(
      witness,
      8,
      b"Meepo",
      b"Meepo Hero Coin",
      b"A coin repsenting the Meepo Heroes of dota2",
      option::none(),
      ctx
    );

    transfer::public_transfer(treasury, tx_context::sender(ctx));
    transfer::public_freeze_object(metadata);
  }

  // mint coin 
  public fun mint(treasury_cap: &mut TreasuryCap<MEEPO_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }

  // burn coin
  public fun burn(treasury_cap: &mut TreasuryCap<MEEPO_COIN>, coin: Coin<MEEPO_COIN>) {
    coin::burn(treasury_cap, coin);
  }

}
