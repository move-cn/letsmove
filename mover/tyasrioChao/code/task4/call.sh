# 初始化奖金池，调用deposit函数，将奖金池的资金转入合约账户
# 参数1: 合约账户地址
# 参数2: task2 的
sui client call --package 0x59f6577c24b0bada7b4eb635fd3d10e1e50424527c81583dc0c9b753dc17f3af \
--module rps_game \
--function deposit \
--args 0xb5840723f3cdd109edf93baa76c0830682f1c51d64caa8dc87b1fee1e624e3a9 0xabb5dfae519c6a10585e850c4204cb8747a0b5c80808383b643d67fe62ac33bc

# 调用play函数，进行游戏
# 参数1: GAME_OBJECT_ID
# 参数2: PLAYER_ADDRESS
# 参数3: 玩家出拳 "Rock" "Paper" "Scissors"
# 参数4: FAUCET_COIN_ID 
sui client call --package 0x59f6577c24b0bada7b4eb635fd3d10e1e50424527c81583dc0c9b753dc17f3af \
--module rps_game \
--function play \
--args 0x8 0xb5840723f3cdd109edf93baa76c0830682f1c51d64caa8dc87b1fee1e624e3a9 "Rock" 0x38d738127baacc72533648286d8133bd9840ea6c7f8f61cc9aa6489e0d19df27

# 调用withdraw函数，将奖金池的资金转入玩家账户
# 参数1: ADMINCAP_ID
# 参数2: PLAYER_ADDRESS
# 参数3: AMOUNT
sui client call --package 0x59f6577c24b0bada7b4eb635fd3d10e1e50424527c81583dc0c9b753dc17f3af \
--module rps_game \
--function withdraw \
--args 0x219d3d6ee488a921641def68562568f4959d65a552959149f5d8549f14c7ce88 0xb5840723f3cdd109edf93baa76c0830682f1c51d64caa8dc87b1fee1e624e3a9 300000000