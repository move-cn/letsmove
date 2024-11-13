module hello_move::hello_klren0312 {
  use std::string::{String};
  use sui::transfer::transfer;
  use sui::tx_context::{sender};

  public struct Hello has key {
    id: UID,
    say: String
  }

  fun init (ctx: &mut TxContext) {
    let hello_move = Hello { id: object::new(ctx), say: b"klren0312".to_string() };
    transfer(hello_move, sender(ctx));
  }
}

