# testnet test
sui client call --package 0x2 \
--module coin --function mint_and_transfer \
--args 0xfd92912b3b7fd159afb39329c1ccdd8719c7a6042fce9ce1106f688dcca2045d \
100000000 0xfabe32506438a111fa9cc7db561bea1e47121ef51cdb4e6b73658e90e60a88f5 \
--type-args "0x0a85af72122aa89d98ff4720f7ef7faf370397719270635602beeac7748dc78c::my_coin::MY_COIN"


# testnet my_coin
sui client call --package 0x2 \
--module coin --function mint_and_transfer \
--args 0x00aa511457d549ea6fee8cf156133f01e6e34cb2493a18819c11609057989f35 \
100000000 0xfabe32506438a111fa9cc7db561bea1e47121ef51cdb4e6b73658e90e60a88f5 \
--type-args "0x757db1db897d77a171633455a20c9bb9ce7fbcc1a4d5271b59ad1ab5c5708d64::my_coin::MY_COIN"


# devnet share_coin
sui client call --package 0x2 \
--module coin --function mint_and_transfer \
--args 0xa62a3d0a38824f7445af2288502555fb2fa2cef0b658c1632bb03c656de6ca00 \
100000000 0xfabe32506438a111fa9cc7db561bea1e47121ef51cdb4e6b73658e90e60a88f5 \
--type-args "0x757db1db897d77a171633455a20c9bb9ce7fbcc1a4d5271b59ad1ab5c5708d64::share_coin::SHARE_COIN"



sui client call --package 0x2 --module coin --function mint_and_transfer --args 0x00aa511457d549ea6fee8cf156133f01e6e34cb2493a18819c11609057989f35 100000000 0xfabe32506438a111fa9cc7db561bea1e47121ef51cdb4e6b73658e90e60a88f5 --type-args "0x757db1db897d77a171633455a20c9bb9ce7fbcc1a4d5271b59ad1ab5c5708d64::my_coin::MY_COIN"

sui client call --package 0x2 --module coin --function mint_and_transfer --args 0x00aa511457d549ea6fee8cf156133f01e6e34cb2493a18819c11609057989f35 100000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --type-args "0x757db1db897d77a171633455a20c9bb9ce7fbcc1a4d5271b59ad1ab5c5708d64::my_coin::MY_COIN"


sui client call --package 0x2 --module coin --function mint_and_transfer --args 0xa62a3d0a38824f7445af2288502555fb2fa2cef0b658c1632bb03c656de6ca00 130000000 0xfabe32506438a111fa9cc7db561bea1e47121ef51cdb4e6b73658e90e60a88f5 --type-args "0x757db1db897d77a171633455a20c9bb9ce7fbcc1a4d5271b59ad1ab5c5708d64::share_coin::SHARE_COIN"


# 新版，这是最新的，按照这个来

# test 放在test环境中测试

sui client call --package 0x2 \
--module coin --function mint_and_transfer \
--args 0x1f36715611cfd28fc23a987911f41389254140225188185a9da81fd391d8c321 \
100000000 0xfabe32506438a111fa9cc7db561bea1e47121ef51cdb4e6b73658e90e60a88f5 \
--type-args "0x9417612399489bb79130c0ae88ee237c0bff16a8ba5d9738e2f8033a960db517::my_coin_test::MY_COIN_TEST"

sui client call --package 0x2 --module coin --function mint_and_transfer --args 0x1f36715611cfd28fc23a987911f41389254140225188185a9da81fd391d8c321 100000000  0xfabe32506438a111fa9cc7db561bea1e47121ef51cdb4e6b73658e90e60a88f5 --type-args "0x9417612399489bb79130c0ae88ee237c0bff16a8ba5d9738e2f8033a960db517::my_coin_test::MY_COIN_TEST"

# test share coin

sui client call --package 0x2 \
--module coin --function mint_and_transfer \
--args 0x37254c9b981413506bd900c0b9fb00672563eedc1e089b913145d7417a96b597 \
100000000 0xfabe32506438a111fa9cc7db561bea1e47121ef51cdb4e6b73658e90e60a88f5 \
--type-args "0x9417612399489bb79130c0ae88ee237c0bff16a8ba5d9738e2f8033a960db517::share_coin_test::SHARE_COIN_TEST"

sui client call --package 0x2 --module coin --function mint_and_transfer --args 0x37254c9b981413506bd900c0b9fb00672563eedc1e089b913145d7417a96b597 100000000 0xfabe32506438a111fa9cc7db561bea1e47121ef51cdb4e6b73658e90e60a88f5 --type-args "0x9417612399489bb79130c0ae88ee237c0bff16a8ba5d9738e2f8033a960db517::share_coin_test::SHARE_COIN_TEST"