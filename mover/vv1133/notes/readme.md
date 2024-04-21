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
