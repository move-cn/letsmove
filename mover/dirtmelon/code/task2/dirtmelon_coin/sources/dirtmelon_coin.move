
/// Module: dirtmelon_coin
module dirtmelon_coin::dirtmelon_coin {
  use sui::coin::{Self, Coin, TreasuryCap};
  public struct DIRTMELON_COIN has drop {}
  fun init(witness: DIRTMELON_COIN, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(
      witness,
      6, // 6 decimal places
      b"dirtmelon coin", // symbol
      b"dirtmelon coin", // name
      b"Awesome Coint", // description
      option:: none(), // icon
      ctx
    );
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury, tx_context::sender(ctx));
  }

  public entry fun mint(
    treasury_cap: &mut TreasuryCap<DIRTMELON_COIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }

  public entry fun burn(treasury_cap: &mut TreasuryCap<DIRTMELON_COIN>, coin: Coin<DIRTMELON_COIN>) {
    coin::burn(treasury_cap, coin);
  }
}

