
/// Module: a_1473303013_coin
module a_1473303013_coin::a_1473303013_coin {
  use sui::coin::{Self, Coin, TreasuryCap};
  public struct A_1473303013_COIN has drop {}
  fun init(witness: A_1473303013_COIN, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(
      witness,
      6, // 6 decimal places
      b"a_1473303013 coin", // symbol
      b"a_1473303013 coin", // name
      b"Awesome Coint", // description
      option:: none(), // icon
      ctx
    );
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury, tx_context::sender(ctx));
  }

  public entry fun mint(
    treasury_cap: &mut TreasuryCap<A_1473303013_COIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }

  public entry fun burn(treasury_cap: &mut TreasuryCap<A_1473303013_COIN>, coin: Coin<A_1473303013_COIN>) {
    coin::burn(treasury_cap, coin);
  }
}

