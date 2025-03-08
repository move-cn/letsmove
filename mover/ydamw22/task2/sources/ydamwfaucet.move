module task2::ydamwfaucet {
  use sui::coin::{Self, TreasuryCap};
  use sui::coin::create_currency;
  use sui::transfer::{public_freeze_object, public_share_object, public_transfer};
  use std::option::{none};

  public struct YDAMWFAUCET has drop {}

  fun init(witness: YDAMWFAUCET, ctx: &mut TxContext) {
    let icon_url = none();

    let (treasury, metadata) = create_currency(
      witness,
      6,
      b"YDFC",
      b"ydamwfaucet",
      b"test coin for ydamw faucet",
      icon_url,
      ctx,
    );

    public_freeze_object(metadata);
    public_share_object(treasury)
  }

  public entry fun mint (
    treasury_cap: &mut TreasuryCap<YDAMWFAUCET>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext,
  ) {
    let coin = coin::mint(treasury_cap, amount, ctx);
    public_transfer(coin, recipient)
  }
}