module task2::faucet_coin {
 use sui::coin::{Self, Coin, TreasuryCap};

  public struct FAUCET_COIN has drop {}
  fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency<FAUCET_COIN>(
      witness,
      9,
      b"FAUCET_COIN",
      b"FAUCET_COIN",
      b"imdia's first faucet coin",
      option::none(),
      ctx
    );

    transfer::public_freeze_object(metadata);
    transfer::public_share_object(treasury_cap);
  }

  public fun mint(
    treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext
  ) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }

  public fun burn(treasury_cap: &mut TreasuryCap<FAUCET_COIN>, coin: Coin<FAUCET_COIN>) {
    coin::burn(treasury_cap, coin);
  }
}
