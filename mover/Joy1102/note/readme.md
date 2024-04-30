## task1

获取：
sui client faucet
查询：
sui client gas
发布：
sui client publish --gas-budget 5000000

提示：
Error executing transaction: Failure {
    error: "InsufficientGas",
}

提高一下gas-budget

sui client publish --gas-budget 10000000

## task2

sui client publish --gas-budget 200000000

sui client call --package 0x2bf06ebb29e1dde43fc251d90071c3fe86381abd4b5aafe23d3e33733f332480  --module joy1102_coin --function mint --args 0x17a8f8b22a02464885f5b5863a28c7739edec89924c5c00adb898138386638be 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

## task3

sui client publish --gas-budget 200000000

第一个参数传入Github名称，第二个接受者地址

sui client call --package 0xe1ea9751adcee284d32e7a1f8d5e440713d98319840e3b0a0a3af55219171ff5 --module joy1102nft --function mint_to --args "JOY1102" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

## task4

修改task2的toml文件

[package]下添加
published-at = "0x2bf06ebb29e1dde43fc251d90071c3fe86381abd4b5aafe23d3e33733f332480"
[addresses]下修改
task2 = "0x2bf06ebb29e1dde43fc251d90071c3fe86381abd4b5aafe23d3e33733f332480"

在[suivision网站找到](https://suivision.xyz/package/0x2bf06ebb29e1dde43fc251d90071c3fe86381abd4b5aafe23d3e33733f332480)当时产生的JOY1102_FAUCET_COIN的TreasuryCap_Id

export TreasuryCapId=0x374f892b23b1cd85767d7e4becb29966cdd9b5996c600e4054da4320377a9ac4

sui client publish --gas-budget 50000000

sui client call --package 0x9096235f7caf6a308ae5591296098e714724c1effb90cf164f7abd201e5fce6c --module joy1102_game --function play --args $TreasuryCapId 0 0x6 --gas-budget 5000000

游戏胜利会收到1枚 JOY1102_FAUCET_COIN

## task5

找到task2的COIN_TYPE

export JOY1102_COIN='0x2bf06ebb29e1dde43fc251d90071c3fe86381abd4b5aafe23d3e33733f332480::joy1102_coin::JOY1102_COIN'
export JOY1102_FAUCET='0x2bf06ebb29e1dde43fc251d90071c3fe86381abd4b5aafe23d3e33733f332480::joy1102_faucet_coin::JOY1102_FAUCET_COIN'

构建上链

sui client publish --gas-budget 50000000

export SWAP_PACKAGE_ID=0x0748a3274e5cdd0520ddf5434db34107a3b3d4ebfa17683e40d3647208f70e80

铸币

export PACKAGE_ID=0x2bf06ebb29e1dde43fc251d90071c3fe86381abd4b5aafe23d3e33733f332480
export JOY1102_COIN_TREASURY_CAP_ID=0x17a8f8b22a02464885f5b5863a28c7739edec89924c5c00adb898138386638be
export JOY1102_FAUCET_TREASURY_CAP_ID=0x374f892b23b1cd85767d7e4becb29966cdd9b5996c600e4054da4320377a9ac4
export MY_ADDRESS=0xb7ccfd3823b5445844d214a822f2b97a0048e5bf545546c32b1c760c83663d41

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module joy1102_coin --function mint --args $JOY1102_COIN_TREASURY_CAP_ID 1000 $MY_ADDRESS

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module joy1102_faucet_coin --function mint --args $JOY1102_FAUCET_TREASURY_CAP_ID 1000 $MY_ADDRESS

export JOY1102_COIN_ID_1=0x5e78c2510a8255b6146191fe555c699e1d86ced0d9c9338bfa2ee3259d266161
export JOY1102_FAUCET_ID_1=0x01b6f2e6a11f914afebfaf8b74af53e61d50d87bd5433a8b4a9c6887e2223bb3 

构建连通池

sui client call --gas-budget 7500000 --package $SWAP_PACKAGE_ID --module joy1102_swap \
    --function create_pool --type-args $JOY1102_COIN $JOY1102_FAUCET \
    --args $JOY1102_COIN_ID_1 $JOY1102_FAUCET_ID_1

export POOL_ID=0x184e473d9a91d611b665bceefb0c8ceb2ee848c250b0f6560c9c6124c150b732

hash: [HRQrAAfDJ7BEv8dLxGZyWV7mrGcMa3Y5SwLMjgNYCvgz](https://suivision.xyz/txblock/HRQrAAfDJ7BEv8dLxGZyWV7mrGcMa3Y5SwLMjgNYCvgz)

交换

首先需要先铸造一枚 JOY110_COIN

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module joy1102_coin --function mint --args $JOY1102_COIN_TREASURY_CAP_ID 1000 $MY_ADDRESS

export JOY1102_COIN_ID_2=0x8f3b05803c8e3b14e2b2ac1b53a266716db9dd54d6000459fe811f65ca4dd6e6

sui client call --gas-budget 7500000 --package $SWAP_PACKAGE_ID --module joy1102_swap \
    --function swap_a_to_b --type-args $JOY1102_COIN $JOY1102_FAUCET \
    --args $POOL_ID $JOY1102_COIN_ID_2


hash: [9QowzxU4SMqF3mktjFtTea5CNKBNKSNDYqPNRYEr38YZ](https://suivision.xyz/txblock/9QowzxU4SMqF3mktjFtTea5CNKBNKSNDYqPNRYEr38YZ)
