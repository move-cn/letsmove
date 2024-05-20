# task2 完成两个Coin合约的上链部署

- 上链网络: mainnet

## 需求

- 完成 Coin相关知识的学习
- 完成 `My Coin` 的学习并部署主网
- 完成 `Faucet Coin` 的学习并部署主网
- 提交 `My Coin` 和 `Faucet Coin` 合约发布 `package id`
- 发送 `My Coin`  给地址 `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`
- `Faucet Coin` 需要至少用两个地址mint

sui client publish --gas-budget 40000000

export PACKAGE_ID=0xedfec1a78e883e790eae6e873d5643a6c309c40103fbbab8717285976d0767c5                   

export COIN_TREASURE=0x2bb4971225ef1824c1a311655a8396d543818826639c7ddca164bc24e3d1d38f 
export FAUCET_TREASURE=0xe1448ba698cd3da190580f2ac308aedd28ce3811ad1387be0068b0d5fa8b925f

export COIN_TYPE=0xedfec1a78e883e790eae6e873d5643a6c309c40103fbbab8717285976d0767c5::howardlau2000_coin::HOWARDLAU2000_COIN
export FAUCET_TYPE=0xedfec1a78e883e790eae6e873d5643a6c309c40103fbbab8717285976d0767c5::howardlau2000_faucet_coin::HOWARDLAU2000_FAUCET_COIN

export MY_ADDR=0x92172547190c5dcc69eeacd9072ab718e8e9e66343f6aff0d9cb757215770f83
export DEFAULT_ADDR=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module howardlau2000_coin --function mint --args $COIN_TREASURE 1000 $DEFAULT_ADDR

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module howardlau2000_faucet_coin --function mint --args $FAUCET_TREASURE 1000 $DEFAULT_ADDR

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module howardlau2000_faucet_coin --function mint --args $FAUCET_TREASURE 1000 $MY_ADDR

# task3  完成NFT的上链部署
- 上链网络: 主网(mainnet)

## 需求
- 完成 NFT相关知识的学习
- 完成可以mint NFT的合约上链
- 给自己地址mint一个NFT
-  NFT必须是自己 github 的头像作为图片
- mint 一个 nft 发送到地址: `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`
- 提交mint到自己地址的浏览器查看(Scan)截图

sui client publish --gas-budget 20000000

export PACKAGE_ID=0xfbf28970a9cf17ca1806f3ea3bd7c6a09718e265a5af3743ca52ed3313c6bf9b     
export MY_ADDR=0x92172547190c5dcc69eeacd9072ab718e8e9e66343f6aff0d9cb757215770f83 

sui client call --package $PACKAGE_ID --module howardlau2000nft --function mint_to --args "howardlau2000" $MY_ADDR --gas-budget 20000000

Transaction Digest: DvbwdpHxWmoaBP4wF9vJEsoQiHQcN4gW84ntMxoV72Bu
ObjectID: 0xdee3dfef790963860c39a07c1cc503161beded4e55944f4942995f04b1ddb7c7  

export TARGET_ADDR=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --package $PACKAGE_ID --module howardlau2000nft --function mint_to --args "howardlau2000 sent" $TARGET_ADDR --gas-budget 20000000

Transaction Digest: 5jntJ6NaYWc17dVhMvdcrYxAEpFdbye8PpEstJEk8oEC

ObjectID: 0xd3f8d0950f7c4146ca325ae3c53eb93040d49b8ac29b1438be5a160a35bc0343  

# task4 完成游戏的上链部署
- 上链网络: 主网(mainnet)

## 需求
- 完成 链游相关知识的学习
- 完成 随机数的学习，游戏必须包含随机数
- 完成 存和取游戏资金池
- 完成 如何存储Coin在合约的学习，游戏必须能存取[task2] 发行的`Faucet Coin`,用`task2`的 `Faucet Coin`作为游戏输赢的资产 
- 完成 第一个游戏合约部署主网
- 的game 必须包含自己的 `github id`的元素

`掷骰子游戏，npc和用户的点数都通过clock随机数生成，区别在于一个为 clock::timestamp_ms(clock) /100 和 clock::timestamp_ms(clock)`

sui client publish --gas-budget 40000000

export PACKAGE_ID=0x4bbd66618ff7e5e6cdd06a19c08ee324bd8252c0032f9377566cb4230595f430 
export GAME_ID=0x88d5340ea2f7a93e45f0634c2d4b5c6c5f73af8a3285ece572b9f0db19717f4b  
export ADMIN_CAP=0x9b5dbb5d9f3bfc3cb06a295b02c93c1d7887c5f8b43432b3b0acfefc7b403d74

export FAUCET=0xe1448ba698cd3da190580f2ac308aedd28ce3811ad1387be0068b0d5fa8b925f

sui client call --package $PACKAGE_ID --module howardlau2000_game --function get_faucet_coin --args $FAUCET 10000000 --gas-budget 10000000

export FAUCET_COIN=0x61f6acd2d0efaf41e1e81cb75329bc6820c1399a7384d81bc2572d98bf48bc7d       

sui client call --package $PACKAGE_ID --module howardlau2000_game --function deposit --args $GAME_ID  $FAUCET_COIN 5000000 --gas-budget 20000000

Transaction Digest: 2Q7CDAAZzQXLxmopGuXTY9t4ksM6yKHbETaGJL6j7aFL

export GAME_COIN=0xc2a934fde31d5e2216a89a6abb3f5692d649d8ec133ed8ad2b6c149d72875936 

sui client call --package $PACKAGE_ID --module howardlau2000_game --function play --args $GAME_ID $GAME_COIN 0x6 --gas-budget 100000000

Transaction Digest: FfNo8jjAF4PkTz8zryAPya7ntJaEJ63hoFzv5mQQXcYp

sui client call --package $PACKAGE_ID --module howardlau2000_game --function withdraw --args $ADMIN_CAP $GAME_ID 2000 --gas-budget 10000000

Transaction Digest: 9tTVW4SDwQKGT9tsLD5JrtfSdEzS9iTYTVW3s3yWPXqt
