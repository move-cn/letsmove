/// Module: greyhaofaucet
module coin_greyhao::greyhaofaucet {

  use sui::coin::{Self, TreasuryCap, Coin};

  public struct GREYHAOFAUCET has drop { }

  fun init(witness: GREYHAOFAUCET, ctx: &mut TxContext) {
    let (treasury_cap, coin_meta) = coin::create_currency(witness, 8, b"GREYHAOFAUCET", b"GHF", b"faucet coin by Greyhao", option::none(), ctx);
    transfer::public_freeze_object(coin_meta);
    transfer::public_share_object(treasury_cap);
  }

  public entry fun mint(treasury_cap: &mut TreasuryCap<GREYHAOFAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }

  public entry fun burn(treasury_cap: &mut TreasuryCap<GREYHAOFAUCET>, coin: Coin<GREYHAOFAUCET>) {
    coin::burn(treasury_cap, coin);
  }

}