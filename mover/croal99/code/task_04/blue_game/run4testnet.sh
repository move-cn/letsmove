sui client switch --env testnet
sui client envs

sui client switch --address 0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b
sui client addresses

# step1: 转入游戏资金池
sui client call \
--package 0x1d7fdf7312004e3e2480a7c2e02a2b24cec7c489ecac07341b6c969ddcb1d041 \
--module blue_game \
--function init_pool \
--args 0x062d05bb5c620bef4d6dd38d75cd2ffc45240690e66ee722d4b6f8d1ae2d6346

# step2: 玩游戏
sui client call \
--package 0x1d7fdf7312004e3e2480a7c2e02a2b24cec7c489ecac07341b6c969ddcb1d041 \
--module blue_game \
--function play \
--args 2 0x6 0xed7f63c367ccfbf195cd64fae894d5d060d54bc0d09af4d99cadac50c0765e8c
