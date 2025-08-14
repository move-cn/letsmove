编写task4game
/*关联发布的coin包，在toml文件中，与本地coin 文件夹toml中 添加coin package ID;并 local 地址添加本地地址，根据game 文件夹与coin文件夹相对跳转路径，确定/../../task2_coin */


Task2 Coin sources :https://github.com/MystenLabs/sui/blob/main/crates/sui-framework/packages/sui-framework/sources/coin.move


sui client call --package 0x1234... --module faucet --function request_faucet --args 0x5678... 1000

sui client call  --package 0x6aa34e8a862ad6f17b604da93390f9ffe18f4576f020997507613ef2c46d0801  --module oiia  --function mint_and_transfer --args 0x3129ea688c4330af54f7a10941972da2fea05ee6f7c44ae75dda305e9fc3da82 1000000000 0x748ab0101702695a5624680710b9a470f89c6df5cbc4889a6159bb7d5c54f57f


sui client call  --package 0x2  --module coin  --function mint_and_transfer --type-args 0xdad9f7e9c2342c75ecdd324e9631da5bd551a709632ba8fa8eed12b11df44dc2::oiia::OIIA   --args 0xad73864f7c3780b83b879ad122736728033586edee0bbc53ff5ccfe00a337b9e 1000000000 0x748ab0101702695a5624680710b9a470f89c6df5cbc4889a6159bb7d5c54f57f

//game play
sui client call --package 0x9813f3e392cf5d4a54ede10c0ef5437dfd5f0d31fcda40fcf4d4c1d9e3a3a1b0 --module game_beta --function Play --args 0xea7e6cb25605973ccef1a23e6c267736385d44a33f02c040bb3c795d999da307 0x8 false 0x995b26bd6c29298c0cc2f46fe9b9fd3ec78209e3469cb309384e854ab69e87d7 100 --gas-budget 1000000




//Swap
sui client call --package 0xaec91a2255e515817f10b056ccbab874192e44e2a0021019765302e18098a108 --module CTF_Check_In --function get_flag --args "0xd4e731ef62bf7a989b8ace044007083b32abec02d6474c1605fa2071f29d9810" "SherVite" 0x7cc93f7b71a8a28d0667a6d158b057de4734bd8fbc3511e7eb27d20c4c054d29 0x8

sui client call   --package 0xaec91a2255e515817f10b056ccbab874192e44e2a0021019765302e18098a108   --module ctf_checkin   --function calculate_flag   --args "0x5368657256697465" "0x4c4554535355494d4f5645435446"


proof:0b4c6574734d6f766543544603000000000000008500000000000000
CHALLENGE_ID :0xaf5e84181836c1f2203d67679683c97451159d8e22f201ab86af1d78d6cf40e6

sui client call \
  --package <PACKAGE_ID> \
  --module lets_move \
  --function get_flag \
  --args "0x<proof_hex>" "你的 GitHub ID" <CHALLENGE_ID> 0x8

  sui client call \
  --package 0x5b8be518930b1a574bb099c5b1bc033ed530178d5c97a005e336dbc13b6d8232 \
  --module lets_move \
  --function get_flag \
  --args "0x0b4c6574734d6f766543544603000000000000008500000000000000" "SherVite" 0xaf5e84181836c1f2203d67679683c97451159d8e22f201ab86af1d78d6cf40e6 0x8

sui client call --package 0xf96e4b20eb2bcaf736a8f249690df86eaf1f7fe3f160d7d2f1cb9a447a89e1cc --module lets_move --function get_flag --args "0xdfefdc0000000000" "SherVite" 0xe8e4aad9b765da2f90ee81c49e4550ea3e5045c53389fd89b8ec4e23abeddd77 0x8


task07
sui client call --package 0x9f16384006b3dc0ff2927d7eae90186469cb6475d67862822c5f6cedd38c93f6 --module ctf_checkin --function calculate_flag --args b"SherVite" b"LETSSUIMOVECTF"

task08 SDK get

sui client execute --package <辅助模块ID> --module helper --function create_random --gas-budget 10000000

sui client call \
  --package <PACKAGE_ID> \
  --module lets_move \
  --function get_flag \
  --args '["0x<proof_hex>"]' '"your-github-id"' '0x4e4e44507bf9bc2275949385bb6d23a3a6d50ebf7f36fa1f6724d49508089e09' \
  --gas-budget <GAS_BUDGET>