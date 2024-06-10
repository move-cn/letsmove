module starkright_coin::starkright_coin {
  // Part-1: Imports
  use sui::coin::{Self, TreasuryCap};

  // Part-2: Type Definition
  public struct STARKRIGHT_COIN has drop {}

  // Part-3: Create Coin and transfer to Witness
  fun init(witness: STARKRIGHT_COIN, ctx: &mut TxContext) {

    // Part-3-1: Create Coin
    let (treasuryCap, coinMetadata) = coin::create_currency<STARKRIGHT_COIN>(
        witness,
        1,
        b"STARKRIGHT_COIN",
        b"STARKRIGHT_COIN",
        b"STARKRIGHT_COIN",
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
    treasuryCap: &mut TreasuryCap<STARKRIGHT_COIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext
  ) {
    coin::mint_and_transfer(treasuryCap, amount, recipient, ctx);
  }

  #[test_only]
  public fun test_init(ctx: &mut TxContext) {
    init(STARKRIGHT_COIN {}, ctx)
	}
}