
export COIN_TYPE="0x197759b798efa236547bd26370792d2a3f3dd0863d7303830bfa993b22a2877d::whdevlab_coin::WHDEVLAB_COIN"
export FAUCET_TYPE="0x58dcb637ae31e54b67fcea86f53a626bde4ef8e7442815f8559842fba09a45fe::whdevlab_faucet_coin::WHDEVLAB_FAUCET_COIN"

export PACKAGE_ID=0x28a208bc3bc2de8c1055900b15866a3190e5ee49e90bcc7635cafb131edfdbe1
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module whdevlab_swap --function create --type-args $COIN_TYPE $FAUCET_TYPE