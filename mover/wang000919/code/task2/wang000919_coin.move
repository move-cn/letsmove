/*
/// Module: wang000919_coin
module wang000919_coin::wang000919_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module my_coin::wang000919_coin{
  use sui::coin::create_currency;
  use std::option::{Self, none, some};
  use sui::transfer::{public_transfer, public_freeze_object};
  use sui::url::{Self, Url};
  public struct WANG000919_COIN has drop{}
  
  fun init(wang000919_coin: WANG000919_COIN,ctx: &mut TxContext) {
    let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/174563322");
    let yes = some<Url>(url);

    let (treasury, coin_metadata) = create_currency(
      wang000919_coin,
      8,
      b"WANG000919_COIN",
      b"WANG000919_COIN",
      b"Hello,Mr.Coin!",
      yes,
      ctx
    );
    public_freeze_object(coin_metadata);
    public_transfer(treasury, ctx.sender());
  }
}