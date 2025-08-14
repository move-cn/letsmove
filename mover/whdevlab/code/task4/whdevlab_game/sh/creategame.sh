
export PackageID=0x85bbd3bd27919882a465edd4ec624f82181dfb9e717c51d98e4d2915a1b5994b
export FaucetId="0x58dcb637ae31e54b67fcea86f53a626bde4ef8e7442815f8559842fba09a45fe::whdevlab_faucet_coin::WHDEVLAB_FAUCET_COIN"


sui client call --gas-budget 7500000 --package $PackageID --module whdevlab_game --function creat_game --type-args $FaucetId