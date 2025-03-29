module wangdabaoqq_faucet::wangdabaoqq_faucet {
  use sui::coin::{Self, TreasuryCap };
  use sui::url::{Url,Self};

  public struct WANGDABAOQQ_FAUCET has drop {}
  
  fun init(witness: WANGDABAOQQ_FAUCET, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(witness, 8, b"WANGDABAOQQ_FAUCET", b"WANGDABAOQQ_FAUCET", b"Move coin by WANGDABAOQQ_FAUCET", option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/17332298")), ctx);
    transfer::public_share_object(metadata);
    transfer::public_transfer(treasury, ctx.sender())
  }

  public entry fun mint(treasury: &mut TreasuryCap<WANGDABAOQQ_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) {
    let minted_coin = coin::mint(treasury, amount, ctx);
    transfer::public_transfer(minted_coin, recipient);
  }
}
