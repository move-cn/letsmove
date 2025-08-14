/// Module: my_coin
module hstar::faucet_coin {
  use sui::coin::{Self, TreasuryCap, Coin};
  use sui::url::new_unsafe;
  
  public struct FAUCET_COIN has drop {}
  
  #[allow(lint(share_owned))]
  fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
    // use my github avatar as the token icon
    let icon_url = new_unsafe(std::ascii::string(b"https://avatars.githubusercontent.com/u/4043284"));
    let (treasury, metadata) = coin::create_currency(witness,
      6, // decimals
      b"HSTAR_FAUCET_COIN", // symbol
      b"hstar faucet coin", // name
      b"hstar's faucet coin", // description,
      option::some(icon_url), // icon_url
      ctx);
    transfer::public_freeze_object(metadata);
    // Import! Everyone can mint this token
    transfer::public_share_object(treasury);
  }
  
  public entry fun mint(
    treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
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
    treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
    coin: Coin<FAUCET_COIN>
  ) {
    coin::burn(treasury_cap, coin);
  }
}
