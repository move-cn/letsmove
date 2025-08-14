module task2::tutustack_coin {
  use sui::coin::{Self, Coin, TreasuryCap};
  use sui::url::{Self, Url};

  public struct TUTUSTACK_COIN has drop {}

  fun init( witness: TUTUSTACK_COIN, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency<TUTUSTACK_COIN>(
      witness,
      2,
      b"TUTUSTACK_COIN",
      b"TUTUSTACK",
      b"learning move",
      option::none(),
      ctx
    );

    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
  }

  public fun mint(
    treasury_cap: &mut TreasuryCap<TUTUSTACK_COIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext
  ) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }

  public fun burn(
    treasury_cap: &mut TreasuryCap<TUTUSTACK_COIN>,
    coin: Coin<TUTUSTACK_COIN>
  ) {
    coin::burn(treasury_cap, coin);
  }
  
}
