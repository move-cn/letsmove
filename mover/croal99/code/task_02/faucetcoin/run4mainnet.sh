sui client switch --env mainnet
sui client envs

sui client switch --address 0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b
sui client addresses

sui client call \
--package 0x05f461a5c2285387449600b09c5dda42d514f1a9608ea4a9555bf564789a451e \
--module faucet_coin \
--function mint \
--args 0x1034a40b9cc60e947910dea55e8c3a68421460d105bec425328a9f64859238e0 10000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client switch --address 0x7295d0fbf1edee2d8b617a5b0d306a1e8aca84e0e94d15c912a052cf7569ff9d
sui client addresses

sui client call \
--package 0x05f461a5c2285387449600b09c5dda42d514f1a9608ea4a9555bf564789a451e \
--module faucet_coin \
--function mint \
--args 0x1034a40b9cc60e947910dea55e8c3a68421460d105bec425328a9f64859238e0 10000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client switch --address 0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b
sui client addresses

