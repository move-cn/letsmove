# Task 5 - swap

### 构建、发布
```bash
sui client publish --gas-budget=20000000 

#得到packageid: 0x5590c33d3b60718d91573a1d8a5a884b92e7d8ae24c81231db0c07bc6059372a
# admin cap: 0xfb6b2b28da79e4a6f6d2ab1a3e373eff55e701ee0bc8a9f6221ec6794c5fde21

# 初始化
sui client call --function initialize --module myswap --package 0x5590c33d3b60718d91573a1d8a5a884b92e7d8ae24c81231db0c07bc6059372a --args 0xfb6b2b28da79e4a6f6d2ab1a3e373eff55e701ee0bc8a9f6221ec6794c5fde21 --type-args 0x189be9e86a73d110e64d5fea827ab09599ab840ee04d417116f176fefc04f717::mycoin::MYCOIN --gas-budget 50000000
# 得到錢包地址 0xa5a0540c211d1ea17d451c1d4e24334fee5136594af729c221f15be5556f7a36

# 造点钱
sui client call --function mint --module mycoin --package 0x189be9e86a73d110e64d5fea827ab09599ab840ee04d417116f176fefc04f717 --args 0xbbb29d182cd7fc028d4a73f90d4740fcb584a834f3b03e5d53d27508f11a5a4d 10000000000000000 0x4970bab85a4fc98770f0d765793b9589cc68de321886ca9afe5add5c6dc3cc30 --gas-budget 50000000
# 得到 coin

# 放点钱进去
sui client call --function addFaucet --module myswap --package 0x5590c33d3b60718d91573a1d8a5a884b92e7d8ae24c81231db0c07bc6059372a --args 0xa5a0540c211d1ea17d451c1d4e24334fee5136594af729c221f15be5556f7a36 0xc15818b6c584e3611aa12c07894edaf0d399669ca1060856f289fddbdf2bdf38 --type-args 0x189be9e86a73d110e64d5fea827ab09599ab840ee04d417116f176fefc04f717::mycoin::MYCOIN --gas-budget 50000000

# 用sui去换点假钱
sui client call --function swapFaucet --module myswap --package 0x5590c33d3b60718d91573a1d8a5a884b92e7d8ae24c81231db0c07bc6059372a --args 0xa5a0540c211d1ea17d451c1d4e24334fee5136594af729c221f15be5556f7a36 0x705af434ac4872db4cd59dab72c005cd752ce992c0cb6619c0817adbec107bc1 --type-args 0x189be9e86a73d110e64d5fea827ab09599ab840ee04d417116f176fefc04f717::mycoin::MYCOIN --gas-budget 50000000

# 取出来咱们赚到的sui
sui client call --function withdraw --module myswap --package 0x5590c33d3b60718d91573a1d8a5a884b92e7d8ae24c81231db0c07bc6059372a --args 0xfb6b2b28da79e4a6f6d2ab1a3e373eff55e701ee0bc8a9f6221ec6794c5fde21 0xa5a0540c211d1ea17d451c1d4e24334fee5136594af729c221f15be5556f7a36 --type-args 0x189be9e86a73d110e64d5fea827ab09599ab840ee04d417116f176fefc04f717::mycoin::MYCOIN --gas-budget 50000000


```