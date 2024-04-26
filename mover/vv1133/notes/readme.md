# task1

创建账号
sui client new-address ed25519

查看现有账号
sui client addresses

查看目前使用的账号
sui client active-address

切换账号
sui client switch --address awesome-chrysoberyl

查看目前使用的网络
sui client envs

添加主网
sui client new-env --alias=mainnet --rpc https://fullnode.mainnet.sui.io:443

切换主网
sui client switch --env mainnet

获取devnet token：
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "<YOUR SUI ADDRESS>"
    }
}'

获取testnet token：
curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "<YOUR SUI ADDRESS>"
    }
}'

查看token
sui client balance

# task2

## coin

部署：
sui client publish --gas-budget 50000000

mint：
sui client call --function mint --module vv1133_coin --package 0x8b5337b4cf15e138b58c267ad62a69db5a2f3b9b370a5cf0513b54c6b17c073f --args 0x9f0c2a6f182a07b223b49ece4e4b3ea7b45f5fad60f32383a37762ffc2fae7bb 11 0x5bd66f0b7d9eecf2a05b29f8456f3e69d0ef79c289b613d2ff54c9a4c26fcb00 --gas-budget 5000000

转账：
sui client transfer --to 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --object-id 0x353ae06de9ceb56ff23aa177074eb253ab9af3e273c48da7d3e0f5f29d4c932b --gas-budget 10000000

## faucet

部署：
sui client publish --gas-budget 50000000

mint：
sui client call --function mint --module vv1133_faucet --package 0xd5cb8233cba492b0429d66461a50cb997792a8d848758e42bb993b2d1fc74073 --args  0x6c992befefb22b71388e41b91178e13597a9fc73ce7b674ef3bceeec83690ea4 12 0x5bd66f0b7d9eecf2a05b29f8456f3e69d0ef79c289b613d2ff54c9a4c26fcb00 --gas-budget 5000000

# task3

部署：
sui client publish --gas-budget 50000000

mint NFT：
sui client call --function mint_to_sender --package 0x65ccc9fd6fb05ebde6eedfb2d06f14476dedcfba75e2ab706134ce92bac11e9d --module vv1133_nft --args VVNFT "test nft" "https://ipfs.io/ipfs/QmXEY9LjTgtTYLSkZZ2U7CgRYZWCFCXSTHB2fDPL6rHkhn?filename=WX20240421-194648%402x.png" --gas-budget 5000000

转移NFT：
sui client call --function transfer --package 0x65ccc9fd6fb05ebde6eedfb2d06f14476dedcfba75e2ab706134ce92bac11e9d --module vv1133_nft --args0x8e24211e16198dc374a2eec98d0b387e689d3a60e311386dc26d8879a8d5dbce 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 5000000

# task4

## 需求

完成链游，游戏必须包含随机数，游戏必须能存取[task2] 发行的Faucet Coin,用task2的 Faucet Coin作为游戏输赢的资产

## Move.toml 文件修改

之前发布的vv1133_faucet coin:
package-id:0x2dc6368622e25c42ba2fb8df213fa97ef34a311eaa6e052e0ca8b5b9034bc5ac
TreasuryCap-id:0xe667076400d2856e49e293209461b805c82ac4c01944d72f9af33009cd1798ea

vv1133_faucet工程的Move.toml修改：
[package]下添加
published-at = "0x2dc6368622e25c42ba2fb8df213fa97ef34a311eaa6e052e0ca8b5b9034bc5ac"
[addresses]下修改
vv1133_faucet = "0x2dc6368622e25c42ba2fb8df213fa97ef34a311eaa6e052e0ca8b5b9034bc5ac"

vv1133_game工程的Move.toml修改：
[dependencies]下增加
vv1133_faucet = { local = "../../../2/code/vv1133_faucet/" }

## 部署和调用

sui client publish --gas-budget 50000000

sui client call --package 0x4d2eea32606ac568f9ce1df7b6ba1e1672b5543263fa53fb51275b5af5b5da1c --module vv1133_game --function play --args 0xe667076400d2856e49e293209461b805c82ac4c01944d72f9af33009cd1798ea 0 0x6 --gas-budget 5000000

如果游戏胜利会收到100 vv1133_faucet coin

