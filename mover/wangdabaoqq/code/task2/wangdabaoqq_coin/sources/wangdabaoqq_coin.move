module wangdabaoqq_coin::wangdabaoqq_coin {
  use sui::coin::{Self, TreasuryCap };
  use sui::url::{Url,Self};

  public struct WANGDABAOQQ_COIN has drop {}

  fun init(witness: WANGDABAOQQ_COIN, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(witness, 8, b"WANGDABAOQQ_COIN", b"WANGDABAOQQ_COIN", b"Move coin by WANGDABAOQQ_COIN", option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/17332298")), ctx);
    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury, ctx.sender())
  }
}