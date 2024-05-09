module task2::faucet_coin {
  use sui::coin::{Self, TreasuryCap};
  
  public struct FAUCET_COIN has drop {}

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
    transfer::public_transfer(cap, tx_context::sender(ctx))
  }

  public fun mint(
    cap: &mut TreasuryCap<FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
  ) {
    coin::mint_and_transfer(cap, amount, recipient, ctx)
  }
}
