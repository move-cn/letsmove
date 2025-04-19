# deposit coin
# public entry fun deposit(
#     _: &AdminCap,
#     swap: &mut Swap,
#     coin: &mut Coin<TCOIN>,
#     coin_amt: u64,
#     faucet_coin: &mut Coin<TCOIN_FACUET>,
#     faucet_coin_amount: u64,
#     ctx: &mut TxContext
 sui client call \
  --package 0x30ec5f1b0b84bfb8f35c2d86574a044a21c60276339a74499b9148fb1a3f676d \
  --module swap \
  --function deposit \
  --args \
    0x85fdd497700b06fe30ff3dae9d7f2e48c33af6e9d0e1629598e297ba5e28e381 \
    0xe7f99e754a8f8fddaec3e70e0f9127b4740da2cef3a705377869756767355986 \
    0x1c959dc344d0e748764019867f97f726a00e5edf25b7e0670acd4c0087a327e0 \
    500000000 \
    0xad0b0d2ff203e315ee3f020b4859c08ac79de9871846ca2587224f3dabf59ea3 \
    5000000000

# coin -> faucet_coin
# public entry fun coin_to_faucet(
#     swap: &mut Swap,
#     in_coin: &mut Coin<TCOIN>,
#     in_amount: u64,
#     ctx: &mut TxContext
 sui client call \
  --package 0x30ec5f1b0b84bfb8f35c2d86574a044a21c60276339a74499b9148fb1a3f676d \
  --module swap \
  --function coin_to_faucet \
  --args \
    0xe7f99e754a8f8fddaec3e70e0f9127b4740da2cef3a705377869756767355986 \
    0x1c959dc344d0e748764019867f97f726a00e5edf25b7e0670acd4c0087a327e0 \
    100000000

# faucet_coin -> coin
# public entry fun faucet_to_coin(
#     swap: &mut Swap,
#     in_coin: &mut Coin<TCOIN_FACUET>,
#     in_amount: u64,
#     ctx: &mut TxContext
 sui client call \
  --package 0x30ec5f1b0b84bfb8f35c2d86574a044a21c60276339a74499b9148fb1a3f676d \
  --module swap \
  --function faucet_to_coin \
  --args \
    0xe7f99e754a8f8fddaec3e70e0f9127b4740da2cef3a705377869756767355986 \
    0x40caf1c4de804404ab07ba860b6959cf2bd9ad94f61da2428eade1434087d45d \
    1000000000