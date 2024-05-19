## coin and faucet

sui client publish --gas-budget 40000000

export PACKAGE_ID=0x37b20406866053c3944f1f89ea1d86120dae36a791941cc6cf22ae65232f7c54

export COIN_TREASURE=0x5f0567bbcf4ca5d22f5eedeeea18ddedd0e1e41ed48b449e8667ce198f0090e7
export FAUCET_TREASURE=0x88a1063e7d6da4154040051255d0f437474b1b1a57f3350622b4e6c7da23db93 

export COIN_TYPE=0x37b20406866053c3944f1f89ea1d86120dae36a791941cc6cf22ae65232f7c54::halsey929_coin::HALSEY929_COIN
export FAUCET_TYPE=0x37b20406866053c3944f1f89ea1d86120dae36a791941cc6cf22ae65232f7c54::halsey929_faucet_coin::HALSEY929_FAUCET_COIN

export MY_ADDR=0x2d92259fd0c9c8934a5a9bd6d975d8d63efbf110ac9d01a001098aa55525bfa9
export DEFAULT_ADDR=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module halsey929_coin --function mint --args $COIN_TREASURE 1000 $DEFAULT_ADDR

Transaction Digest: 3Xw7Y2vFjdvqw7rfJuU7iBSe7RLdXWk7a9nneQA1ZGry

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module halsey929_faucet_coin --function mint --args $FAUCET_TREASURE 1000 $DEFAULT_ADDR

Transaction Digest: 2189oRdqRCYXJB8Sv9Y3wjtJo7nFxU3Aeawe7dUGQ3gE

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module halsey929_faucet_coin --function mint --args $FAUCET_TREASURE 1000 $MY_ADDR

Transaction Digest: 5a34JzFn5PSVjZJt1LWPXu7XYxiL5jWeyBhHvWppDtu4
