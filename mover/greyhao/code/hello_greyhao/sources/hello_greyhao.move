/*
/// Module: hello_greyhao
module hello_greyhao::hello_greyhao;
*/
// 包的地址：模块名
module hello_greyhao::hello_greyhao {
  // 引用其他模块，以下默认已经被导入可以直接用
  // use sui::object::{Self, UID};
  // use sui::transfer;
  // use sui::tx_context::{Self, TxContext};
  use std::string::{String, utf8};

  public struct HelloGreyHaoObject has key, store {
    id: UID,
    text: String
  }

  #[lint_allow(self_transfer)]
  public fun mint(ctx: &mut TxContext) {
    let object = HelloGreyHaoObject{
      id: object::new(ctx),
      text: utf8(b"Hello greyhao!")
    };
    transfer::public_transfer(object, tx_context::sender(ctx));
  }
}