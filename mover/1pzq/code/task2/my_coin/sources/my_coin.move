// Module: my_coin
module my_coin::my_coin {
  use std::option;
  use sui::coin::{Self, Coin, TreasuryCap};
  use sui::transfer;
  use sui::tx_context::{Self, TxContext};

  public struct MY_COIN has drop {}
  
  fun init(witness: MY_COIN, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency<MY_COIN>(
      witness,
      2,
      b"MY",
      b"MYCOIN",
      b"MY COIN", 
      option::none(),
      ctx 
    );
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx));

  }

  public entry fun mint(treasury_cap: &mut TreasuryCap<MY_COIN>, amount: u64, recipient: address, ctx: &mut TxContext){
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }

  public entry fun burn(treasury_cap: &mut TreasuryCap<MY_COIN>, coin: Coin<MY_COIN>) {
      coin::burn(treasury_cap, coin);
  }
}

/*
Package 0xe9f70ff13eefa964cdd63460da595d87048f974d62cb9aa92adcebc57998043b
CoinMetadata 0xb5cbfad7b7b25d6c671b5f449ea5c3e90c743659970291914e1b56d1ff204962
ObjectType: 0x2::coin::CoinMetadata<0xe9f70ff13eefa964cdd63460da595d87048f974d62cb9aa92adcebc57998043b::my_coin::MY_COIN>  │
TreasuryCap 0xd6133909f2e796df397d5826ee6c0375ed4e743ee1ba38f7bf26f06f607983fa
ObjectType: 0x2::coin::TreasuryCap<0xe9f70ff13eefa964cdd63460da595d87048f974d62cb9aa92adcebc57998043b::my_coin::MY_COIN>   │  │
*/