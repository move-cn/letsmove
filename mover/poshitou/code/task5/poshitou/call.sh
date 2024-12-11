# build
sui move build --skip-fetch-latest-git-deps

# publish
sui client publish --skip-fetch-latest-git-deps

sui client call `
--package  0x2 `
--module coin `
--function mint_and_transfer `
--type-args '0x388ecc0ef7261e40f7be055c723e4bf275d3eeb33eae3525e4b7096065b19b73::faucet_coin::FAUCET_COIN' `
--args 0xc1ecb008f20a5c4504545de9107057c2ce0674ca34ebf614ebed8e5a77772ccb 100 0xd842b07687548bef8605dab499624f8aacd2c6108b7909db433a6394b435f57c


# mint and transfer
sui client call `
--package  0x2 `
--module coin `
--function mint_and_transfer `
--type-args '0x388ecc0ef7261e40f7be055c723e4bf275d3eeb33eae3525e4b7096065b19b73::my_coin::MY_COIN' `
--args 0x9a7542f2b37e3217cbfdb3ed748f6017664fd1653a0fc36f695c6f7bfc20f49d 100 0xd842b07687548bef8605dab499624f8aacd2c6108b7909db433a6394b435f57c


sui client call `
--package  0xe31d7e17f01f89b34459b467547d2febadf672f4c809742a10b08e267b3f1dad `
--module poshitou_swap `
--function deposit_faucet_coin `
--args 0x2255714f3e6872921ff1f9c0c742c74230fee49c3f2eea5c6d5f095f52a34ff3 0x6e7af64e816d7c9c143591ddfabf1f156b62e4d273c2b7e6479e1aec19884882


sui client call `
--package  0xe31d7e17f01f89b34459b467547d2febadf672f4c809742a10b08e267b3f1dad `
--module poshitou_swap `
--function deposit_my_coin `
--args 0x2255714f3e6872921ff1f9c0c742c74230fee49c3f2eea5c6d5f095f52a34ff3 0xf67236272ffee5eb128b3e900fbc0dc620f03f7df2690ddca7fca527d2e07d8c


sui client call `
--package  0xe31d7e17f01f89b34459b467547d2febadf672f4c809742a10b08e267b3f1dad `
--module poshitou_swap `
--function swap_faucet_coin_to_my_coin `
--args 0x2255714f3e6872921ff1f9c0c742c74230fee49c3f2eea5c6d5f095f52a34ff3 0xb9385eabb1083466c0833a10b9c3c705ccd183a7adf20998ef9494fcbf843249


sui client call `
--package  0xe31d7e17f01f89b34459b467547d2febadf672f4c809742a10b08e267b3f1dad `
--module poshitou_swap `
--function swap_mycoin_to_faucet_coin `
--args 0x2255714f3e6872921ff1f9c0c742c74230fee49c3f2eea5c6d5f095f52a34ff3 0xb08529c699ee47bf530f8d38aefd12232371fe26cc3517b2b89a7c51b92bea5e