sui client switch --env mainnet
sui client envs

sui client switch --address 0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b
sui client addresses

# step1: 转入游戏资金池
sui client call \
--package 0x898f87e55e4cb51758f6bec2df4c59f5ae2b12b345c764799e62809ea12351fc \
--module blue_game \
--function init_pool \
--args 0x6def8c501e443a8d0ad9cf4bdeb7fdf88d1652750a7f31e96f44a55eb1635a7e

# step2: 玩游戏
sui client call \
--package 0x898f87e55e4cb51758f6bec2df4c59f5ae2b12b345c764799e62809ea12351fc \
--module blue_game \
--function play \
--args 1 0x6 0xdc78fb5114def8e7d0d01f1af4ced2061e3c5b68aa17d70492ab0d6fcfcaec09
