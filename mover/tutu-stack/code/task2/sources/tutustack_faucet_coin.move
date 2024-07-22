module task2::tutustack_faucet_coin {
  use sui::coin::{Self, Coin, TreasuryCap};
  use sui::url::{Self, Url};

  public struct TUTUSTACK_FAUCET_COIN has drop {}

  fun init(witness: TUTUSTACK_FAUCET_COIN, ctx: &mut TxContext) {
    let (treasury_cap, metadata) =  coin::create_currency<TUTUSTACK_FAUCET_COIN>(
      witness,
      2,
      b"TUTUSTACK_FAUCET_COIN",
      b"TUTUSTACK_FAUCET_COIN",
      b"tutustack's first faucet coin",
      option::none(),
      ctx
    );

    transfer::public_freeze_object(metadata);
    transfer::public_share_object(treasury_cap)
  }

  public fun mint(
    treasury_cap: &mut TreasuryCap<TUTUSTACK_FAUCET_COIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext
  ) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }

  public fun burn(treasury_cap: &mut TreasuryCap<TUTUSTACK_FAUCET_COIN>, coin: Coin<TUTUSTACK_FAUCET_COIN>) {
    coin::burn(treasury_cap, coin);
  }
}
