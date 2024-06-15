CLIENT_ADDRESS="0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b"
PACKAGE_ID="0x445cee99e9abbdb62bf1f6067834e834f36ea6c1723b2bc2977244d0a3c62e36"
MY_COIN="0x14b315a214e11bbd49f3d56a33d14a8f4a91373161c644632179a2637480f2ec"
FAUCET_COIN="0x9ccda250e3685232798e54e0950fa8194f06c8517e3b999305692c373904452e"

sui client switch --env testnet
sui client envs

sui client switch --address ${CLIENT_ADDRESS}
sui client addresses

# mint 2000000 MY_COIN
sui client call \
--package ${PACKAGE_ID} \
--module my_coin \
--function mint \
--args ${MY_COIN} 2000000 ${CLIENT_ADDRESS}

# mint 2000000 FAUCET_COIN
sui client call \
--package ${PACKAGE_ID} \
--module faucet_coin \
--function mint \
--args ${FAUCET_COIN} 2000000 ${CLIENT_ADDRESS}

# burn FAUCET_COIN
#sui client call \
#--package 0x445cee99e9abbdb62bf1f6067834e834f36ea6c1723b2bc2977244d0a3c62e36 \
#--module my_coin \
#--function burn \
#--args 0x14b315a214e11bbd49f3d56a33d14a8f4a91373161c644632179a2637480f2ec 0xed1337b48852e0afb84e437b535c3297e00125883bac6cbe9ccbdb5978b57b74

