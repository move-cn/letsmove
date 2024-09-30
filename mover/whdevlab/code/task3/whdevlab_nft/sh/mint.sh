export NFT_NAME="whdevlab"
export DESCRIPTION="whdevlabnft"
export AVATARURL="https://avatars.githubusercontent.com/u/50726147?v=4"
export PACKAGE_ID=0x035740867ecdfae69e07fa85bb08086d21ab6a69266296b7e4c048a0f640a267

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module whdevlab_nft --function mint_nft --args $NFT_NAME $DESCRIPTION $AVATARURL
