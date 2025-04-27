# mint
sui client call \
  --package 0x2b0ff39ca9dc1dfd37daf3370872e60d0bb6aad87121cddb488a0aa9042ac002 \
  --module task3 \
  --function mint_and_transfer \
  --args 'Avatar_NFT' 'https://avatars.githubusercontent.com/u/30771431?v=4' 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \
  --gas-budget 10000000
