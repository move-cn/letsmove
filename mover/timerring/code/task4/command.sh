# deposit coin to game pool(only for admin)
#  public entry fun deposit(
#     // only for admin
#     _: &AdminCap,
#     in_coin: &mut Coin<TCOIN_FACUET>,
#     pool: &mut GamePool,
#     amount: u64,
#     ctx: &mut TxContext
 sui client call \
  --package 0x181d9abd5be5a6468bfcad5963d7ca811f8412a439bb2c630a8e2b8f917b8f25 \
  --module tgame \
  --function deposit \
  --args \
    0x679eccb9e6cb8d817ba49f63258733fbfa7ce3a0d35ce42322f33b6607260140 \
    0x40caf1c4de804404ab07ba860b6959cf2bd9ad94f61da2428eade1434087d45d \
    0xb7e0d4e88dab05e766f94697c7bcf27cd74b7795748e9156949e1941924ed3ce \
    1000000000

# withdraw from game pool(only for admin)
# // get coin (only for admin)
# public entry fun get_coin(_: &AdminCap, pool: &mut GamePool, amount: u64, ctx: &mut TxContext) {
#     // amount not over game pool amount
#     assert!(amount <= pool.amount.value(), ExceedPoolAmount);
#     let out_balance = pool.amount.split(amount); // split assign amount balance
#     let out_coin = coin::from_balance(out_balance, ctx); // create out coin balance -> coin
#     public_transfer(out_coin, ctx.sender()); // transfer out coin to sender
# }
 sui client call \
  --package 0x181d9abd5be5a6468bfcad5963d7ca811f8412a439bb2c630a8e2b8f917b8f25 \
  --module tgame \
  --function get_coin \
  --args \
    0x679eccb9e6cb8d817ba49f63258733fbfa7ce3a0d35ce42322f33b6607260140 \
    0xb7e0d4e88dab05e766f94697c7bcf27cd74b7795748e9156949e1941924ed3ce \
    100000000

# play game
# public entry fun play(
#     in_coin: &mut Coin<TCOIN_FACUET>,
#     // game pool
#     pool: &mut GamePool,
#     // bool judge
#     in: bool,
#     rand: &Random,
#     amount: u64,
#     ctx: &mut TxContext
 sui client call \
  --package 0x181d9abd5be5a6468bfcad5963d7ca811f8412a439bb2c630a8e2b8f917b8f25 \
  --module tgame \
  --function play \
  --args \
    0x40caf1c4de804404ab07ba860b6959cf2bd9ad94f61da2428eade1434087d45d \
    0xb7e0d4e88dab05e766f94697c7bcf27cd74b7795748e9156949e1941924ed3ce \
    true \
    0x8 \
    10000000
