
/// Module: a_673800357_coin
module a_673800357_coin::a_673800357_coin {
  use sui::coin::{Self, Coin, TreasuryCap};
  public struct A_673800357_COIN has drop {}
  fun init(witness: A_673800357_COIN, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(
      witness,
      6, // 6 decimal places
      b"a_673800357 coin", // symbol
      b"a_673800357 coin", // name
      b"Awesome Coint", // description
      option:: none(), // icon
      ctx
    );
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury, tx_context::sender(ctx));
  }

  public entry fun mint(
    treasury_cap: &mut TreasuryCap<A_673800357_COIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }

  public entry fun burn(treasury_cap: &mut TreasuryCap<A_673800357_COIN>, coin: Coin<A_673800357_COIN>) {
    coin::burn(treasury_cap, coin);
  }
}

