/// Module: greyhaocoin
module coin_greyhao::greyhaocoin {
  use sui::coin::{Self, TreasuryCap, Coin};

  public struct GREYHAOCOIN has drop { }

  fun init(witness: GREYHAOCOIN, ctx: &mut TxContext) {
    let decimals = 8;
    let symbol = b"GREYHAOCOIN";
    let name = b"GHC";
    let description = b"Coin was created by Greyhao.";
    let (treasury_cap, metadata) = coin::create_currency(witness, decimals, symbol, name, description, option::none(), ctx);
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
  }

  public entry fun mint(witness: &mut TreasuryCap<GREYHAOCOIN>, amount: u64, recipitent: address, ctx: &mut TxContext) {
    coin::mint_and_transfer(witness, amount, recipitent, ctx);
  }

  public entry fun burn(witness: &mut TreasuryCap<GREYHAOCOIN>, coin: Coin<GREYHAOCOIN>) {
    coin::burn(witness, coin);
  }
}
