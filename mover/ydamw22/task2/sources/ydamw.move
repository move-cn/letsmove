module task2::ydamw {
  use sui::coin::{Self, TreasuryCap};
  use sui::coin::create_currency;
  use sui::transfer::{public_freeze_object, public_transfer};
  use std::option::{none};

  public struct YDAMW has drop {}

  fun init(witness: YDAMW, ctx: &mut TxContext) {
    let icon_url = none();

    let (treasury, metadata) = create_currency(
      witness,
      6,
      b"YDAMW",
      b"ydamw",
      b"test coin for ydamw",
      icon_url,
      ctx,
    );

    public_freeze_object(metadata);
    public_transfer(treasury, ctx.sender())
  }

  public entry fun mint (
    treasury_cap: &mut TreasuryCap<YDAMW>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext,
  ) {
    let coin = coin::mint(treasury_cap, amount, ctx);
    public_transfer(coin, recipient)
  }
}