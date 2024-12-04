module task1::hello_world {
  use std::ascii::{String, string};
  use sui::tx_context::sender;

  public struct HelloWorld has key, store {
    id: UID,
    say: String,
  }

  fun init(ctx: &mut TxContext) {
    transfer::public_transfer(
      HelloWorld {
        id: object::new(ctx),
        say: string(b"Hello yinheli"),
      },
      sender(ctx),
    );
  }
}