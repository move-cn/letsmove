```
# 构建
sui move build --skip-fetch-latest-git-deps

# 发布
sui client publish  --skip-dependency-verification

# 切网
sui client switch --env devnet

# 领水
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x237a4728defca6bb0c2a4ccc643e71c4ea04c361c3f3c76a164401e2fa700dd8"
    }
}'

# 切用户
sui client switch --address 0xfffee58fd4622957d1f4d2582ba3b2d36d43ab89029f10e352ac2974c561b5f9
sui client switch --address 0x09b724887e8f2f6f3e13ed09a03bf9a577d7c668b735627cd14aa9dc129441d2
sui client switch --address 0x237a4728defca6bb0c2a4ccc643e71c4ea04c361c3f3c76a164401e2fa700dd8


# mint faucet testnet
sui client call --gas-budget=100000000 \
--package=0xe0ae078e8cc82d4a339ce7e716d45be9a04c202aac7a74e34bcd98f111e116ac \
--module=chenerge_faucet --function=mint_to \
--args 0xdd98756ecd567d37607f3dd1731d360c31297f1bb283fb073cf6716c0b59cc92  123000000 0xfffee58fd4622957d1f4d2582ba3b2d36d43ab89029f10e352ac2974c561b5f9

sui client call --gas-budget=100000000 \
--package=0xe0ae078e8cc82d4a339ce7e716d45be9a04c202aac7a74e34bcd98f111e116ac \
--module=chenerge_faucet --function=mint_to \
--args 0xdd98756ecd567d37607f3dd1731d360c31297f1bb283fb073cf6716c0b59cc92  222000000 0x09b724887e8f2f6f3e13ed09a03bf9a577d7c668b735627cd14aa9dc129441d2

sui client call --gas-budget=100000000 \
--package=0xe0ae078e8cc82d4a339ce7e716d45be9a04c202aac7a74e34bcd98f111e116ac \
--module=chenerge_faucet --function=mint_to \
--args 0xdd98756ecd567d37607f3dd1731d360c31297f1bb283fb073cf6716c0b59cc92  333000000 0x237a4728defca6bb0c2a4ccc643e71c4ea04c361c3f3c76a164401e2fa700dd8

# mint faucet mainnet
## player1
sui client switch --address 0xfffee58fd4622957d1f4d2582ba3b2d36d43ab89029f10e352ac2974c561b5f9

## player2
sui client call --gas-budget=100000000 \
--package=0x6ff12a5759a7507a0cf48378868c92dce4c4de4c25f11213858212f497b9ddec \
--module=chenerge_faucet --function=mint \
--args 0x8872654908f969de8e837ae8b8aea3593120626868a63b65b9308e5eb802c0d6  10000000

## player2
sui client switch --address 0x09b724887e8f2f6f3e13ed09a03bf9a577d7c668b735627cd14aa9dc129441d2

sui client call --gas-budget=100000000 \
--package=0x6ff12a5759a7507a0cf48378868c92dce4c4de4c25f11213858212f497b9ddec \
--module=chenerge_faucet --function=mint \
--args 0x8872654908f969de8e837ae8b8aea3593120626868a63b65b9308e5eb802c0d6  20000000

## player3
sui client switch --address 0x237a4728defca6bb0c2a4ccc643e71c4ea04c361c3f3c76a164401e2fa700dd8

sui client call --gas-budget=100000000 \
--package=0x6ff12a5759a7507a0cf48378868c92dce4c4de4c25f11213858212f497b9ddec \
--module=chenerge_faucet --function=mint \
--args 0x8872654908f969de8e837ae8b8aea3593120626868a63b65b9308e5eb802c0d6  30000000







(*)player1: 0xfffee58fd4622957d1f4d2582ba3b2d36d43ab89029f10e352ac2974c561b5f9
0x7c2427f7ea4e00d57fe2ab5a781d5a847c5314655c2357042c64afcc55f6162c  10

player2: 0x09b724887e8f2f6f3e13ed09a03bf9a577d7c668b735627cd14aa9dc129441d2 20
0xf64d6fec62ae6af920e17cdeecd276443e34856d53238ebf6d1bea952b4ebc49	20

player3: 0x237a4728defca6bb0c2a4ccc643e71c4ea04c361c3f3c76a164401e2fa700dd8
0xa8d744dd513a266fea78a97e972bac50f76d3629c06c6e3ef5d9a43a82d7df41 30


# deposit
## player1
sui client switch --address 0xfffee58fd4622957d1f4d2582ba3b2d36d43ab89029f10e352ac2974c561b5f9

sui client call --gas-budget=100000000 \
--package=0xe36750e6981fc0e8c45b300c6227a600102c6199200bea810233fbb046b74a18 \
--module=split --function=deposit \
--args 0x3cdff3fe68198dd3de883f0291182e6ace9ea829180bc6e99a6dcf973adb3ada 0x7c2427f7ea4e00d57fe2ab5a781d5a847c5314655c2357042c64afcc55f6162c


## player2
sui client switch --address 0x09b724887e8f2f6f3e13ed09a03bf9a577d7c668b735627cd14aa9dc129441d2

sui client call --gas-budget=100000000 \
--package=0xe36750e6981fc0e8c45b300c6227a600102c6199200bea810233fbb046b74a18 \
--module=split --function=deposit \
--args 0x3cdff3fe68198dd3de883f0291182e6ace9ea829180bc6e99a6dcf973adb3ada 0xa8d744dd513a266fea78a97e972bac50f76d3629c06c6e3ef5d9a43a82d7df41


## player3
sui client switch --address 0x237a4728defca6bb0c2a4ccc643e71c4ea04c361c3f3c76a164401e2fa700dd8

sui client call --gas-budget=100000000 \
--package=0xe36750e6981fc0e8c45b300c6227a600102c6199200bea810233fbb046b74a18 \
--module=split --function=deposit \
--args 0x3cdff3fe68198dd3de883f0291182e6ace9ea829180bc6e99a6dcf973adb3ada 0x7c2427f7ea4e00d57fe2ab5a781d5a847c5314655c2357042c64afcc55f6162c




# draw 开奖
sui client call --gas-budget=100000000 \
--package=0xe36750e6981fc0e8c45b300c6227a600102c6199200bea810233fbb046b74a18 \
--module=split --function=draw \
--args 0xb898a904b71687c19a3f6048c4a012e7548c808af2c41aa00213aab6448ae583 0x3cdff3fe68198dd3de883f0291182e6ace9ea829180bc6e99a6dcf973adb3ada 0x8
```