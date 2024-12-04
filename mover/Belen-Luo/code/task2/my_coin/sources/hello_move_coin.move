module hello_move_coin::BelenLuoCoin {
  // Part-1: Imports
  use sui::coin::{Self, TreasuryCap};

  // Part-2: Type Definition
  public struct BELENLUOCOIN has drop {}

  // Part-3: Create Coin and transfer to Witness
  fun init(witness: BELENLUOCOIN, ctx: &mut TxContext) {

    // Part-3-1: Create Coin
    let (treasuryCap, coinMetadata) = coin::create_currency<BELENLUOCOIN>(
        witness,
        1,
        b"BL",
        b"Belen-Luo",
        b"This is the Coin that Belen created in order to learn move",
        option::none(),
        ctx
    );

    // Part-3-2: Freeze Coin
    transfer::public_freeze_object(coinMetadata);

    // Part-3-3: Transfer Coin
    transfer::public_transfer(treasuryCap, tx_context::sender(ctx));
  }

  // Part-4: Mint 
  entry public fun mint(
    treasuryCap: &mut TreasuryCap<BELENLUOCOIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext
  ) {
    coin::mint_and_transfer(treasuryCap, amount, recipient, ctx);
  }

  #[test_only]
  public fun test_init(ctx: &mut TxContext) {
    init(BELENLUOCOIN {}, ctx)
	}
}
