sui client publish --skip-fetch-latest-git-deps --skip-dependency-verification



# devnet 
export  PKG=0x5004eab7e42fd66ad3b7475632ae3070e9a4015f8f8976009e7e8637592e9d76
export JP_CAP=0xdd789eee513521bcf04ad857aaa549e97017261bb7054fbf865a208a31c17d4b


# SET THE ADDRESS  to receive
export W_ADDR=0x7cbe5e6596e23266dd5763dd89b4ab1195516908ecde8febfe96685c7cbe6432
# the current client active-address
export C_ADDR=0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38

# faucet    , mint_and_transfer
sui client switch --address $C_ADDR
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args $PKG::jp::JP  --args $JP_CAP   8800000   $C_ADDR
sui client balance   $C_ADDR



sui client switch --address $W_ADDR
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args $PKG::jp::JP  --args $JP_CAP   7700000   $C_ADDR
sui client balance   $W_ADDR




