# publish
sui client publish

# mint and transfer
sui client call `
--package  0x2 `
--module coin `
--function mint_and_transfer `
--type-args '0x388ecc0ef7261e40f7be055c723e4bf275d3eeb33eae3525e4b7096065b19b73::my_coin::MY_COIN' `
--args 0x9a7542f2b37e3217cbfdb3ed748f6017664fd1653a0fc36f695c6f7bfc20f49d 100000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2


# faucet mint1
sui client call `
--package  0x2 `
--module coin `
--function mint_and_transfer `
--type-args '0x388ecc0ef7261e40f7be055c723e4bf275d3eeb33eae3525e4b7096065b19b73::faucet_coin::FAUCET_COIN' `
--args 0xc1ecb008f20a5c4504545de9107057c2ce0674ca34ebf614ebed8e5a77772ccb 100000000000 0xc63163862ecc6c4d97f877f33a9c86fad0fc0a2ce3f5cc59b21b73d28fba3e53



# faucet mint2
sui client call `
--package  0x2 `
--module coin `
--function mint_and_transfer `
--type-args '0x388ecc0ef7261e40f7be055c723e4bf275d3eeb33eae3525e4b7096065b19b73::faucet_coin::FAUCET_COIN' `
--args 0xc1ecb008f20a5c4504545de9107057c2ce0674ca34ebf614ebed8e5a77772ccb 100000000000 0x2f06f8b1ed9d542fbd181914e57427a1ba49b4c2e75eb36e0753cf4b94465bb9
