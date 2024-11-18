my_coin

第一次测试mint

sui client call --package a424a82be97e2f533f34cac1b4d50da9ef350bbe6eb3695bb659417d1642524b --module my_coin --function mint --args 0x97cbd34fd756bada629b7bf34682678c18c9dedb198408a86d2eb7ad08b797c8 10000000 0xf33549e058c35c7446827c86c17be8fd43604693d43c8e4a531cbb50e91637a4

第二次测试mint
sui client call --package 0x260cf370e2f907c25e21cdf2b285224a88b3b839f74fb3b25fa3e0fb063f14bd --module my_coin --function mint --args 0xc9a2e941f335361349239b4d8ea42d27cba0ac779e9398ac56845f691ce21e18 10000000 0xec9944b43e6286f7f977af5aa7bb87da94c5342bb199628a86418382385b9046
测试 faucet_coin coin mint
sui client call --package 0x260cf370e2f907c25e21cdf2b285224a88b3b839f74fb3b25fa3e0fb063f14bd --module faucet_coin --function mint --args 0x46945e7591ef69ff97c0a1fef5946f0364cd710aa34d1f73fbe02910658f3a7d 10000000

https://rpc-mainnet.suiscan.xyz/

添加主网
sui client new-env --alias mainnet --rpc https://rpc-mainnet.suiscan.xyz:443


sui client publish --skip-dependency-verification



<b>主网my-coin mint</b>

sui client call --package 0x595755e12a700673fd174e05eac9a6e22cfb5d202de027d5830c256bd20d5b3a --module my_coin --function mint --args 0x826bc85263271018c806608117060fe3d3ae7b38890f59aca97da66e7d98767e 10000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
sui client call --package 0x595755e12a700673fd174e05eac9a6e22cfb5d202de027d5830c256bd20d5b3a --module my_coin --function mint --args 0x826bc85263271018c806608117060fe3d3ae7b38890f59aca97da66e7d98767e 10000000 0xec9944b43e6286f7f977af5aa7bb87da94c5342bb199628a86418382385b9046


测试 faucet_coin coin mint
sui client call --package 0x595755e12a700673fd174e05eac9a6e22cfb5d202de027d5830c256bd20d5b3a --module faucet_coin --function mint --args 0xd8f680ec551f59cc55d25db5a2ab4109c5dda459809b1f80eee857c30f681719 100000000

0x75938a798055f27d5d3332b8460befb89c4ba2be9b25affe792f5191ff25f5ed


https://avatars.githubusercontent.com/u/8326809?v=4

sui client publish --skip-dependency-verification