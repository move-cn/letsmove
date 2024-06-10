# build
sui move build

# 
sui client switch --env mainnet

address:
0x553c6fe083866c81b0499632ed4e68c0d4d4dd2df0a278a1630f480128e51609

# push
sui client publish --gas-budget 100000000

package id:
0xdb72c319d00dbffb1df12aef51e7ffca3a3254d986fc53e4ef410f0f452bb48f

EVERETTFU_COIN object id:
0x74b03c2fe20d01fa39ea6007c5edd991db966dcd29d9eb9c24352f09ea912f65

EVERETTFU_FACUET_COIN object id:
0x263003dfcf8e2362931f6aa12e314d69d035e264c53b5ea0e586a21a13a9d716

EVERETTFU_COIN address: 
0x7bc5bad56412efc6a88dfd16067f7a26cd6ac66f136e8c892ecc75c1f21686ea

EVERETTFU_FACUET_COIN address: 
0x78823689ce59d6d01ae2f8f210e96efe14c10cee8324f7dda25b9237849c97e6

# mint everettfu_coin

sui client call --gas-budget 100000000 \
--package  0x2 \
--module coin \
--function mint_and_transfer \
--type-args '0xdb72c319d00dbffb1df12aef51e7ffca3a3254d986fc53e4ef410f0f452bb48f::everettfu_coin::EVERETTFU_COIN' \
--args 0x74b03c2fe20d01fa39ea6007c5edd991db966dcd29d9eb9c24352f09ea912f65 100000000000 0x553c6fe083866c81b0499632ed4e68c0d4d4dd2df0a278a1630f480128e51609


# mint everettfu_facuet_coin

# a mint
sui client call --gas-budget 100000000 \
--package  0x2 \
--module coin \
--function mint_and_transfer \
--type-args '0xdb72c319d00dbffb1df12aef51e7ffca3a3254d986fc53e4ef410f0f452bb48f::everettfu_facuet_coin::EVERETTFU_FACUET_COIN' \
--args 0x263003dfcf8e2362931f6aa12e314d69d035e264c53b5ea0e586a21a13a9d716 100000000000 0x553c6fe083866c81b0499632ed4e68c0d4d4dd2df0a278a1630f480128e51609

# b mint
sui client call --gas-budget 100000000 \
--package  0x2 \
--module coin \
--function mint_and_transfer \
--type-args '0xdb72c319d00dbffb1df12aef51e7ffca3a3254d986fc53e4ef410f0f452bb48f::everettfu_facuet_coin::EVERETTFU_FACUET_COIN' \
--args 0x263003dfcf8e2362931f6aa12e314d69d035e264c53b5ea0e586a21a13a9d716 100000000000 0x389a6c394184fc850e8db622128b05e951ffe029d0426c29c05e43e4d5198114

# pay 
sui client pay --recipients "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2"  --input-coins "0x7bc5bad56412efc6a88dfd16067f7a26cd6ac66f136e8c892ecc75c1f21686ea" --amounts 6666

# transfer