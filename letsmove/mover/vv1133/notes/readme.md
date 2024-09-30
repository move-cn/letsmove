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
package-id:0xd5cb8233cba492b0429d66461a50cb997792a8d848758e42bb993b2d1fc74073
TreasuryCap-id:0x6c992befefb22b71388e41b91178e13597a9fc73ce7b674ef3bceeec83690ea4

vv1133_faucet工程的Move.toml修改：
[package]下添加
published-at = "0xd5cb8233cba492b0429d66461a50cb997792a8d848758e42bb993b2d1fc74073"
[addresses]下修改
vv1133_faucet = "0xd5cb8233cba492b0429d66461a50cb997792a8d848758e42bb993b2d1fc74073"

vv1133_game工程的Move.toml修改：
[dependencies]下增加
vv1133_faucet = { local = "../../../2/code/vv1133_faucet/" }

## 部署和调用

sui client publish --gas-budget 50000000

sui client call --package 0x25158046b72d620d70d85fe4511e367caa27ac77d49faacda06abd82f67c785e --module vv1133_game --function play --args 0x6c992befefb22b71388e41b91178e13597a9fc73ce7b674ef3bceeec83690ea4 0x5a81e0f33142c7e7566a7164120838ea582d740dbedf3c4656d618d6cede25a3 0 0x6 --gas-budget 5000000

如果游戏失利会损失质押的vv1133_faucet coin，如果胜利会收到双倍质押的vv1133_faucet coin

# task5

vv1133_coin package-id: 0x8b5337b4cf15e138b58c267ad62a69db5a2f3b9b370a5cf0513b54c6b17c073f
vv1133_faucet package-id: 0xd5cb8233cba492b0429d66461a50cb997792a8d848758e42bb993b2d1fc74073

先mint 1000个vv1133_coin和2000个vv1133_faucet：
sui client call --function mint --module vv1133_coin --package 0x8b5337b4cf15e138b58c267ad62a69db5a2f3b9b370a5cf0513b54c6b17c073f --args 0x9f0c2a6f182a07b223b49ece4e4b3ea7b45f5fad60f32383a37762ffc2fae7bb 1000000000 0x5bd66f0b7d9eecf2a05b29f8456f3e69d0ef79c289b613d2ff54c9a4c26fcb00 --gas-budget 5000000
sui client call --function mint --module vv1133_faucet --package 0xd5cb8233cba492b0429d66461a50cb997792a8d848758e42bb993b2d1fc74073 --args 0x6c992befefb22b71388e41b91178e13597a9fc73ce7b674ef3bceeec83690ea4 2000000000 0x5bd66f0b7d9eecf2a05b29f8456f3e69d0ef79c289b613d2ff54c9a4c26fcb00 --gas-budget 5000000

得到：
0x808e1a507d5098cd33e1a8ff98292c6ede80bb8c30a68a6787b967788e40a70d (1000个vv1133_coin)
0x1a165f581321fd63838af9099d8296c9f9f59efb754b0751aa1fc92135586611 (2000个vv1133_faucet)

发布合约：
sui client publish --gas-budget 50000000
得到合约地址：PackageID: 0xb8b4352b47596460386ab5e07244881ca5a1007b507dec12e7022a092d78fe2a

创建池：
sui client call --function create_pool --module vv1133_swap --package 0xb8b4352b47596460386ab5e07244881ca5a1007b507dec12e7022a092d78fe2a --args 0x808e1a507d5098cd33e1a8ff98292c6ede80bb8c30a68a6787b967788e40a70d 0x1a165f581321fd63838af9099d8296c9f9f59efb754b0751aa1fc92135586611 --type-args 0x8b5337b4cf15e138b58c267ad62a69db5a2f3b9b370a5cf0513b54c6b17c073f::vv1133_coin::VV1133_COIN 0xd5cb8233cba492b0429d66461a50cb997792a8d848758e42bb993b2d1fc74073::vv1133_faucet::VV1133_FAUCET --gas-budget 5000000
得到pool object id：0xb5a09bb3000551ab4d14dd4f32c501e7f99ff2282bb48e1976f48b8eb8aa940c

再mint 10个vv1133_faucet:
sui client call --function mint --module vv1133_faucet --package 0xd5cb8233cba492b0429d66461a50cb997792a8d848758e42bb993b2d1fc74073 --args 0x6c992befefb22b71388e41b91178e13597a9fc73ce7b674ef3bceeec83690ea4 10000000 0x5bd66f0b7d9eecf2a05b29f8456f3e69d0ef79c289b613d2ff54c9a4c26fcb00 --gas-budget 5000000
得到：
0x78ac48fbbeb379a78617d658dee974077dfa069b21aa7d6c38101b0b84fb575c(10个vv1133_faucet)

swap 10个 vv1133_faucet 到 vv1133_coin：
sui client call --function swap_coin_b_to_coin_a --module vv1133_swap --package 0xb8b4352b47596460386ab5e07244881ca5a1007b507dec12e7022a092d78fe2a --args 0xb5a09bb3000551ab4d14dd4f32c501e7f99ff2282bb48e1976f48b8eb8aa940c 0x78ac48fbbeb379a78617d658dee974077dfa069b21aa7d6c38101b0b84fb575c --type-args 0x8b5337b4cf15e138b58c267ad62a69db5a2f3b9b370a5cf0513b54c6b17c073f::vv1133_coin::VV1133_COIN 0xd5cb8233cba492b0429d66461a50cb997792a8d848758e42bb993b2d1fc74073::vv1133_faucet::VV1133_FAUCET --gas-budget 5000000
得到4.97个vv1133_coin

交易hash地址：B14TaCAVkDq1Dng2NU9k1dE93LXo9KnH4wxygmsDtH7j


