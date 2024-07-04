
// mint coin_a
sui client call  --package 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978 --module coin_a --function mint --args 0x5d223e85919a64d56a0ac572067e90e41164403379dfe098b6326c37a776bd9d 10000 0x23128b49c05b475e6459e8f37a122f3aa19681e397e1bc333d14f2014c7b2a64

//mint coin_b
sui client call  --package 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978 --module coin_b --function mint --args 0xd667bd04e45aa21cebfe3e25dc108b88b2e6354d360ce32bdbf5306445b50731 10000 0x23128b49c05b475e6459e8f37a122f3aa19681e397e1bc333d14f2014c7b2a64

// create pool
sui client call  --package 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978 --module robbiechen_swap --function create_pool --type-args 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978::coin_a::COIN_A 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978::coin_b::COIN_B

// add_liquidity
sui client call \
     \
    --package 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978 \
    --module robbiechen_swap \
    --function add_liquidity \
    --type-args 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978::coin_a::COIN_A 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978::coin_b::COIN_B \
    --args 0x76fe408904475e4da12bf2d039b843e78408cd4f8b633e27040224d807abd605 0x4c72db9b6a576e267605d3c0a343d6df658024ee4cb5299fd1c6342ade60582a 0xf9994ddb85155d2649f573ecee9998bbd1a7dab3f8bfb0d1347b5f9c1932370b

sui client call  --package 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978 --module robbiechen_swap --function add_liquidity --type-args 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978::coin_a::COIN_A 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978::coin_b::COIN_B --args 0x76fe408904475e4da12bf2d039b843e78408cd4f8b633e27040224d807abd605 0xe7df5d465f69f5317fed59a922368efd4c0c9115a8b925b5a3c3240c293dc12a 0xb27e1ba57f803c9dea5a67a947447a6cef74c485df54304d61e863d9f6f4aa8f 0xf16a1114355f498a50627915323d08202298f01d8ca8595cac3ddf85e11ed453

// coina to coin_b
sui client call  --package 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978 --module robbiechen_swap --function tom_swap_jerry --type-args 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978::coin_a::COIN_A 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978::coin_b::COIN_B --args 0x76fe408904475e4da12bf2d039b843e78408cd4f8b633e27040224d807abd605 0xbe2180186322161d29e28ca3fe2b1a0ec425ca67d8ee6e32686fd169beb221ad

// coinb to coin a
sui client call  --package 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978 --module robbiechen_swap --function jerry_swap_tom --type-args 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978::coin_a::COIN_A 0x1e74adb0c5f560a2042eb9a61bbbe93577ebef2a58ab461521b8ed2d1f6a1978::coin_b::COIN_B --args 0x76fe408904475e4da12bf2d039b843e78408cd4f8b633e27040224d807abd605  0xd47cf5067907231ed411f7d00dde48a0653b3db7f94b12e4f276d211140d4bd2