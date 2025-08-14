# 跳过将依赖发布到链上这一步，直接发布,faucet地址必须为0
sui client publish --gas-budget 10000000 --with-unpublished-dependencies 
export PACKAGE_ID=0xe29846de0cdfab2b904fd5ded72cb2b2f3345220e4b303be929b4d1fbe42a0dc

# mint faucetcoin
sui client call --function mint_and_transfer --module coin --package 0x2  --gas-budget 5000000  --args 0xe1943d206402458e75a696957d964d48780434cb6df05619e18b03b81cbc0441 100000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --type-args "0xb8d2ea18ced858954e6a228085f9d33f993ecf5ed5589bcd65fc928cb0a88ed6::FaucetCoin::FAUCETCOIN"

sui client call --function mint_and_transfer --module coin --package 0x2  --gas-budget 5000000  --args 0xe1943d206402458e75a696957d964d48780434cb6df05619e18b03b81cbc0441 100000 0x703f3e285af2ee26679bd14ce9d3f0cc840cb41541757a1e1ccd8d58db863fd2 --type-args "0xb8d2ea18ced858954e6a228085f9d33f993ecf5ed5589bcd65fc928cb0a88ed6::FaucetCoin::FAUCETCOIN"
#add coin
sui client call --function deposit --module flip_coin  --package 0xb862bfc74b3983a05806ec2bb84be2404135c88c22daa0a102e2b6f966685712 --args 0x28885effffb4912574f0886a0b1d99e0f907d28399ceaa858bdfc136b1a5fea2 0x0d4d2f42a4b900eee094af5141559d2d3727422c8fd46eb3487146353e1e0a71 --gas-budget 100000000
sui client call --function withdral --module flip_coin  --package 0xb862bfc74b3983a05806ec2bb84be2404135c88c22daa0a102e2b6f966685712 --args 0x01643a8e587b3ccfc969abd0c1c00bc695205bbc7a0de71dcdbd45d5918a01fa 0x28885effffb4912574f0886a0b1d99e0f907d28399ceaa858bdfc136b1a5fea2 20 --gas-budget 100000000

sui client call --function deposit --module flip_coin  --package 0xb862bfc74b3983a05806ec2bb84be2404135c88c22daa0a102e2b6f966685712 --args 0x28885effffb4912574f0886a0b1d99e0f907d28399ceaa858bdfc136b1a5fea2 0xd575deb372cf1a7603270b380d973cc629994154286440ae5a026c12bf6d78be --gas-budget 100000000



sui client call --function deposit --module flip_coin  --package 0xb862bfc74b3983a05806ec2bb84be2404135c88c22daa0a102e2b6f966685712 --args 0x01643a8e587b3ccfc969abd0c1c00bc695205bbc7a0de71dcdbd45d5918a01fa 0x8570ebe4201627b1906c9bdbc2baac9b8979fba024554c650325700e081f1740 --gas-budget 100000000