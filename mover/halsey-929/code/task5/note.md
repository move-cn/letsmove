sui client publish --gas-budget 200000000

export COIN_TYPE=0x37b20406866053c3944f1f89ea1d86120dae36a791941cc6cf22ae65232f7c54::halsey929_coin::HALSEY929_COIN

export FAUCET_TYPE=0x37b20406866053c3944f1f89ea1d86120dae36a791941cc6cf22ae65232f7c54::halsey929_faucet_coin::HALSEY929_FAUCET_COIN

export TASK2_PACKAGE_ID=0x37b20406866053c3944f1f89ea1d86120dae36a791941cc6cf22ae65232f7c54

export FAUCET_TREA_ID=0x88a1063e7d6da4154040051255d0f437474b1b1a57f3350622b4e6c7da23db93 

export COIN_TREA_ID=0x5f0567bbcf4ca5d22f5eedeeea18ddedd0e1e41ed48b449e8667ce198f0090e7

export TASK5_PACKAGE_ID=0xdf170e2c35274c633b3a22f5d489dae5137a0be7c2be0004c956ba08a17eab3a 

export MY_ADDRESS=0x2d92259fd0c9c8934a5a9bd6d975d8d63efbf110ac9d01a001098aa55525bfa9

sui client call --gas-budget 7500000 --package $TASK2_PACKAGE_ID --module halsey929_coin --function mint --args $COIN_TREA_ID 1000 $MY_ADDRESS

export COIN_ID_1=0xd71fc2af771f0aea9d5df79945b9fcb6a2c41f86b9fe8795f0e5974cffd6b1c0    

sui client call --gas-budget 7500000 --package $TASK2_PACKAGE_ID --module halsey929_faucet_coin --function mint --args $FAUCET_TREA_ID 1000 $MY_ADDRESS

export FAUCET_ID_1=0x315d90497dd8f4088bcb76f3eec823b80b9c37a394bcc51452d3aff21d29008a

sui client call --gas-budget 7500000 --package $TASK5_PACKAGE_ID --module halsey929_swap --function create_pool --type-args $COIN_TYPE $FAUCET_TYPE --args $COIN_ID_1 $FAUCET_ID_1

export POOL_ID=0x1dc2bdae2586fdf164698ce32e57f35ae90e9e7850f8aedad9ea6672b2aa965e

sui client call --gas-budget 7500000 --package $TASK2_PACKAGE_ID --module halsey929_coin --function mint --args $COIN_TREA_ID 1000 $MY_ADDRESS

export COIN_ID_2=0x2c530f70ae57bc6254d2be55625b636508b4ba85042b62f1843a292a4ed44226  

sui client call --gas-budget 7500000 --package $TASK5_PACKAGE_ID --module halsey929_swap --function swap_a_to_b --type-args $COIN_TYPE $FAUCET_TYPE --args $POOL_ID $COIN_ID_2

coin2faucet:
Transaction Digest: 5nfo2mtS4mn4U8BPRsTksiSSNBi6Jc2FVYHMp4nhgX57

sui client call --gas-budget 7500000 --package $TASK2_PACKAGE_ID --module halsey929_faucet_coin --function mint --args $FAUCET_TREA_ID 1000 $MY_ADDRESS

export FAUCET_ID_2=0x68c709f1a064bf2503f438e6d71435e40a6fa2ce0ca9f4ce0f3bdf0652dc02ca

sui client call --gas-budget 7500000 --package $TASK5_PACKAGE_ID --module halsey929_swap --function swap_b_to_a --type-args $COIN_TYPE $FAUCET_TYPE --args $POOL_ID $FAUCET_ID_2

faucet2coin:
Transaction Digest: EyBFLqve6oT4ozbtysKT8tZA5p64gRvcJ9v1eHBSiLrH