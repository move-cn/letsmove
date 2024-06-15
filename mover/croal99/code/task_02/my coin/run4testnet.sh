sui client switch --env testnet
sui client envs

sui client switch --address 0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b
sui client addresses

sui client call --gas-budget 100000000 \
--package 0x3bb84b8e7a1876d8cc102cec9e3bea7e49d13f3998ae5d3e982b83e007971fec \
--module rmb_coin \
--function mint \
--args 0xbce77faf6074f2e0f92a1353619be1c3d58b94b854de997ecf909ebfd7d1613d 10000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

