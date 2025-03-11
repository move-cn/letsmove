sui client call --package 0xb5113903f1909ec3512f5fcc549e2c4f5a5439bc078202e7c562861bb11b7384 \
--module chee_game_dice \
--function create_game \
--type-args 0x977f212c2a076f62ec3bc6ab2f18d087661ff4081140e75c9242fb98248b7a44::mycoin::MYCOIN 


sui client call --package 0xb5113903f1909ec3512f5fcc549e2c4f5a5439bc078202e7c562861bb11b7384 \
--module chee_game_dice \
--function add_coin \
--type-args 0x977f212c2a076f62ec3bc6ab2f18d087661ff4081140e75c9242fb98248b7a44::mycoin::MYCOIN \
--args 0x9fd4879eb647a6f3219386bbcc5bfa02a321f5857536ae0d30834b2737fac492 0x4a1874d34d3d19c2e3f02921846fa7122e4a53a82814b456e5e2804e997477bf   100000000

sui client call --package 0xb5113903f1909ec3512f5fcc549e2c4f5a5439bc078202e7c562861bb11b7384 \
--module chee_game_dice \
--function play \
--type-args 0x977f212c2a076f62ec3bc6ab2f18d087661ff4081140e75c9242fb98248b7a44::mycoin::MYCOIN \
--args 0x9fd4879eb647a6f3219386bbcc5bfa02a321f5857536ae0d30834b2737fac492 0x8 true 0xee4b03555b1393f2ad73f4a5a66fb969c634b65389298f9fc13da39f63a5bb81 2000000



sui client call --package 0x306f6a24bda13a9434286a14e964a6f7e40bc62aabfe57f36a07877795508000 \
--module chee_game_dice \
--function remove_coin \
--type-args 0x977f212c2a076f62ec3bc6ab2f18d087661ff4081140e75c9242fb98248b7a44::mycoin::MYCOIN \
--args 0x8beac8c228a5d2ef0a2f06dad36c681d575903fd73f8076ce89bd209024adb97 100000000


// 第一次发布 0xdff6b0edb7d8026ae26d7bf50cf6b9904adf55625dfa38ac4062ea073f4a896b
// 第二次发布 0x306f6a24bda13a9434286a14e964a6f7e40bc62aabfe57f36a07877795508000
// 第三次发布 0xb5113903f1909ec3512f5fcc549e2c4f5a5439bc078202e7c562861bb11b7384


// 第三次发布 mainnet tx： BDYPqDcT4m9QZ7PE4rvmZoYwYGh4ZxkfrbPGyPNbt1iF



//第二次ganme object id 0x8beac8c228a5d2ef0a2f06dad36c681d575903fd73f8076ce89bd209024adb97
//第三次ganme object id 0x9fd4879eb647a6f3219386bbcc5bfa02a321f5857536ae0d30834b2737fac492