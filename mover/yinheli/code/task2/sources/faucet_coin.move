module task2::faucet_coin {
  use sui::coin::{Self, TreasuryCap, Coin};

  public struct FAUCET_COIN has drop {}

  #[allow(lint(share_owned))]
  fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
    let (cap, metadata) = coin::create_currency<FAUCET_COIN>(
      witness,
      2, // decimals
      b"FAUCET_COIN", // symbol
      b"yinheli's coin", // name
      b"for learning move", // description
      option::none(), // icon
      ctx, // context
    );

    transfer::public_freeze_object(metadata);
    // Turn the given object into a mutable shared object that everyone can access and mutate.
    // so every can mint coins.
    transfer::public_share_object(cap)
  }

  public fun mint(
    cap: &mut TreasuryCap<FAUCET_COIN>, recipient: address, ctx: &mut TxContext
  ) {
    // mint a random amount of coins, good luck!
    let amount = tx_context::epoch_timestamp_ms(ctx) % 100 + 1;
    coin::mint_and_transfer(cap, amount, recipient, ctx)
  }

  public fun burn(
    cap: &mut TreasuryCap<FAUCET_COIN>, coin: Coin<FAUCET_COIN>,
  ) {
    coin::burn(cap, coin);
  }

}
