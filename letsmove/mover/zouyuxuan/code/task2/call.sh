export PACKAGE_ID=0x07ecf577ddc505e10c567d4c9113cfc0a9e4da8d314225a69732d2a19624b646
export MY_COIN=0xd9906b63af0634c6ecc51059df7d2be5c681decb03bd6c8395c54d802906b191
export FAUCET_COIN=0x62843846a3db489dec77710826596c791ef0850f54885b20aaf1e59c59650e45
export ADDRESS=0xd4c2b315c859535fd1596f145ef5a4c6659469d3d4334def47b3aadba3f02b52

sui client call --function mint --module my_coin --package $PACKAGE_ID --args $MY_COIN 100000000000 $ADDRESS --gas-budget 20000000
sui client call --function mint --module zyx_faucet_coin --package $PACKAGE_ID --args $FAUCET_COIN 100000000000 $ADDRESS --gas-budget 20000000

sui client call  \
 --package  0x2 \
 --module coin \
 --function mint_and_transfer \
 --type-args '0x9228294c31b82eec07043b4149a3ccc452acac04421de26f7dde2d9b2290bc47::zyx_faucet_coin::ZYX_FAUCET_COIN' \
 --args 0x3d788fa2f2bb2273e18f7e4cbc8ffef3eec972a6caf1773eb6a1b1000ae413b8 100000000000 0xb9f26f352f0ad3eda2ec2b728e4e8d11789fd34989d5fbaf448969dd384379a4


sui client call  \
 --package  0x2 \
 --module coin \
 --function mint_and_transfer \
 --type-args '0x07ecf577ddc505e10c567d4c9113cfc0a9e4da8d314225a69732d2a19624b646::zyx_faucet_coin::ZYX_FAUCET_COIN' \
 --args 0x62843846a3db489dec77710826596c791ef0850f54885b20aaf1e59c59650e45 100000000000 0xdfc6639fb044f3c65075dcb415c603b541104b47c9c2ef626a2dd616af532800

