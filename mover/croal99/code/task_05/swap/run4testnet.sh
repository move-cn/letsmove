sui client switch --env testnet
sui client envs

sui client switch --address 0x167b61dcef37260fc8335e15a16cbad0a2f3ddc8a511169820f0c013396f205b
sui client addresses

#sui client call \
#--package 0xfe306f47b7f2053c4156b2a9eb3b0d0672f4db32dad7adc62e0a2a1af795e63b \
#--module swap \
#--function new_pool \
#--type-args "0x445cee99e9abbdb62bf1f6067834e834f36ea6c1723b2bc2977244d0a3c62e36::my_coin::MY_COIN" "0x445cee99e9abbdb62bf1f6067834e834f36ea6c1723b2bc2977244d0a3c62e36::faucet_coin::FAUCET_COIN"

#sui client call \
#--package 0xfe306f47b7f2053c4156b2a9eb3b0d0672f4db32dad7adc62e0a2a1af795e63b \
#--module swap \
#--function add_liquidity \
#--type-args "0x445cee99e9abbdb62bf1f6067834e834f36ea6c1723b2bc2977244d0a3c62e36::my_coin::MY_COIN" "0x445cee99e9abbdb62bf1f6067834e834f36ea6c1723b2bc2977244d0a3c62e36::faucet_coin::FAUCET_COIN" \
#--args 0x22864db931d9b192dd5170888c675abd20703cb209cbf6309789dcde322bdb1e 0xa3e1cdca7e0c2b544672ca6ca1242e85dbd8754725a5ceaf36e44ecef648e812 0x1a4c676bc3d6168f5abad37a3f353287949db04d35d67dba4d0405461f4a6e24

sui client call \
--package 0xfe306f47b7f2053c4156b2a9eb3b0d0672f4db32dad7adc62e0a2a1af795e63b \
--module swap \
--function sellA \
--type-args "0x445cee99e9abbdb62bf1f6067834e834f36ea6c1723b2bc2977244d0a3c62e36::my_coin::MY_COIN" "0x445cee99e9abbdb62bf1f6067834e834f36ea6c1723b2bc2977244d0a3c62e36::faucet_coin::FAUCET_COIN" \
--args 0x22864db931d9b192dd5170888c675abd20703cb209cbf6309789dcde322bdb1e 0x957ee02133448ed3eea212f2017693e0e7b6ff27ed546ba003df88c69a342bca
