module task2::faucet_test {
  use std::option;
  use sui::coin::{Self, TreasuryCap};
  use sui::transfer;
  use sui::tx_context::{Self, TxContext};
  use sui::url::{Url,Self}; // 导入SUI语言中的URL模块

  struct FAUCET_TEST has drop {}

  // 创建货币并转移给发送者
  fun init(waitness: FAUCET_TEST, ctx: &mut sui::tx_context::TxContext) {
    let (treasury_cap, meta) = coin::create_currency(
      waitness,
      2,
      b"FAUCET_TEST",
      b"FC",
      b"TESTCOIN",
      option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/44160914")),
      ctx
    );
    transfer::public_freeze_object(meta);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
  }

  // 铸币并转移给接收者
  public entry fun faucet(treasury_cap: &mut TreasuryCap<FAUCET_TEST>, recipient: address, ctx: &mut TxContext){
    coin::mint_and_transfer(treasury_cap, 100, recipient, ctx);
  }
}
