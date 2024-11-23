
module counter::counter;
  public struct Counter has key {
    id: UID,
    owner: address,
    value: u64
  }
  public fun create(ctx: &mut TxContext) {
    transfer::share_object(Counter {
      id: object::new(ctx),
      owner: ctx.sender(),
      value: 0
    })
  }
  public fun increment(counter: &mut Counter) {
    counter.value = counter.value + 1;
  }
  public fun set_value(counter: &mut Counter, value: u64, ctx: &TxContext) {
    assert!(counter.owner == ctx.sender(), 0);
    counter.value = value;
  }

