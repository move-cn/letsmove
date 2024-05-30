sui client switch --env testnet
sui client envs

sui client switch --address 0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b
sui client addresses

sui client call \
--package 0x06f08f31cb1e000334e03cd0214380d5ab9df2d1c206de675b392f587ce95069 \
--module faucet_coin \
--function mint \
--args 0xa5d7afc0a2ce714382cc42ccd4ab7720b8af7970b479888478b4ac3d57033add 10000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client switch --address 0x7295d0fbf1edee2d8b617a5b0d306a1e8aca84e0e94d15c912a052cf7569ff9d
sui client addresses

sui client call \
--package 0x06f08f31cb1e000334e03cd0214380d5ab9df2d1c206de675b392f587ce95069 \
--module faucet_coin \
--function mint \
--args 0xa5d7afc0a2ce714382cc42ccd4ab7720b8af7970b479888478b4ac3d57033add 10000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client switch --address 0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b
sui client addresses
