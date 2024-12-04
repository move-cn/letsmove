/// Module: my_coin
module hstar::hstar_coin {
  use sui::coin::{Self, TreasuryCap, Coin};
  use sui::url::new_unsafe;
  
  public struct HSTAR_COIN has drop {}
  
  /// Module initializer is called once on module publish. A treasury
  /// cap is sent to the publisher, who then controls minting and burning
  fun init(witness: HSTAR_COIN, ctx: &mut TxContext) {
    // use my github avatar as the token icon
    let icon_url = new_unsafe(std::ascii::string(b"https://avatars.githubusercontent.com/u/4043284"));
    let (treasury, metadata) = coin::create_currency(witness,
      6, // decimals
      b"HSTAR_COIN", // symbol
      b"hstar coin", // name
      b"hstar's coin", // description,
      option::some(icon_url), // icon_url
      ctx);
    transfer::public_freeze_object(metadata);
    // Sender has permission to mint token
    transfer::public_transfer(treasury, tx_context::sender(ctx))
  }
  
  public entry fun mint(
    treasury_cap: &mut TreasuryCap<HSTAR_COIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext,
  ) {
    // mint token
    let coin = coin::mint(treasury_cap, amount, ctx);
    // transfer to recipient
    transfer::public_transfer(coin, recipient)
  }
  
  public entry fun burn(
    treasury_cap: &mut TreasuryCap<HSTAR_COIN>,
    coin: Coin<HSTAR_COIN>
  ) {
    coin::burn(treasury_cap, coin);
  }
  
  #[test_only]
  public fun test_init(ctx: &mut TxContext) {
    init(HSTAR_COIN {}, ctx)
  }
}
