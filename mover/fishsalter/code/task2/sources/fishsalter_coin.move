module task2::fishsalter_coin {
  use sui::coin::{Self, Coin, TreasuryCap};

  public struct FISHSALTER_COIN has drop {}

  fun init(witness: FISHSALTER_COIN, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency<FISHSALTER_COIN>(
      witness,
      6,
      b"FISHSALTER_COIN",
      b"FISHSALTER_COIN",
      b"fishsalter coin",
      option::none(),
      ctx
    );

    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
  }

  public fun mint(
    treasury_cap: &mut TreasuryCap<FISHSALTER_COIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext
  ) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }

  public fun burn(
    treasury_cap: &mut TreasuryCap<FISHSALTER_COIN>,
    coin: Coin<FISHSALTER_COIN>
  ) {
    coin::burn(treasury_cap, coin);
  }

}
