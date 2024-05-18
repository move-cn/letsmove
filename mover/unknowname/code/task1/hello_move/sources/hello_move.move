module hello_move::hello_move {
  use std::string;
  
  public struct Hello has key, store {
    id: UID,
    msg: string::String,
  }

  
  fun init(ctx: &mut TxContext) {
    let hello = Hello {
      id: object::new(ctx),
      msg: string::utf8(b"unknowname")
    };

    transfer::transfer(hello, ctx.sender());

  }


}
