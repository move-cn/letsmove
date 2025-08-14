module faucet_coin::BelenLuoFaucetCoin {
  // Part-1: Imports
  use sui::coin::{Self, TreasuryCap};

  // Part-2: Type Definition
  public struct BELENLUOFAUCETCOIN has drop {}

  // Part-3: Create Coin and transfer to Witness
  fun init(witness: BELENLUOFAUCETCOIN, ctx: &mut TxContext) {

    // Part-3-1: Create Coin
    let (treasuryCap, coinMetadata) = coin::create_currency<BELENLUOFAUCETCOIN>(
        witness,
        1,
        b"BLF",
        b"Belen-Luo-Faucet",
        b"This is the Coin that Belen created in order to learn move",
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
    treasuryCap: &mut TreasuryCap<BELENLUOFAUCETCOIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext
  ) {
    let coin = coin::mint(treasuryCap, amount, ctx);
    transfer::public_transfer(coin, recipient);
  }

  #[test_only]
  public fun test_init(ctx: &mut TxContext) {
    init(BELENLUOFAUCETCOIN {}, ctx)
	}
}
