sui client call --package 0xc87e8ea75d7c36535c86ab7a5b275b2c9cc195a3603c85eab5b48a3f453ea158 \
  --module roll_the_dice \
  --function play \
  --args 0xda1f394dbf335c6f011ae93cb6cf61179d817df88e22998a4c76a6780b36145e 0x0000000000000000000000000000000000000000000000000000000000000008 0x23bb41a8ad934a61874f9ba1cc628d65e3890a3a86dab058a74f796acb39253b 

sui client call --package 0xc87e8ea75d7c36535c86ab7a5b275b2c9cc195a3603c85eab5b48a3f453ea158 \
  --module roll_the_dice \
  --function play \
  --args 0xda1f394dbf335c6f011ae93cb6cf61179d817df88e22998a4c76a6780b36145e 0x0000000000000000000000000000000000000000000000000000000000000008 0xd265ee6ec101fc060591cd8f7b2f3951ce91038b5cb3945dc464b23b9e661330 


#play 无法使用sui wallet在sui vision的网页上调用，会报错。估计是钱包检测比较严格？

# 另一个账号操作
# pay sui
# without --gas-budget 5000000, 会报错，暂时不知道为啥
sui client pay-sui --recipients 0x745658d5f3245a40cff94519269ab7e7401d0b981ca9809502f6ee78fff49f22 --input-coins 0x173a8fa390aeaebfb88738f544de4b94786ac28f15ffb2274e898aba99d89563 --amounts 500000000 --gas-budget 5000000



sui client call --package 0xc87e8ea75d7c36535c86ab7a5b275b2c9cc195a3603c85eab5b48a3f453ea158 \
  --module roll_the_dice \
  --function play \
  --args 0xda1f394dbf335c6f011ae93cb6cf61179d817df88e22998a4c76a6780b36145e 0x0000000000000000000000000000000000000000000000000000000000000008 0xb581bb605f32ff6794a27c188e0ad7723a364703df7a527f08f7fbf682b5bf89



# remove_game_coin(_: &GameAdminCap, game: &mut Game<ZEROS_FAUCET>, amt: u64, ctx: &mut TxContext)
sui client call --package 0xc87e8ea75d7c36535c86ab7a5b275b2c9cc195a3603c85eab5b48a3f453ea158 \
  --module roll_the_dice \
  --function remove_game_coin \
  --args 0xfdc95b2e6c3223a302065712a7dcf09e4018018cc604fe889715b1dce1871fbc 0xda1f394dbf335c6f011ae93cb6cf61179d817df88e22998a4c76a6780b36145e 100000000