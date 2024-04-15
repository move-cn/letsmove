module hello_world::hello_world {

  use std::string;
  use sui::object::{Self, UID};
  use sui::transfer;
  use sui::tx_context::{Self, TxContext};

  struct HelloWorldObject has key, store {
    id: UID,
    text: string::String
  }

  public entry fun mint(ctx: &mut TxContext) {
    let hello = HelloWorldObject {
      id: object::new(ctx),
      text: string::utf8(b"Hello world")
    };
    transfer::transfer(hello, tx_context::sender(ctx))
  }
}