# 构建
sui move build --skip-fetch-latest-git-deps

# 发布
sui client publish  --skip-dependency-verification --skip-fetch-latest-git-deps

# 切网
sui client switch --env mainnet

# 切用户
sui client switch --address 0xfffee58fd4622957d1f4d2582ba3b2d36d43ab89029f10e352ac2974c561b5f9

## mint coin1
sui client call --gas-budget=100000000 \
--package=0x6ff12a5759a7507a0cf48378868c92dce4c4de4c25f11213858212f497b9ddec \
--module=chenerge --function=mint \
--args 0xb2b2cbc6698c2124d3be506734bf36582f846361a548e6ae325bbce6d67353bd  1000000000 0xfffee58fd4622957d1f4d2582ba3b2d36d43ab89029f10e352ac2974c561b5f9




## mint coin2
sui client call --gas-budget=100000000 \
--package=0x6ff12a5759a7507a0cf48378868c92dce4c4de4c25f11213858212f497b9ddec \
--module=chenerge_faucet --function=mint \
--args 0x8872654908f969de8e837ae8b8aea3593120626868a63b65b9308e5eb802c0d6  5000000000


# deposit
sui client call --gas-budget=100000000 \
--package=0xc75e52a7d2aa9853e4ec40a780722aaa82a028ea8f76fa73da86de7d835add5e \
--module=swap --function=deposit_a \
--args 0x3a74e5f42438fdbc63dafd247d56ec0169d6088032283fd3cd437eef756677b0 0xce5dc90fb7fa3da4100132b2f4031689a11a5e382f61329dd3e6e16c027ab7a5

sui client call --gas-budget=100000000 \
--package=0xc75e52a7d2aa9853e4ec40a780722aaa82a028ea8f76fa73da86de7d835add5e \
--module=swap --function=deposit_b \
--args 0x3a74e5f42438fdbc63dafd247d56ec0169d6088032283fd3cd437eef756677b0 0x653795421aa32e8440d33ae610b0e8a91a1c6598c8834c6b134814c161ac49f5


# swap
sui client call --gas-budget=100000000 \
--package=0xc75e52a7d2aa9853e4ec40a780722aaa82a028ea8f76fa73da86de7d835add5e \
--module=swap --function=swap_a_2_b \
--args 0x3a74e5f42438fdbc63dafd247d56ec0169d6088032283fd3cd437eef756677b0 0xe959521aecfe0544df865b5b10ee8e955a0ffbf5b780e3a03b276d9f519dedb4  
