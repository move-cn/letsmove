/// Module: task2
module task2::coin {
  use sui::coin::{Self, Coin, TreasuryCap};

  public struct COIN has drop {}

  fun init(witness: COIN, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency<COIN>(
      witness,
      2,
      b"COIN",
      b"IMDIA",
      b"learning move",
      option::none(),
      ctx
    );

    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
  }

  public fun mint(
    treasury_cap: &mut TreasuryCap<COIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext
  ) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }

  public fun burn(
    treasury_cap: &mut TreasuryCap<COIN>,
    coin: Coin<COIN>
  ) {
    coin::burn(treasury_cap, coin);
  }
}
