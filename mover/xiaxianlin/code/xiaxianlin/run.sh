# BANK: 0xecd6d007fdc9ac6e71be6b9b0f970a3618226b451f8257e466d73a116a0b3036
# BANK_CAP: 0xa2c505b8601ea11793d0a0492323d3a320246b6d44215458730b9055f4a51767
# A: 0x48f21c934406ce940fe743347c58b7f6392b08a03e2c22ebd3ec5d3fdfba65cc
# B: 0x490dd9267cfba2d4a34c623e57c3cfdaa64b0d6c7d0e50670c090a27cb7e3f7c
# A - FACUCET_COIN: 0xd5cbca2c46455d8411ca2e9234facd8bcade47f1d59205e0db9ffe8ce4dc91f7 - 98
# B - FACUCET_COIN: 0x9a084a45166b1ef962f22edddb0c291af0a4958b7e8cc6fe7644e615d1d618ac - 50
# A - MY_COIN: 0x7b9f9dc8bb0324e832f6bc47f2a89e7184e63268c9fbeac57e2339b8ad1f8237 - 100
# B - MY_COIN: 0xdab9c9d23d079a8f9663b118b159d525e3ec52012f26fbc4b88307a071dff65b - 100

# MY_COIN -> FACUCET_COIN
sui client switch --address 0x48f21c934406ce940fe743347c58b7f6392b08a03e2c22ebd3ec5d3fdfba65cc
# A 分出 50 FACUCET_COIN - 0x564a38f085bee102d571f5ba1e5d646a45805c88c4b3e1d72f9911869f144788
sui client split-coin --coin-id 0xd5cbca2c46455d8411ca2e9234facd8bcade47f1d59205e0db9ffe8ce4dc91f7 --amounts 50000000000
# A 存入银行
sui client call --package 0x5241250d8a98503254c6d5faaccd787013c656728048c450828f0df0b3357d7a \
                --module swap \
                --function deposit_faucet_coin \
                --args 0xecd6d007fdc9ac6e71be6b9b0f970a3618226b451f8257e466d73a116a0b3036 0x564a38f085bee102d571f5ba1e5d646a45805c88c4b3e1d72f9911869f144788

# 切换到 B
sui client switch --address 0x490dd9267cfba2d4a34c623e57c3cfdaa64b0d6c7d0e50670c090a27cb7e3f7c
# B 分出 3 MY_COIN - 0xbb4a327f6e562243944c7c356d9819bbb6d1267a0bce4352c12fabdd8e76ff05
sui client split-coin --coin-id 0xdab9c9d23d079a8f9663b118b159d525e3ec52012f26fbc4b88307a071dff65b --amounts 3000000000
# B 用 MY_COIN 去换 FACUCET_COIN
sui client call --package 0x5241250d8a98503254c6d5faaccd787013c656728048c450828f0df0b3357d7a \
                --module swap \
                --function my_to_faucet \
                --args 0xecd6d007fdc9ac6e71be6b9b0f970a3618226b451f8257e466d73a116a0b3036 0xbb4a327f6e562243944c7c356d9819bbb6d1267a0bce4352c12fabdd8e76ff05


# FACUCET_COIN -> MY_COIN

sui client switch --address 0x490dd9267cfba2d4a34c623e57c3cfdaa64b0d6c7d0e50670c090a27cb7e3f7c
# B 分出 30 FACUCET_COIN - 0x63c07d2d1e303a0e313700870df73c600d2f9b2328a7e410f41155b0aaaef1b7
sui client split-coin --coin-id 0x9a084a45166b1ef962f22edddb0c291af0a4958b7e8cc6fe7644e615d1d618ac --amounts 30000000000
# B 用 FACUCET_COIN 去换 MY_COIN
sui client call --package 0x5241250d8a98503254c6d5faaccd787013c656728048c450828f0df0b3357d7a \
                --module swap \
                --function faucet_to_my \
                --args 0xecd6d007fdc9ac6e71be6b9b0f970a3618226b451f8257e466d73a116a0b3036 0x63c07d2d1e303a0e313700870df73c600d2f9b2328a7e410f41155b0aaaef1b7