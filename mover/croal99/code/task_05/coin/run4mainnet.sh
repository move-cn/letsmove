CLIENT_ADDRESS="0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b"
PACKAGE_ID="0xa9beea5098039e2ce4a227f343b0d6d516a1e8ccf4fb4a2d14618ea9645cdcc5"
MY_COIN="0x7e6ad23279aceb35f5d3639d636d3ed2b496a608a4c7077d344f0bf2a38ed1e0"
FAUCET_COIN="0xc066b877bb245a77565bb82e86d53faceb5ef3ca8b60d5f62334e0e891374e68"

sui client switch --env mainnet
sui client envs

sui client switch --address ${CLIENT_ADDRESS}
sui client addresses

# mint 2000000 MY_COIN for swap pool
sui client call \
--package ${PACKAGE_ID} \
--module my_coin \
--function mint \
--args ${MY_COIN} 2000000 ${CLIENT_ADDRESS}

# mint 2000000 FAUCET_COIN for swap pool
sui client call \
--package ${PACKAGE_ID} \
--module faucet_coin \
--function mint \
--args ${FAUCET_COIN} 2000000 ${CLIENT_ADDRESS}

# mint 10 MY_COIN for swap
sui client call \
--package 0xa9beea5098039e2ce4a227f343b0d6d516a1e8ccf4fb4a2d14618ea9645cdcc5 \
--module my_coin \
--function mint \
--args ${MY_COIN} 10 ${CLIENT_ADDRESS}

# mint 10 FAUCET_COIN for swap
sui client call \
--package 0xa9beea5098039e2ce4a227f343b0d6d516a1e8ccf4fb4a2d14618ea9645cdcc5 \
--module faucet_coin \
--function mint \
--args ${FAUCET_COIN} 10 ${CLIENT_ADDRESS}
