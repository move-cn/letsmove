module meepo_coin::meepo_faucet {
  use sui::coin::{Self, TreasuryCap};

  public struct MEEPO_FAUCET has drop {}

  fun init(witness: MEEPO_FAUCET, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(
      witness,
      8,
      b"MFC",
      b"Meepo coin faucet",
      b"Meepo coin faucet",
      option::none(),
      ctx
    );

    transfer::public_freeze_object(metadata);
    transfer::public_share_object(treasury)
  } 

  public entry fun mint(treasury_cap: &mut TreasuryCap<MEEPO_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }
}