task1: 
sui client publish --gas-budget 20000000

提示：
Cannot find gas coin for signer address 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd with amount sufficient for the required gas budget 20000000. If you are using the pay or transfer commands, you can use pay-sui or transfer-sui commands instead, which will use the only object as gas payment.

sui client faucet

╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0x14235f111b81ef55c5889f9743da8977cecd760e47f20d5ac34eed24b97c065f │ 1000000000         │ 1.00             │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯

sui client publish --gas-budget 20000000

│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xf24f35d9cd430bd7cdfdef40127b6e43ac7dd3219fe8344f45cf7675c312b557                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 8KgNMNuf7vFXm1dc8Ypf5sWE2WSQdR1bk86BUxBkoFWF                                          │
│  │ Modules: hello_move                                                                           │
│  └──                        

task2:  

sui move new marktranet_coin

sui client publish --gas-budget 20000000

Published Objects:                                                                                                                            │
│  ┌──                                                                                                                                          │
│  │ PackageID: 0x33952751fb7ac5bea14a1e0588660ea2a3450762c83c9691c253214d998c41c9                                                              │
│  │ Version: 1                                                                                                                                 │
│  │ Digest: DWWqgjBsYbsh14AHBEMCQxTUd43DDPH5SbiW5SAvfVmq                                                                                       │
│  │ Modules: marktranet_coin                                                                                                                   │
│  └──                                                                                                                  

TreasureID: 0x189417a7a2e4fac62e4ccfb63b3c8a73c11d6dc9f13979c16143f19a14666376

0x33952751fb7ac5bea14a1e0588660ea2a3450762c83c9691c253214d998c41c9::marktranet_coin::MARKTRANET_COIN

mint给指定的地址`0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`：

sui client call --package 0x33952751fb7ac5bea14a1e0588660ea2a3450762c83c9691c253214d998c41c9  --module marktranet_coin --function mint --args 0x189417a7a2e4fac62e4ccfb63b3c8a73c11d6dc9f13979c16143f19a14666376 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

Transaction Digest: AH8KL6ZgQjTS9HW2bNT8HrkyanVBtgV8BCKZFjz2SaHE

sui move new marktranet_faucet_coin

sui client publish --gas-budget 20000000

Published Objects:                                                                                                                            │
│  ┌──                                                                                                                                          │
│  │ PackageID: 0x70d4e4cc6c8cc6c49d5cd4aeb5d68b0c3b74b1a670a8bbab0d8d963e63c8e1e8                                                             │
│  │ Version: 1                                                                                                                                 │
│  │ Digest: 2WCSN895y6jUssKvCnvuKWDULprrEqScQcuETFZYg63j                                                                                        │
│  │ Modules: marktranet_faucet_coin                                                                                                                    │
│  └──         


TreasureID: 0x400159161edd67cd40cc8ff67a974f0cff2028b9c5f20bd13b5b5f162be2a16b  

type: 0x70d4e4cc6c8cc6c49d5cd4aeb5d68b0c3b74b1a670a8bbab0d8d963e63c8e1e8::marktranet_faucet_coin::MARKTRANET_FAUCET_COIN>

mint给指定的地址`0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`：

sui client call --package 0x70d4e4cc6c8cc6c49d5cd4aeb5d68b0c3b74b1a670a8bbab0d8d963e63c8e1e8    --module marktranet_faucet_coin --function mint --args 0x400159161edd67cd40cc8ff67a974f0cff2028b9c5f20bd13b5b5f162be2a16b  1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

Transaction Digest: 8fRrvpqqWNYAMbw5Tek9EEUxQZ71p2cSsoJFHBqyvEGZ

mint给自己`0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd`:

sui client call --package 0x70d4e4cc6c8cc6c49d5cd4aeb5d68b0c3b74b1a670a8bbab0d8d963e63c8e1e8    --module marktranet_faucet_coin --function mint --args 0x400159161edd67cd40cc8ff67a974f0cff2028b9c5f20bd13b5b5f162be2a16b  1000000 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd --gas-budget 50000000

Transaction Digest: CASz66X5zgMc7SNLFmGT23z4r3kowWympk6hNoY8whFt

nft:

sui client publish --gas-budget 20000000

│ Published Objects:                                                                                                             │
│  ┌──                                                                                                                           │
│  │ PackageID: 0xe31be82f4df17d375df73d5497700624725f5b0f003646ce1713dc157461026a                                               │
│  │ Version: 1                                                                                                                  │
│  │ Digest: 9N3uvgtrs3vq2BRyJgK5J2dUa1DGuNjiwZZ3SaY81xsE                                                                        │
│  │ Modules: marktranet_nft                                                                                                     │
│  └──                                                                                          

拿到包 PackageID: 0xe31be82f4df17d375df73d5497700624725f5b0f003646ce1713dc157461026a 

自己的地址： `0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd`:

sui client call --package 0xe31be82f4df17d375df73d5497700624725f5b0f003646ce1713dc157461026a  --module marktranet_nft --function mint_to --args "Marktranet" 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd --gas-budget 20000000

│  ┌──                                                                                                    │
│  │ ObjectID: 0x114b3c14f511bc430a118719772e0051d57a2ca0aac2a44ad3387c3fb8fcd7f8                         │
│  │ Sender: 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd                           │
│  │ Owner: Account Address ( 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd )        │
│  │ ObjectType: 0xe31be82f4df17d375df73d5497700624725f5b0f003646ce1713dc157461026a::marktranet_nft::NFT  │
│  │ Version: 123314097                                                                                   │
│  │ Digest: Ez6qiTJBQUjzWKTwbe2RKtCXdyubrzcdYgrN1K1vg8GW                                                 │
│  └──   

mint给`0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`：

sui client call --package 0xe31be82f4df17d375df73d5497700624725f5b0f003646ce1713dc157461026a  --module marktranet_nft --function mint_to --args "Marktranet" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 20000000

│ Created Objects:                                                                                        │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x99e306d9d2e9791751da3de7df45518a4be639f149df11a43c7efcdc79da3f6c                         │
│  │ Sender: 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd                           │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )        │
│  │ ObjectType: 0xe31be82f4df17d375df73d5497700624725f5b0f003646ce1713dc157461026a::marktranet_nft::NFT  │
│  │ Version: 123314098                                                                                   │
│  │ Digest: 4989X3yyT5GSCmXJzfKdsBFoPNtHSat269iNHLLmUkQi                                                 │
│  └──         


game:

设计了一个勇者大冒险的游戏，游戏中玩家可以通过探索来与随机生成的怪物战斗。每次战斗后，如果玩家获胜，会获得金币和经验值，失败则游戏结束。玩家可以使用金币购买药水来恢复生命值。游戏包括了创建游戏、战斗、购买药水、存款和取款的功能。

游戏规则:
1. 玩家可以选择探索不同的区域，每个区域有不同的怪物。
2. 玩家有初始的生命值、攻击力和防御力。
3. 每次战斗时，玩家和怪物互相攻击，直到一方生命值为零。
4. 如果玩家胜利，可以获得奖励（金币和经验值），并有机会获得装备提升攻击力或防御力。
5. 玩家可以用金币购买药水来恢复生命值。

RPC call failed: ErrorObject { code: ServerError(-32002), message: "Transaction execution failed due to issues with transaction inputs, please review the errors and try again: TransferObjects, MergeCoin, and Publish cannot have empty arguments. If MakeMoveVec has empty arguments, it must have a type specified.", data: None }

改了一下

sui client publish --gas-budget 30000000

│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x1ac6f5b29768a209175a1cb907c631ca69eebfb686faeb16abaf37756df650dc                 │
│  │ Version: 1                                                                                    │
│  │ Digest: Hxd54Pbmu8G1xbbZzFwcaGFc3gn5M4vume7pS9vuZgpb                                          │
│  │ Modules: marktranet_game                                                                      │
│  └──                                                                                             │

调用create_game创建游戏

第一步是拿到move_coin任务的treasureCapId和Faucet Coin的type

export TYPE=0x70d4e4cc6c8cc6c49d5cd4aeb5d68b0c3b74b1a670a8bbab0d8d963e63c8e1e8::marktranet_faucet_coin::MARKTRANET_FAUCET_COIN
export TREA=0x400159161edd67cd40cc8ff67a974f0cff2028b9c5f20bd13b5b5f162be2a16b
export PACK=0x1ac6f5b29768a209175a1cb907c631ca69eebfb686faeb16abaf37756df650dc

调用create_game函数创建游戏

sui client call --gas-budget 7500000 --package $PACK --module marktranet_game --function create_game --type-args $TYPE

Created Objects:                                                                                                                                                                                                              │
│  ┌──                                                                                                                                                                                                                          │
│  │ ObjectID: 0x2de05fe6baf57a12c1d6202aab9362ffdd26870cadeb4cacff0b9d14aef8d2d3                                                                                                                                               │
│  │ Sender: 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd                                                                                                                                                 │
│  │ Owner: Account Address ( 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd )                                                                                                                              │
│  │ ObjectType: 0x1ac6f5b29768a209175a1cb907c631ca69eebfb686faeb16abaf37756df650dc::marktranet_game::AdminCap                                                                                                                  │
│  │ Version: 131861842                                                                                                                                                                                                         │
│  │ Digest: D7cCbS4TxzKa4oCrpfisiPFK3skQjz78oDKgYuhng7r9                                                                                                                                                                       │
│  └──                                                                                                                                                                                                                          │
│  ┌──                                                                                                                                                                                                                          │
│  │ ObjectID: 0xf0448d9a1282fc8aac58d7831f6720c6d37150f0fc27f81373d77f8548252d90                                                                                                                                               │
│  │ Sender: 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd                                                                                                                                                 │
│  │ Owner: Shared                                                                                                                                                                                                              │
│  │ ObjectType: 0x1ac6f5b29768a209175a1cb907c631ca69eebfb686faeb16abaf37756df650dc::marktranet_game::Game<0x70d4e4cc6c8cc6c49d5cd4aeb5d68b0c3b74b1a670a8bbab0d8d963e63c8e1e8::marktranet_faucet_coin::MARKTRANET_FAUCET_COIN>  │
│  │ Version: 131861842                                                                                                                                                                                                         │
│  │ Digest: ER5bGyMUMGu6sNjRPybHzvX2s5TbqqHMQPCpnk7hyf8U                                                                                                                                                                       │
│  └──                                                                                                                                                                                                                          │
│ Mutated Objects:                                                                                                                                                                                                              │
│  ┌──                                                                                                                                                                                                                          │
│  │ ObjectID: 0x0a64b680d268391f0e49992f093a66ad46973d160339e909086082e92d6d9356                                                                                                                                               │
│  │ Sender: 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd                                                                                                                                                 │
│  │ Owner: Account Address ( 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd )                                                                                                                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                 │
│  │ Version: 131861842                                                                                                                                                                                                         │
│  │ Digest: ENQeQbmgfDCDPL6QMWHzvi2DuJKfNS38sfwaqThp7Y8R                                                                                                                                                                       │
│  └──                                                                                                                                                                                                                          │

export GAME=0xf0448d9a1282fc8aac58d7831f6720c6d37150f0fc27f81373d77f8548252d90      
export ADMIN=0x2de05fe6baf57a12c1d6202aab9362ffdd26870cadeb4cacff0b9d14aef8d2d3 
export ADDR=0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd

export FAUCETPACK=0x70d4e4cc6c8cc6c49d5cd4aeb5d68b0c3b74b1a670a8bbab0d8d963e63c8e1e8

sui client call --package $FAUCETPACK  --module marktranet_faucet_coin --function mint --args $TREA 1000000 $ADDR --gas-budget 50000000

export FAUCET=0x2f3c84a0781ce6d68a4fe33778e9022f1656463efb834f1081d017ddde1f1cdc

deposit:

sui client call --package $PACK --module marktranet_game --function deposit  --type-args $TYPE --args $GAME $FAUCET 500000 --gas-budget 20000000

Transaction Digest: 9v1j2uasn4XjcFG1xr5KYdyHWFqp38vVcsXiv6doANut

export GAME_COIN=0xf22b76f8b1e7d7abbed762524b7d94ead20f0ab22c83321ec228040735a714f2    

勇者即将开启探索！

sui client call --package $PACK --module marktranet_game --function explore --type-args $TYPE --args $GAME $GAME_COIN 0x6 --gas-budget 10000000

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                          │
│  │ EventID: 2SJcC3ZAwswEHhM3PYfSVWiRWq8SrhDorP82u4VYYp4w:0                                                    │
│  │ PackageID: 0x1ac6f5b29768a209175a1cb907c631ca69eebfb686faeb16abaf37756df650dc                              │
│  │ Transaction Module: marktranet_game                                                                        │
│  │ Sender: 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd                                 │
│  │ EventType: 0x1ac6f5b29768a209175a1cb907c631ca69eebfb686faeb16abaf37756df650dc::marktranet_game::GameResult │
│  │ ParsedJSON:                                                                                                │
│  │   ┌────────────────┬─────────┐                                                                             │
│  │   │ monster_health │ 0       │                                                                             │
│  │   ├────────────────┼─────────┤                                                                             │
│  │   │ player_health  │ 34      │                                                                             │
│  │   ├────────────────┼─────────┤                                                                             │
│  │   │ result         │ Victory │                                                                             │
│  │   ├────────────────┼─────────┤                                                                             │
│  │   │ reward_exp     │ 10      │                                                                             │
│  │   ├────────────────┼─────────┤                                                                             │
│  │   │ reward_gold    │ 20      │                                                                             │
│  │   └────────────────┴─────────┘                                                                             │
│  └──                                                                                                          │

可以看到玩家获胜

Transaction Digest: 2SJcC3ZAwswEHhM3PYfSVWiRWq8SrhDorP82u4VYYp4w

withdraw:

sui client call --package $PACK --module marktranet_game --function withdraw --type-args $TYPE --args $ADMIN $GAME 2000 --gas-budget 10000000

Transaction Digest: 6Fw11QGtWhCzY8tMmUTKmhwSQ37jb1DutYRPFSHD8sCC