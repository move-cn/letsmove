# task2
```shell
sui move build --skip-fetch-latest-git-deps 
sui client publish --gas-budget=20000000 --skip-fetch-latest-git-deps 

export PACKAGE_ID=0x285b8832565c0a621f8abf36a32d8557ea987b1f07e2c2901ea3e51620ad1feb
export MY_COIN=0x8ae11bc3d81054d21d1d9d6a315390225128cb6534381f7d206d858892c2323e
export FAUCET_COIN=0xb8c390e8a9294de1040858be7f31b9938edc70d03bd4ee4777e1e0450b0e6ddb
export ADDRESS=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --function mint --module my_coin --package $PACKAGE_ID --args $MY_COIN 100000000000 $ADDRESS --gas-budget 20000000

sui client call --function mint --module faucet_coin --package $PACKAGE_ID --args $FAUCET_COIN 100000000000 $ADDRESS --gas-budget 20000000

96gWbiuH53dwsumgXxKkaJbpbbveu1v7UEQVrj5kxxW6
```


# task3
```shell
sui move build --skip-fetch-latest-git-deps 
sui client publish --gas-budget=20000000 --skip-fetch-latest-git-deps 

export PACKAGE_ID=0xfc7875f481a6f62e9622efefbbf359d867eea774b9e226641d734db8af9b57c5
sui client call --function mint_to_sender --module my_nft --package $PACKAGE_ID --args "a981008" "github a981008 profile" "https://github.com/a981008" --gas-budget 20000000

export NFT_ID=0x0e12b3a76ddb35c1d02337df090b92924e8a53753fba5d396b6785bfe8b8f5da
export RECIPIENT_ID=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
sui client call --function transfer --module my_nft --package $PACKAGE_ID --args $NFT_ID $RECIPIENT_ID --gas-budget 20000000
sui client object $NFT_ID
```

```shell
# task4
sui move build --skip-fetch-latest-git-deps 
sui client publish --gas-budget=20000000 --skip-fetch-latest-git-deps 

export PACKAGE_ID=0x6c81ac41d62991c3332bb54e63fd70a9d165ed23496ef33501a667992d063129
sui client call --function play --module finger_guessing_game --package $PACKAGE_ID --args 0 0x6 --gas-budget 20000000
```
