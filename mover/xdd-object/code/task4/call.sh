sui client call --package 包名 --module 模块名 --function 方法名 --type-args 币种 --args 权限id(TreasuryCap对应的id) 金额 地址


# 添加奖池金额  参数解释：第一个game共享对象id， 第二个资产id
sui client call --package 0x4e0b41c7e253f7ed700a6f7b2aab108c6e4166743943a8baed439e484833789f --module task4 --function add_sui --args 0x97419f15d3153a252eac3b14761090203d1cf55e0a621c38b8a6eb8e5af26317 0xca7259653a9b56ab0b2db111815387bdefcf8c5e70ce91734b69262f68027ad5

# 从奖池取出金额 参数解释：第一个权限id， 第二个game共享对象id， 第三个取出金额

sui client call --package 0x4e0b41c7e253f7ed700a6f7b2aab108c6e4166743943a8baed439e484833789f --module task4 --function remove_sui --args 0xc4b03e52c54283121c3cf7754105f16030dab872c845242ff219b8f73b435050 0x97419f15d3153a252eac3b14761090203d1cf55e0a621c38b8a6eb8e5af26317 1000000000

# 玩游戏 参数解释：第一个game共享对象id， 第二个：随机数id 0x8， 第三个：自己选择的值， 第四个：金额id

sui client call --package 0x51883c68119fd598933c0860172355a861e10cee82370ae2c855a424ecece287 --module task4 --function play --args 0x97419f15d3153a252eac3b14761090203d1cf55e0a621c38b8a6eb8e5af26317 0x8 true 0xa00c32cc4f21c54097086ba21e372edfdae2841440e5e686c985559f6a25c49c


# 将金额拆分


# 升级包 参数：权限id UpgradeCap
sui client upgrade --upgrade-capability 0x8e7cfb863d44c342d6d6aefb391c80f5da1de32c6ec8d2a0778dbd2be0320aa4





#正式环境
sui client call --package 0xa42426f6efe44d433240afab9373d311ca8aa5159a41f1fe490e8b77881c2231 --module game --function add_game_pool --args 0x174f9a7fc481ad7b5509c04f91e095638067a55843a24493816f3b6b347d426b 0x4dd838600add91e985856d6cad331531b698d2ab4dcda01c79a15b7541f59bdf

sui client call --package 0xa42426f6efe44d433240afab9373d311ca8aa5159a41f1fe490e8b77881c2231 --module game --function play --args 0x174f9a7fc481ad7b5509c04f91e095638067a55843a24493816f3b6b347d426b true 0x059c5529c8779030e9c4679063d1e567a152e3bbe814ced5d0cb2530867776db 0x8

sui client call --package 0xa42426f6efe44d433240afab9373d311ca8aa5159a41f1fe490e8b77881c2231 --module game --function get_game_pool --args 0xf81131820ba24bb3184b34ef58152407ee1078c54b5b56394867ce6eeff895b8 0x174f9a7fc481ad7b5509c04f91e095638067a55843a24493816f3b6b347d426b 10000000000