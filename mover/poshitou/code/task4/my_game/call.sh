# publish
sui client publish --skip-fetch-latest-git-deps


# faucet mint for admin
sui client call `
--package  0x2 `
--module coin `
--function mint_and_transfer `
--type-args '0x388ecc0ef7261e40f7be055c723e4bf275d3eeb33eae3525e4b7096065b19b73::faucet_coin::FAUCET_COIN' `
--args 0xc1ecb008f20a5c4504545de9107057c2ce0674ca34ebf614ebed8e5a77772ccb 1000 0xc63163862ecc6c4d97f877f33a9c86fad0fc0a2ce3f5cc59b21b73d28fba3e53

# faucet mint for player
sui client call `
--package  0x2 `
--module coin `
--function mint_and_transfer `
--type-args '0x388ecc0ef7261e40f7be055c723e4bf275d3eeb33eae3525e4b7096065b19b73::faucet_coin::FAUCET_COIN' `
--args 0xc1ecb008f20a5c4504545de9107057c2ce0674ca34ebf614ebed8e5a77772ccb 100 0x2f06f8b1ed9d542fbd181914e57427a1ba49b4c2e75eb36e0753cf4b94465bb9

# deposit_balance_to_game
sui client call `
--package  0xc6a269283b5468f11507e20d6e984de8edfb5f2722c0670bb943a863e6fd47fb `
--module my_game `
--function deposit_balance_to_game `
--args 0x514ad65bf217bad6b0acdca474ec0d8437650b58f2dfadb21bfe79dd85a077de 0x79e91b7f2c253964d258a011fe5c91570fecb3c6a515a97b59fede8eb108541c 0x7bddd2957bb1a21a1f2f64bb7877ba82011a6c4d93685b2d3fce7abd4c5005d0


#play
sui client call `
--package  0xc6a269283b5468f11507e20d6e984de8edfb5f2722c0670bb943a863e6fd47fb `
--module my_game `
--function play `
--args 0x1b1847f32e00ec1b1144023981d9282a4ca5676f677b01656b99ac8a98da1879 0x79e91b7f2c253964d258a011fe5c91570fecb3c6a515a97b59fede8eb108541c 0x8


#withdraw_balance
sui client call `
--package  0xc6a269283b5468f11507e20d6e984de8edfb5f2722c0670bb943a863e6fd47fb `
--module my_game `
--function withdraw_balance `
--args 0x514ad65bf217bad6b0acdca474ec0d8437650b58f2dfadb21bfe79dd85a077de 0x79e91b7f2c253964d258a011fe5c91570fecb3c6a515a97b59fede8eb108541c 900
