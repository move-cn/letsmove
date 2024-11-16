
sui client publish --skip-fetch-latest-git-deps --skip-dependency-verification

# devnet 
export  PKG=0xb6b7cc1b7b4e7183ba42341c22f10c56b86d70e14a02d4f321769c687b2dabd2
export  YDT_CAP=0xc6c730b35f3971c13f1a8c829c8632ba0775f28cf55b93744dc12cc32f5f1f7e
# the current client active-address
export C_ADDR=0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38

# coin_own   ydt , mint_and_transfer
sui client switch --address $C_ADDR
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args $PKG::yuan_da_tou::YUAN_DA_TOU  --args $YDT_CAP   5000000   $W_ADDR
sui client balance   $W_ADDR