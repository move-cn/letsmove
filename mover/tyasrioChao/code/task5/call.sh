# 创建银行 比例是 1:100
# 参数1: CoinA的id tyasriochao coin
# 参数2: CoinB的id tyasriochao faucetcoin
sui client call --package 0xcfff4a60587d5475fb62365da7105806aa608b8585a7d4f2ba965a44f7875772 \
--module myswap \
--function add_bank \
--type-args 0xc49669ad5956fba19cc5b0f204e6dd80bcf0cd91992ef98a52033eb44775c3a6::tyasriochaocoin::TYASRIOCHAOCOIN 0xc49669ad5956fba19cc5b0f204e6dd80bcf0cd91992ef98a52033eb44775c3a6::tyasriochaofaucet::TYASRIOCHAOFAUCET  \
--args 0x0dc0792fef1929ca55ee16509ba9ad1d7b23479d6456d3454f12fb1b111261a5 0x23ae7a369b6f0f5a992cbf4e4bb5fc2955f78810af3a864bfdfbe85ea33137b1

# 交换货币A换B
# 参数1: 银行的 ID
# 参数2: CoinA的id tyasriochao coin
sui client call --package 0xcfff4a60587d5475fb62365da7105806aa608b8585a7d4f2ba965a44f7875772 \
--module myswap \
--function swapCoinA \
--type-args 0xc49669ad5956fba19cc5b0f204e6dd80bcf0cd91992ef98a52033eb44775c3a6::tyasriochaocoin::TYASRIOCHAOCOIN 0xc49669ad5956fba19cc5b0f204e6dd80bcf0cd91992ef98a52033eb44775c3a6::tyasriochaofaucet::TYASRIOCHAOFAUCET  \
--args 0xedc8487d43756ed09f7ef05d673323044a23dd7aa4dc24e96ddaa4d01611debb 0x19279d88a07bb6b74c2dd1557ba2a55664f7e703b056462b5bd176ef7c13894d

# 交换货币B换A
# 参数1: 银行的 ID
# 参数2: CoinB的id tyasriochao faucetcoin
sui client call --package 0xcfff4a60587d5475fb62365da7105806aa608b8585a7d4f2ba965a44f7875772 \
--module myswap \
--function swapCoinB \
--type-args 0xc49669ad5956fba19cc5b0f204e6dd80bcf0cd91992ef98a52033eb44775c3a6::tyasriochaocoin::TYASRIOCHAOCOIN 0xc49669ad5956fba19cc5b0f204e6dd80bcf0cd91992ef98a52033eb44775c3a6::tyasriochaofaucet::TYASRIOCHAOFAUCET  \
--args 0xedc8487d43756ed09f7ef05d673323044a23dd7aa4dc24e96ddaa4d01611debb 0xbc4756d06635815cf422fd3446e2957f1ea48f27433fda7256afdac22d324b33

# 取出银行的钱
# 参数1: 银行的 ID
# 参数2: LPTOKEN的 id
sui client call --package 0xcfff4a60587d5475fb62365da7105806aa608b8585a7d4f2ba965a44f7875772 \
--module myswap \
--function withdraw \
--type-args 0xc49669ad5956fba19cc5b0f204e6dd80bcf0cd91992ef98a52033eb44775c3a6::tyasriochaocoin::TYASRIOCHAOCOIN 0xc49669ad5956fba19cc5b0f204e6dd80bcf0cd91992ef98a52033eb44775c3a6::tyasriochaofaucet::TYASRIOCHAOFAUCET  \
--args 0xedc8487d43756ed09f7ef05d673323044a23dd7aa4dc24e96ddaa4d01611debb 0x9d74f057b7f7c3a53c7f7523539652caed0d8bd9954589bb509f2ac02e1e907b