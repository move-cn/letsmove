## 4

老虎机游戏有几个轮盘，每个轮盘停止时会显示一个符号或数字。当特定的组合出现时，玩家赢得奖金。这里定义 SymbolRange 为5，表示每个轮盘有5个可能的结果（0到4），并且预先设定了一个简单的获胜组合（2,2,2）

玩法：玩家每次玩时，系统会生成三个独立的轮盘结果。如果这三个结果与获胜组合相匹配，玩家就赢得奖池中的所有金币。虽然知道预定的获胜结果是（2,2,2），但是自己提供的数字是系统生成的。

赌注和奖金：每次未赢的玩家都会向奖池中支付一个硬币，而赢家则赢取整个奖池，可以在sui wallet 的unrecognized coin 里面找到

`testnet`

sui client publish --gas-budget 20000000

export PACKAGE_ID=0x2cc37e06f96afc5ddf36a10bd4a2fd0295bfe6ef33eb316cc55de4e1b20047a9

使用task2中创建好的REITYPE0_FAUCET_COIN创造流通池，相当于初始化游戏，只用做一次即可

export FAUCET_TYPE=0xe9cdb5b80e106d019280abbe2279b0c1016bbe7f50c9efb6d67341268e8ec4b1::reitype0_faucet_coin::REITYPE0_FAUCET_COIN

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module slot_machine_game --function create_pool --type-args $FAUCET_TYPE

export POOL_ID=0x71b4e0056096c5da7011f87c306774f4e79a3f77b10c52ec3367b95327cff849

export COIN_ID=0x9c20de70705a79609a6c4670e1a167b554a7361e999cbdc772121176ae2f9ac1

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module slot_machine_game  --function play  --type-args $FAUCET_TYPE --args 0x6 $POOL_ID $COIN_ID

check at [JARcCssHbdfDKB618SSk3kGKVGoGpxdvhqaxKyG8v4mt](https://testnet.suivision.xyz/txblock/JARcCssHbdfDKB618SSk3kGKVGoGpxdvhqaxKyG8v4mt)

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                    │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                        │
│  │ EventID: JARcCssHbdfDKB618SSk3kGKVGoGpxdvhqaxKyG8v4mt:0                                                                  │
│  │ PackageID: 0x2cc37e06f96afc5ddf36a10bd4a2fd0295bfe6ef33eb316cc55de4e1b20047a9                                            │
│  │ Transaction Module: slot_machine_game                                                                                    │
│  │ Sender: 0x408c61cb7202b236832bfb88ac559574062dedff254d4a567fe405b3564598c2                                               │
│  │ EventType: 0x2cc37e06f96afc5ddf36a10bd4a2fd0295bfe6ef33eb316cc55de4e1b20047a9::slot_machine_game::SlotMachineResultEvent │
│  │ ParsedJSON:                                                                                                              │
│  │   ┌─────────────────────┬─────────────────────────────────────┐                                                          │
│  │   │ is_win              │ false                               │                                                          │
│  │   ├─────────────────────┼───────┬─────────────────────────────┤                                                          │
│  │   │ player_spins        │ spin1 │ 2                           │                                                          │
│  │   │                     ├───────┼─────────────────────────────┤                                                          │
│  │   │                     │ spin2 │ 3                           │                                                          │
│  │   │                     ├───────┼─────────────────────────────┤                                                          │
│  │   │                     │ spin3 │ 4                           │                                                          │
│  │   ├─────────────────────┼───────┴─────────────────────────────┤                                                          │
│  │   │ result              │ Try again, better luck next time!💔 │                                                          │
│  │   ├─────────────────────┼───────┬─────────────────────────────┤                                                          │
│  │   │ winning_combination │ spin1 │ 2                           │                                                          │
│  │   │                     ├───────┼─────────────────────────────┤                                                          │
│  │   │                     │ spin2 │ 2                           │                                                          │
│  │   │                     ├───────┼─────────────────────────────┤                                                          │
│  │   │                     │ spin3 │ 2                           │                                                          │
│  │   └─────────────────────┴───────┴─────────────────────────────┘                                                          │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

`mainnet`

修改了module的名字加上GithubID reitype0

sui client switch --env mainnet

sui client publish --gas-budget 20000000

export PACKAGE_ID=0xef0b128db4bb4393c8e2725cdf8f6ef3ff0669247ea7f51cdf4e7bf8019dea56

使用task2中创建好的REITYPE0_FAUCET_COIN创造流通池

export FAUCET_TYPE=0xf834ecdcd1be5361d6aebbf79c58ce43eb1cae67939cc1d0713562f28225cc3a::reitype0_coin::REITYPE0_COIN

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module reitype0_slot_machine_game --function create_pool --type-args $FAUCET_TYPE

export POOL_ID=0x784e0a832455550a01b8c2b83a58f9cbe9038828664e65ec8ff2c214fb47efa1

export COIN_ID=0xd3dd0a75d40f55081c8c1b37b788e49c793faebd234a6b8f6919230b3590eb9d

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module reitype0_slot_machine_game  --function play  --type-args $FAUCET_TYPE --args 0x6 $POOL_ID $COIN_ID

check at [GW8mXZEVHwDqggRUMecfGbrFUgFV8XCj6YiqD7W7wkFr](https://suivision.xyz/txblock/GW8mXZEVHwDqggRUMecfGbrFUgFV8XCj6YiqD7W7wkFr)

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                                 │
│  │ EventID: GW8mXZEVHwDqggRUMecfGbrFUgFV8XCj6YiqD7W7wkFr:0                                                                           │
│  │ PackageID: 0xef0b128db4bb4393c8e2725cdf8f6ef3ff0669247ea7f51cdf4e7bf8019dea56                                                     │
│  │ Transaction Module: reitype0_slot_machine_game                                                                                    │
│  │ Sender: 0x408c61cb7202b236832bfb88ac559574062dedff254d4a567fe405b3564598c2                                                        │
│  │ EventType: 0xef0b128db4bb4393c8e2725cdf8f6ef3ff0669247ea7f51cdf4e7bf8019dea56::reitype0_slot_machine_game::SlotMachineResultEvent │
│  │ ParsedJSON:                                                                                                                       │
│  │   ┌─────────────────────┬─────────────────────────────────────┐                                                                   │
│  │   │ is_win              │ false                               │                                                                   │
│  │   ├─────────────────────┼───────┬─────────────────────────────┤                                                                   │
│  │   │ player_spins        │ spin1 │ 2                           │                                                                   │
│  │   │                     ├───────┼─────────────────────────────┤                                                                   │
│  │   │                     │ spin2 │ 0                           │                                                                   │
│  │   │                     ├───────┼─────────────────────────────┤                                                                   │
│  │   │                     │ spin3 │ 2                           │                                                                   │
│  │   ├─────────────────────┼───────┴─────────────────────────────┤                                                                   │
│  │   │ result              │ Try again, better luck next time!💔 │                                                                   │
│  │   ├─────────────────────┼───────┬─────────────────────────────┤                                                                   │
│  │   │ winning_combination │ spin1 │ 2                           │                                                                   │
│  │   │                     ├───────┼─────────────────────────────┤                                                                   │
│  │   │                     │ spin2 │ 2                           │                                                                   │
│  │   │                     ├───────┼─────────────────────────────┤                                                                   │
│  │   │                     │ spin3 │ 2                           │                                                                   │
│  │   └─────────────────────┴───────┴─────────────────────────────┘                                                                   │
│  └──                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯