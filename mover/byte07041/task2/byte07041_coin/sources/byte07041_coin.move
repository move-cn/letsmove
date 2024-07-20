
/// Module: a_07041_coin
module a_07041_coin::a_07041_coin {
  use sui::coin::{Self, Coin, TreasuryCap};
  public struct A_07041_COIN has drop {}
  fun init(witness: A_07041_COIN, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(
      witness,
      6, // 6 decimal places
      b"a_07041 coin", // symbol
      b"a_07041 coin", // name
      b"Awesome Coint", // description
      option:: none(), // icon
      ctx
    );
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury, tx_context::sender(ctx));
  }

  public entry fun mint(
    treasury_cap: &mut TreasuryCap<A_07041_COIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }

  public entry fun burn(treasury_cap: &mut TreasuryCap<A_07041_COIN>, coin: Coin<A_07041_COIN>) {
    coin::burn(treasury_cap, coin);
  }
}

