sui client publish --gas-budget 50000000 --skip-dependency-verification  --with-unpublished-dependencies --skip-fetch-latest-git-deps
export P_ID=0xf5691eef9d563b014b1de86be6d29ee1832857693bf00f5b740652f2ccd55fd1
export RANDOM_ID=0x8

# 现阶段只能在dev环境调用随机数
sui client call --function showrandom --module random_test  --package $P_ID --gas-budget 5000000 --args $RANDOM_ID
