module hello_move::hello_move {
  
  use std::string;
  use sui::object::{Self, UID};
  use sui::transfer;
  use sui::tx_context::{Self, TxContext};

  public struct HelloMove has key {
    id: UID,
    text: string::String,
  }

  fun init(ctx: &mut TxContext) {
    let m = HelloMove {
      id: object::new(ctx),
      text: string::utf8(b"fishsalter"),
    };
    transfer::transfer(m, tx_context::sender(ctx));
  }
}
