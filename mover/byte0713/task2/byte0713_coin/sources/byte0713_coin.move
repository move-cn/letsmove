
/// Module: a_0713_coin
module a_0713_coin::a_0713_coin {
  use sui::coin::{Self, Coin, TreasuryCap};
  public struct A_0713_COIN has drop {}
  fun init(witness: A_0713_COIN, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(
      witness,
      6, // 6 decimal places
      b"a_0713 coin", // symbol
      b"a_0713 coin", // name
      b"Awesome Coint", // description
      option:: none(), // icon
      ctx
    );
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury, tx_context::sender(ctx));
  }

  public entry fun mint(
    treasury_cap: &mut TreasuryCap<A_0713_COIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }

  public entry fun burn(treasury_cap: &mut TreasuryCap<A_0713_COIN>, coin: Coin<A_0713_COIN>) {
    coin::burn(treasury_cap, coin);
  }
}

