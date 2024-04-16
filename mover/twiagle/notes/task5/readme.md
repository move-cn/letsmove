测试网 0xe34f375a8a64a137024c2893e031d5c5a95d6f493c8fab1936de985fbe28ac72  
### 央行模式 twiaglecoin 1000  
sui client call --function mint_and_transfer --module twiaglecoin --package 0x892bf3a4fcb00c8e8e4a03073d29f3f8a413f2c01e7e16f7753a9e8c907f5850 --args 0x2141a90ccac58704e688150611f853585f195f886fc559150d7855cbdc855f5d 1000 0xe34f375a8a64a137024c2893e031d5c5a95d6f493c8fab1936de985fbe28ac72 --gas-budget 100000000
export twiaglecoin=0xf3776b91c5bd0ba0fb0bed6207762f0bc5dc9a5394c1895afbf17fe085ca6062
### 水龙头模式 twiaglefaucet 100
sui client call --function mint_and_transfer --module twiaglefaucet --package  0x1dff8ee913ca2a5e5441b273025bb5fccc304c37cbbd9b128f5620f0e4b5a57b --args 0xe4d837ab3e8e4e96c9c39fa961f8dfb7febf8b260732bf064930ef00d5db0c60 100 0xe34f375a8a64a137024c2893e031d5c5a95d6f493c8fab1936de985fbe28ac72 --gas-budget 100000000  
export twiaglefaucet=0x04dc9388b3f372c03c2e76c4eb36a4fa7d4b0b90ebfefadfe54274b0debb6289
### create_liquidity_pool twiaglecoin 1000 水龙头模式 twiaglefaucet 100
sui client call --function create_liquidity_pool --module twiagle --package 0xa5bba5debe76969fa518f942ec07c7ecaeddbb693bddf0f6d1bbdd568039ad24 --args  $twiaglecoin  $twiaglefaucet  --gas-budget 100000000  
### swap 10 twiaglecoin for twiaglefaucet
### mainnet
sui client call --function mint_and_transfer --module twiaglecoin --package 0xbea2b5fdc52a58271004d9488ae303db146f82c8b9f0cd45fbdb9e3460d531bc --args 0x4e5fa42b23976ff9dabf09f21d426d37ebb69c4416231e4e572ee5a051326f2c 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 100000000
