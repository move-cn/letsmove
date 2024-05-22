module starkright_faucet::starkright_faucet {
  // Part-1: Imports
  use sui::coin::{Self, TreasuryCap};

  // Part-2: Type Definition
  public struct STARKRIGHT_FAUCET has drop {}

  // Part-3: Create Coin and transfer to Witness
  fun init(witness: STARKRIGHT_FAUCET, ctx: &mut TxContext) {

    // Part-3-1: Create Coin
    let (treasuryCap, coinMetadata) = coin::create_currency<STARKRIGHT_FAUCET>(
        witness,
        1,
        b"STARKRIGHT_FAUCET",
        b"STARKRIGHT_FAUCET",
        b"STARKRIGHT_FAUCET",
        option::none(),
        ctx
    );

    // Part-3-2: Freeze Coin
    transfer::public_freeze_object(coinMetadata);

    // Part-3-3: Transfer Coin
    transfer::public_share_object(treasuryCap);
  }

  // Part-4: Mint 
  public fun mint(
    treasuryCap: &mut TreasuryCap<STARKRIGHT_FAUCET>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext
  ) {
    let coin = coin::mint(treasuryCap, amount, ctx);
    transfer::public_transfer(coin, recipient);
  }

  #[test_only]
  public fun test_init(ctx: &mut TxContext) {
    init(STARKRIGHT_FAUCET {}, ctx)
	}
}