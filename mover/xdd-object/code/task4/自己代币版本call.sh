sui client call --package 包名 --module 模块名 --function 方法名 --args 权限id(TreasuryCap对应的id) 金额 地址

#添加奖池 参数1：奖池  参数二：代币id
sui client call --package 0x5da0720885ac25b58704ac11c1664bedb5917026b38850ef24c5a2684860a765 --module game --function add_game_pool --args 0x6f39c0b0e4c0bb21bc32ac94947db9d06fdf908827c46e4e81f50063faf034b9 0x9259b931868bbb433e98cacd2ec40b199c0abfcc14201f9dc582ceaee7a2bccf

#玩游戏  可能需要设置gas费 --gas-budget 10000000
sui client call --package 0x5da0720885ac25b58704ac11c1664bedb5917026b38850ef24c5a2684860a765 --module game --function play --args 0x6f39c0b0e4c0bb21bc32ac94947db9d06fdf908827c46e4e81f50063faf034b9 true 0xf45c462a4009894e8ad6e0e8ec59cf366f1ff5bb714a838241b6f9391303ebe9 0x8




