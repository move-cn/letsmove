CLIENT_ADDRESS="0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b"
PACKAGE_ID="0x0c828cead5f0c1a7d88d1304fb91b77e5c72fe738643cfa585b0b069c7e6ad68"
MY_COIN="0xa9beea5098039e2ce4a227f343b0d6d516a1e8ccf4fb4a2d14618ea9645cdcc5::my_coin::MY_COIN"
FAUCET_COIN="0xa9beea5098039e2ce4a227f343b0d6d516a1e8ccf4fb4a2d14618ea9645cdcc5::faucet_coin::FAUCET_COIN"
POOL_ID="0x5c7d99c1ef1a16e45affb231e30794638ad3b6966b401bee5e3d42088ce9dbb9"

sui client switch --env mainnet
sui client envs

sui client switch --address ${CLIENT_ADDRESS}
sui client addresses

#sui client call \
#--package ${PACKAGE_ID} \
#--module swap \
#--function new_pool \
#--type-args ${MY_COIN} ${FAUCET_COIN}

#sui client call \
#--package ${PACKAGE_ID} \
#--module swap \
#--function add_liquidity \
#--type-args ${MY_COIN} ${FAUCET_COIN} \
#--args ${POOL_ID} 0x4918af62da6f4ec21fa571f602fc8ae160f1cb97f51e114d3cc9f349089502ab 0xa67f3f485dfd2046a27358789fd8626eb250853a8e9d3f1a191847348d0561c5

#sui client call \
#--package ${PACKAGE_ID} \
#--module swap \
#--function sellA \
#--type-args ${MY_COIN} ${FAUCET_COIN} \
#--args ${POOL_ID} 0xd0a4576a608e8b0d0b948515fcfd2945a99f672648ad0997b5a2a1e8220fb8ae

sui client call \
--package ${PACKAGE_ID} \
--module swap \
--function sellB \
--type-args ${MY_COIN} ${FAUCET_COIN} \
--args ${POOL_ID} 0xcd42e749d0410c803fbf335a9d6eab5e36a300f7c1ade3d1101f96ea036de955
