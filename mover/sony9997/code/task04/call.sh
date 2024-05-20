sui client publish --gas-budget 50000000 --skip-dependency-verification  --with-unpublished-dependencies --skip-fetch-latest-git-deps

export CLOCK=0x6
export PACKAGE_ID=0x16da5f3b60b187eefe9bd10e739ed4654a1d5c7e9230cf2a7a61b49f01754477
export AdminCap_ID=
export TreasuryCap_ID=
export Game_ID=0xf560c2ab46f9ae93065dec946e5fe40b624a3b3766514088e4fc968945cfbde3

# mint coin
sui client call --function get_faucet_coin --module sony9997_game  --package $PACKAGE_ID --gas-budget 5000000 --args $TreasuryCap_ID 1500
export Coin_ID=0x638bc670b784e1059c5cd5110cc5c292a80c78cb2a834b8d2dca8a6293f7f5e4

sui client call --function deposit --module sony9997_game  --package $PACKAGE_ID --gas-budget 3000000 --args $Game_ID $Coin_ID 20000
sui client call --function guess_fists --module sony9997_game  --package $PACKAGE_ID --gas-budget 30000000 --args 1 $Game_ID $Coin_ID $CLOCK