

# publish contract
sui client publish 

game_package_id:  0xdb5804b3ac41f8b1e9266cf2b70fade97114e24cd24886ad43a4ccd36fdae85b
game_id:  0x80d8b5a7d2a9b3f7a6674d764d7b88a11af2aef6c6f816e8a6c8676359012014

# mint faucet coin 
sui client call --package 0x398797282df10e8b79f10cf4d2d8c1090c70be652b76e6efda5ed9cef6dd126c \
--module fantasy_facuet_coin \
--function  mint \
--args 0xab49d04dd1e5acd11838b22cb825a2432fc6e2de79c9900dc39140c87ed58861  100000000000 0x51f51183c5af25ef0ec430e0a94bbbb0ec0d25f78c9b11161e59abaf0d524159 \
--gas-budget 50000000

mint_coin_id: 0x6043be9eef23214531b9da11d038523e9255ba6310d2cc12a7df6b76b07d8242

sui client balance
╭────────────────────────────────────────────────────────────╮
│ Balance of coins owned by this address                     │
├────────────────────────────────────────────────────────────┤
│ ╭────────────────────────────────────────────────────────╮ │
│ │ coin            balance (raw)  balance                 │ │
│ ├────────────────────────────────────────────────────────┤ │
│ │ Sui             347785336      0.34 SUI                │ │
│ │ FANTASY_FACUET  100000000000   100.00 FANTASY_FACUET   │ │
│ ╰────────────────────────────────────────────────────────╯ │
╰────────────────────────────────────────────────────────────╯

# deposit the mint coin to the game pool
sui client call --package 0xdb5804b3ac41f8b1e9266cf2b70fade97114e24cd24886ad43a4ccd36fdae85b \
--module fantasy_move_basketball \
--function  public_deposit \
--args 0x80d8b5a7d2a9b3f7a6674d764d7b88a11af2aef6c6f816e8a6c8676359012014  0x6043be9eef23214531b9da11d038523e9255ba6310d2cc12a7df6b76b07d8242 \
--gas-budget 50000000

# withdram 

sui client call --package 0xdb5804b3ac41f8b1e9266cf2b70fade97114e24cd24886ad43a4ccd36fdae85b \
--module fantasy_move_basketball \
--function  public_withdraw \
--args 0xde919ab3e54d86d19e3b99e9c3d1078c152eb986821a850adc230033f528c305 0x80d8b5a7d2a9b3f7a6674d764d7b88a11af2aef6c6f816e8a6c8676359012014  10000000000 \
--gas-budget 50000000

# switch to a new address and mint coin
sui client switch --address fantasy-move-test01

# mint coin
sui client call --package 0x398797282df10e8b79f10cf4d2d8c1090c70be652b76e6efda5ed9cef6dd126c \
--module fantasy_facuet_coin \
--function  mint \
--args 0xab49d04dd1e5acd11838b22cb825a2432fc6e2de79c9900dc39140c87ed58861  1000000000 0x0c5aeba79521f673430ddbee3b25cf9615dc74f8fab219a9b78460bcb137e178 \
--gas-budget 50000000

# coin id  ticket coin
coin_id: 0xab49d04dd1e5acd11838b22cb825a2432fc6e2de79c9900dc39140c87ed58861

# play game
sui client call --package 0xdb5804b3ac41f8b1e9266cf2b70fade97114e24cd24886ad43a4ccd36fdae85b \
--module fantasy_move_basketball \
--function  play \
--args 0x80d8b5a7d2a9b3f7a6674d764d7b88a11af2aef6c6f816e8a6c8676359012014  0xab49d04dd1e5acd11838b22cb825a2432fc6e2de79c9900dc39140c87ed58861 0x2::random \
--gas-budget 50000000


## 由于main主网的random还没有审核初始化，这边我采用测试网来完成game task
game_package_id:  0x01d2c904dd7c845d966f8a1b2b17551ec652fddb9ac986c193840b5192cdef14
game_id:  0xf4791944badf77def78e2a09b2a3cc0f97307fffc2bcae01f4d5132b728e4eaa

# mint faucet coin
sui client call --package 0x692354620bf2913fe5d521f58623a09380aba40973644d1225ae3392891a8bb9 \
--module fantasy_facuet_coin \
--function  mint \
--args 0xf4d4abfc998e4765041288de97473f5cb9eb8286bc7616ec2e98a459a9872e0d  100000000000 0x0c5aeba79521f673430ddbee3b25cf9615dc74f8fab219a9b78460bcb137e178 \
--gas-budget 50000000

pool_coin_id:  0xaf461e15bc95e2bceaca18e238958adceda8672a9bf52c714b9f54f702784048

# deposit the mint coin to the game pool
sui client call --package 0x01d2c904dd7c845d966f8a1b2b17551ec652fddb9ac986c193840b5192cdef14 \
--module fantasy_move_basketball \
--function  public_deposit \
--args 0xf4791944badf77def78e2a09b2a3cc0f97307fffc2bcae01f4d5132b728e4eaa  0xaf461e15bc95e2bceaca18e238958adceda8672a9bf52c714b9f54f702784048 \
--gas-budget 50000000

# coin id  ticket coin
sui client call --package 0x692354620bf2913fe5d521f58623a09380aba40973644d1225ae3392891a8bb9 \
--module fantasy_facuet_coin \
--function  mint \
--args 0xf4d4abfc998e4765041288de97473f5cb9eb8286bc7616ec2e98a459a9872e0d  1000000000 0x51f51183c5af25ef0ec430e0a94bbbb0ec0d25f78c9b11161e59abaf0d524159 \
--gas-budget 50000000
# coin id: 
0xe814136fe8d78a8071ce616e2ac637914703d46ea8a61af7891e24d191f6406b

# play game
sui client call --package 0x01d2c904dd7c845d966f8a1b2b17551ec652fddb9ac986c193840b5192cdef14 \
--module fantasy_move_basketball \
--function  play \
--args 0xf4791944badf77def78e2a09b2a3cc0f97307fffc2bcae01f4d5132b728e4eaa  0xe814136fe8d78a8071ce616e2ac637914703d46ea8a61af7891e24d191f6406b 0x8 \
--gas-budget 50000000

sui client call --package 0x01d2c904dd7c845d966f8a1b2b17551ec652fddb9ac986c193840b5192cdef14 \
--module fantasy_move_basketball \
--function  play \
--args 0xf4791944badf77def78e2a09b2a3cc0f97307fffc2bcae01f4d5132b728e4eaa  0x456f2546467c73b0949ba53836f9676dcec03b2dff1a696594011eb1a63ac880 0x8 \
--gas-budget 50000000

sui client call --package 0x01d2c904dd7c845d966f8a1b2b17551ec652fddb9ac986c193840b5192cdef14 \
--module fantasy_move_basketball \
--function  play \
--args 0xf4791944badf77def78e2a09b2a3cc0f97307fffc2bcae01f4d5132b728e4eaa  0x5f7988a23308da95634d5a8eb49c59163f403b3997caba4c443cece66b71dad6 0x8 \
--gas-budget 50000000