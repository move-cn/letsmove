export BANK_ID=0x35e26cc308495d2797e18bb6cc45aac5a75a3a1e4662c60f2a9533fcade8c1f9
export COIN_TYPE="0x197759b798efa236547bd26370792d2a3f3dd0863d7303830bfa993b22a2877d::whdevlab_coin::WHDEVLAB_COIN"
export FAUCET_TYPE="0x58dcb637ae31e54b67fcea86f53a626bde4ef8e7442815f8559842fba09a45fe::whdevlab_faucet_coin::WHDEVLAB_FAUCET_COIN"

export PACKAGE_ID=0x28a208bc3bc2de8c1055900b15866a3190e5ee49e90bcc7635cafb131edfdbe1
export COINA=0x88d830f0da93614dc3ca81e6ad7b6e0549ed99aff168b6d9e5b656af65489a0f

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module whdevlab_swap --function deposit_a --type-args $COIN_TYPE $FAUCET_TYPE  --args $BANK_ID $COINA 1
