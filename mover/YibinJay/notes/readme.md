task1: sui client publish --gas-budget 20000000

task2:

sui client publish --gas-budget 20000000

error[Sui E02003]: invalid 'init' function
  ┌─ ./sources/faucet.move:8:9
  │
8 │     fun init(witness: YIBINJAY_FAUCET_COIN, ctx: &mut TxContext) {
  │         ^^^^          -------------------- Invalid parameter 'witness' of type 'task2::yibinjayfaucet_coin::YIBINJAY_FAUCET_COIN'. Expected a one-time witness type, 'task2::yibinjayfaucet_coin::YIBINJAYFAUCET_COIN
  │         │              
  │         Invalid 'init' function declaration
  │
  = One-time witness types are structs with the following requirements: their name is the upper-case version of the module's name, they have no fields (or a single boolean field), they have no type parameters, and they have only the 'drop' ability.

Failed to build Move modules: Compilation error.

change module name. solved

Failed to build Move modules: Failed to resolve dependencies for package 'task2'

Caused by:
    0: Fetching 'Sui'
    1: Failed to fetch to latest Git state for package 'Sui', to skip set --skip-fetch-latest-git-deps | Exit status: exit status: 128.

export http_proxy=http://192.168.187.1:10811;export https_proxy=http://192.168.187.1:10811;export ALL_PROXY=socks5://192.168.187.1:10809

Error executing transaction: Failure {
    error: "InsufficientGas",
}

sui client publish --gas-budget 20000000

PackageID: 0xe55f387b15347ce3200e408c1213ee2a6f5951875d8239124c7555e7bc4d029c       

faucet ObjectID: 0x4a10aaba6964df60beea7c48fa6fb3ffc7f4b999d481ab4c315b9dbd7426b84f

coin ObjectID: 0xc50d10f8bb12c572144438916967ef41bf6efb7a34acd901492d5e7b9f4c3ee4 

sui client call --package 0xe55f387b15347ce3200e408c1213ee2a6f5951875d8239124c7555e7bc4d029c   --module yibinjay_coin --function mint --args 0xc50d10f8bb12c572144438916967ef41bf6efb7a34acd901492d5e7b9f4c3ee4 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

Transaction Digest: FEW7azuuAH7TNVr4MHuvAoxwzUSNfjaUec9m6i2L34Bc


mint to public 

sui client call --package 0xe55f387b15347ce3200e408c1213ee2a6f5951875d8239124c7555e7bc4d029c   --module yibinjay_faucet_coin --function mint --args 0x4a10aaba6964df60beea7c48fa6fb3ffc7f4b999d481ab4c315b9dbd7426b84f 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 20000000

Transaction Digest: FLQBYUvoESubvsogLmiLYBQ5LrLDsYRTcBQwAcwBRb4i

mint to myself

sui client call --package 0xe55f387b15347ce3200e408c1213ee2a6f5951875d8239124c7555e7bc4d029c   --module yibinjay_faucet_coin --function mint --args 0x4a10aaba6964df60beea7c48fa6fb3ffc7f4b999d481ab4c315b9dbd7426b84f 1000000 0x8766fc99c2c3f9099d52d03126b5d04695bd9e1febcbdb9859fe56aedd00d394 --gas-budget 20000000

Transaction Digest: 7sWRBMf5T3hH4C5crXakUWKtXgRJs2LbztMi4GsCsqeE

sui client balance 

╭────────────────────────────────────────────────────────────╮
│ Balance of coins owned by this address                     │
├────────────────────────────────────────────────────────────┤
│ ╭────────────────────────────────────────────────────────╮ │
│ │ coin             balance (raw)  balance                │ │
│ ├────────────────────────────────────────────────────────┤ │
│ │ Sui              4524719896     4.52 SUI               │ │
│ │ YIBINJAY_FAUCET  1000000        0.00 YIBINJAY_FAUCET   │ │
│ ╰────────────────────────────────────────────────────────╯ │
╰────────────────────────────────────────────────────────────╯

task3:

sui client publish --gas-budget 20000000 

PackageID: 0x2561fe37c1fcdd2efd42229f3ae186fdde65449099ceab6ee7fe6f09de0b7192

sui client call --package 0x2561fe37c1fcdd2efd42229f3ae186fdde65449099ceab6ee7fe6f09de0b7192 --module yibinjaynft --function mint --args "YibinJay YEAH" "YibinJay's first NFT" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 20000000

Transaction Digest: HyqLsf1m8E59P6nwZKv5TAuqyff1iQ985tjLL2dYvR8R

ObjectId: 0x9bee58dd3c17133723a3f809a2c21868efd49e5e5821a4c12f0d8049d21bfb07

task4:
游戏思路：管理员创建游戏，拿到管理ID，可以用来设置游戏参数，玩家mint faucet coin后的deposit到游戏中，然后开始游戏，每次游戏从存储的游戏币中取出一部分作为入场券

参考[bytesloop](https://github.com/bytesloop/letsmove/blob/c1a32f82bc032a88afced156bf6c5827389cdc10/mover/bytesloop/code/task4_move_game/sources/bytesloop_game.move)大佬

sui client publish --gas-budget 50000000

```
Failed to publish the Move module(s), reason: Package dependency "task2" does not specify a published address (the Move.toml manifest for "task2" does not contain a published-at field).
If this is intentional, you may use the --with-unpublished-dependencies flag to continue publishing these dependencies as part of your package (they won't be linked against existing packages on-chain).
```

按照要求修改toml

task2 = "0xe55f387b15347ce3200e408c1213ee2a6f5951875d8239124c7555e7bc4d029c"

sui client publish --gas-budget 50000000

PackageID: 0x9e0afa8af3b477f64a847cd9789b6e36b110dc69945ff09fe7dc45ddbb670d06 

Game: ObjectID: 0x38ea06f7dc363778409aa39f40a255ce1fb75aa1a08b011f0940d0814bd38901

AdminCap: ObjectID: 0x409ae7cd849bbf52928155d09df4dbe1c690054751fb449b88f6826cd0e04cf7 

拿到代币

export PACKAGE_ID=0x9e0afa8af3b477f64a847cd9789b6e36b110dc69945ff09fe7dc45ddbb670d06
export GAME_ID=0x38ea06f7dc363778409aa39f40a255ce1fb75aa1a08b011f0940d0814bd38901
export ADMIN_CAP=0x409ae7cd849bbf52928155d09df4dbe1c690054751fb449b88f6826cd0e04cf7
export FAUCET=0x4a10aaba6964df60beea7c48fa6fb3ffc7f4b999d481ab4c315b9dbd7426b84f

sui client call --package $PACKAGE_ID --module yibinjay_game --function get_faucet_coin --args $FAUCET 10000000 --gas-budget 10000000

Faucet Coin: ObjectID: 0x6ef837b84573ad8a1da8bfbfec2e94de1b9826f6e58c6f3e498e3ac2a08ff5e2 

export FAUCET_COIN=0x6ef837b84573ad8a1da8bfbfec2e94de1b9826f6e58c6f3e498e3ac2a08ff5e2 

sui client balance

╭────────────────────────────────────────────────────────────╮
│ Balance of coins owned by this address                     │
├────────────────────────────────────────────────────────────┤
│ ╭────────────────────────────────────────────────────────╮ │
│ │ coin             balance (raw)  balance                │ │
│ ├────────────────────────────────────────────────────────┤ │
│ │ Sui              10480168520    10.48 SUI              │ │
│ │ YIBINJAY_FAUCET  11000000       0.01 YIBINJAY_FAUCET   │ │
│ ╰────────────────────────────────────────────────────────╯ │
╰────────────────────────────────────────────────────────────╯

sui client call --package $PACKAGE_ID --module yibinjay_game --function deposit --args $GAME_ID  $FAUCET_COIN 5000000 --gas-budget 20000000

Transaction Digest: 75VRQBU2rG2q1tihNQvL9pzwwMjWwdDS6Fj5PqT6JRXb

sui client call --package $PACKAGE_ID --module yibinjay_game --function get_faucet_coin --args $FAUCET 100000000 

Faucet Coin: ObjectID: 0x72ddc6684fc62e9b04b6bd36031bfcc7f8141f8fb3151c1f42cdb819c587d46f

export FAUCET_COIN_2=0x72ddc6684fc62e9b04b6bd36031bfcc7f8141f8fb3151c1f42cdb819c587d46f

sui client call --package $PACKAGE_ID --module yibinjay_game --function deposit --args $GAME_ID  $FAUCET_COIN_2 100000000 --gas-budget 20000000

deposit coin : ObjectId: 0xedc0862e337a22469c601c9430b8a0de96157959c05df1dcb50e3d65b8f16318

export GAME_COIN=0xedc0862e337a22469c601c9430b8a0de96157959c05df1dcb50e3d65b8f16318

sui client call --package $PACKAGE_ID --module yibinjay_game --function play --args 2 $GAME_ID $GAME_COIN 0x6 

```
Error executing transaction: Failure {
    error: "MoveAbort(MoveLocation { module: ModuleId { address: 9e0afa8af3b477f64a847cd9789b6e36b110dc69945ff09fe7dc45ddbb670d06, name: Identifier(\"yibinjay_game\") }, function: 6, instruction: 51, function_name: Some(\"play\") }, 2) in command 0",
}
```
存储的币不够ticket，管理员模式重新调整以下ticket和reward

sui client call --package $PACKAGE_ID --module yibinjay_game --function set_ticket --args $ADMIN_CAP $GAME_ID 100 --gas-budget 10000000

sui client call --package $PACKAGE_ID --module yibinjay_game --function set_reward --args $ADMIN_CAP $GAME_ID 200 --gas-budget 10000000

sui client call --package $PACKAGE_ID --module yibinjay_game --function play --args 2 $GAME_ID $GAME_COIN 0x6 --gas-budget 10000000

Transaction Digest: CiToCsPnbfP2mkWrwERmUr8x1f7LeJr24yy2561jZFrD

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                    │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                        │
│  │ EventID: CiToCsPnbfP2mkWrwERmUr8x1f7LeJr24yy2561jZFrD:0                                                  │
│  │ PackageID: 0x9e0afa8af3b477f64a847cd9789b6e36b110dc69945ff09fe7dc45ddbb670d06                            │
│  │ Transaction Module: yibinjay_game                                                                        │
│  │ Sender: 0x8766fc99c2c3f9099d52d03126b5d04695bd9e1febcbdb9859fe56aedd00d394                               │
│  │ EventType: 0x9e0afa8af3b477f64a847cd9789b6e36b110dc69945ff09fe7dc45ddbb670d06::yibinjay_game::GameResult │
│  │ ParsedJSON:                                                                                              │
│  │   ┌─────────────┬───────┐                                                                                │
│  │   │ is_winner   │ false │                                                                                │
│  │   ├─────────────┼───────┤                                                                                │
│  │   │ npc_choice  │ Paper │                                                                                │
│  │   ├─────────────┼───────┤                                                                                │
│  │   │ result      │ Draw  │                                                                                │
│  │   ├─────────────┼───────┤                                                                                │
│  │   │ your_choice │ Paper │                                                                                │
│  │   └─────────────┴───────┘                                                                                │
│  └──                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

sui client call --package $PACKAGE_ID --module yibinjay_game --function withdraw --args $ADMIN_CAP $GAME_ID 2000 --gas-budget 10000000

Transaction Digest: 5tDLMSNkGkGB5B1B4T8XGzBYgDFk8w5UUCwRMr7hZgHb


task5:

task2中的两种coin

faucet: 0x2::coin::TreasuryCap<0xe55f387b15347ce3200e408c1213ee2a6f5951875d8239124c7555e7bc4d029c::yibinjay_faucet_coin::YIBINJAY_FAUCET_COIN>

coin:
0x2::coin::TreasuryCap<0xe55f387b15347ce3200e408c1213ee2a6f5951875d8239124c7555e7bc4d029c::yibinjay_coin::YIBINJAY_COIN>

export COIN=0xe55f387b15347ce3200e408c1213ee2a6f5951875d8239124c7555e7bc4d029c::yibinjay_coin::YIBINJAY_COIN
export FAUCET=0xe55f387b15347ce3200e408c1213ee2a6f5951875d8239124c7555e7bc4d029c::yibinjay_faucet_coin::YIBINJAY_FAUCET_COIN

sui client publish --gas-budget 50000000

PackageID: 0x0cd49e2217686cae5de14459a5a9f7721b7561362c6b181563033c77fb5acc65

export SWAPACKAGE_ID=0x0cd49e2217686cae5de14459a5a9f7721b7561362c6b181563033c77fb5acc65

faucet ObjectID: 0x4a10aaba6964df60beea7c48fa6fb3ffc7f4b999d481ab4c315b9dbd7426b84f

coin ObjectID: 0xc50d10f8bb12c572144438916967ef41bf6efb7a34acd901492d5e7b9f4c3ee4 

export COIN_OBJECT=0xc50d10f8bb12c572144438916967ef41bf6efb7a34acd901492d5e7b9f4c3ee4 
export FAUCET_OBJECT=0x4a10aaba6964df60beea7c48fa6fb3ffc7f4b999d481ab4c315b9dbd7426b84f
export MY_ADDRESS=0x8766fc99c2c3f9099d52d03126b5d04695bd9e1febcbdb9859fe56aedd00d394

export CPACKAGE_ID=0xe55f387b15347ce3200e408c1213ee2a6f5951875d8239124c7555e7bc4d029c

mint coin:

sui client call --gas-budget 7500000 --package $CPACKAGE_ID --module yibinjay_coin --function mint --args $COIN_OBJECT 1000 $MY_ADDRESS

coinId: ObjectID: 0xedd6fb4675733de5615584b8df66fa9c12499ef634a75d79721933a6f44d630f 

mint faucet:

sui client call --gas-budget 7500000 --package $CPACKAGE_ID --module yibinjay_faucet_coin --function mint --args $FAUCET_OBJECT 1000 $MY_ADDRESS

facuetId: ObjectID: 0x1b108cc7b5cba416ecb533b5aaaa5dba25e744ab220a08308e698f6b140e893e

export COIN_1=0xedd6fb4675733de5615584b8df66fa9c12499ef634a75d79721933a6f44d630f

export FAUCET_1=0x1b108cc7b5cba416ecb533b5aaaa5dba25e744ab220a08308e698f6b140e893e

creat pool:

sui client call --gas-budget 7500000 --package $SWAPACKAGE_ID --module yibinjay_swap --function create_pool --type-args $COIN $FAUCET --args $COIN_1 $FAUCET_1

Transaction Digest: 3Gy3mB9x7fop4psW3dhNqTX8mg3asUJNv1TPyLFP6m4y

pool:  ObjectID: 0x2e71a8a20898478cd6f1088cc625e9008c3db1b40c31475864dba1f7fd31df65 

export POOL_ID=0x2e71a8a20898478cd6f1088cc625e9008c3db1b40c31475864dba1f7fd31df65

swap coin to faucet:

mint coin: sui client call --gas-budget 7500000 --package $CPACKAGE_ID --module yibinjay_coin --function mint --args $COIN_OBJECT 1000 $MY_ADDRESS

ObjectID: 0xb34c7d8961c08281e57e31617ee1de5678795e094456917114fbd8b60d6a7f65

export COIN_2=0xb34c7d8961c08281e57e31617ee1de5678795e094456917114fbd8b60d6a7f65

sui client call --gas-budget 7500000 --package $SWAPACKAGE_ID --module yibinjay_swap --function swap_a_to_b --type-args $COIN $FAUCET --args $POOL_ID $COIN_2

Transaction Digest: GwrVA7QfD8rPYtui4V4XCGkLLXFKNFEWWNXMrSAqgrHx

swap faucet to coin: 

mint faucet: sui client call --gas-budget 7500000 --package $CPACKAGE_ID --module yibinjay_faucet_coin --function mint --args $FAUCET_OBJECT 1000 $MY_ADDRESS

ObjectID: 0x2fe43f74aba07840e1f48a8dd6c15b081c559ded6c23dbc765ed680ab2ca7a65  

export FAUCET_2=0x2fe43f74aba07840e1f48a8dd6c15b081c559ded6c23dbc765ed680ab2ca7a65

sui client call --gas-budget 7500000 --package $SWAPACKAGE_ID --module yibinjay_swap --function swap_b_to_a --type-args $COIN $FAUCET --args $POOL_ID $FAUCET_2

Transaction Digest: E4yHc2jQkpkDf3mAVgqbpeAq8RhEGmV4MnqDzD5fHSSS

sui client balance

╭────────────────────────────────────────────────────────────╮
│ Balance of coins owned by this address                     │
├────────────────────────────────────────────────────────────┤
│ ╭────────────────────────────────────────────────────────╮ │
│ │ coin             balance (raw)  balance                │ │
│ ├────────────────────────────────────────────────────────┤ │
│ │ Sui              14612486720    14.61 SUI              │ │
│ │ unknown          961            0.00 unknown_symbol    │ │
│ │ YibinJay         1002           0.00 YIBINJAY_COIN     │ │
│ │ YIBINJAY_FAUCET  36002401       0.03 YIBINJAY_FAUCET   │ │
│ ╰────────────────────────────────────────────────────────╯ │
╰────────────────────────────────────────────────────────────╯

交换这个任务做完，每个coin都有了和