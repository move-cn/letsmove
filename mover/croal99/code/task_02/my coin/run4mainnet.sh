sui client switch --env mainnet
sui client envs

sui client switch --address 0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b
sui client addresses

sui client call \
--package 0xacedf7dd91fada351eb9128ea0fe6410df141657b335555370c7491365715321 \
--module rmb_coin \
--function mint \
--args 0xb9e23639b708f03e0a928c362436406dca9cf4ccc28af29f4388bc3894bcb3cd 10000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

