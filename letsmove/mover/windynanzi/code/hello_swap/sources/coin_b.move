module windynanzi::coin_b {

  use sui::coin;
  use sui::coin::TreasuryCap;
  use sui::transfer;

  const MIST_PER_GUESS_HAND:u64 = 1_000_000_000;

  public struct COIN_B has drop {}
  fun init(otw: COIN_B, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(
      otw,
      9,
      b"coin_b",
      b"coin_b",
      b"hello_swap",
      option::none(),
      ctx
    );

    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury, ctx.sender());
  }

  public entry fun mint(
    treasury: &mut TreasuryCap<COIN_B>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext
  ) {
    coin::mint_and_transfer(
      treasury,
      amount * MIST_PER_GUESS_HAND,
      recipient,
      ctx,
    );
  }
}