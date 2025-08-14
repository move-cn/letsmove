# Task 5 - coin swap

## 新建项目
新建项目
```bash
sui move new task5
```

添加&修改依赖：
- 修改task2的move.toml，添加publish-at，修改task2包的地址，当前环境发布的地址，这里是0xd4f5cb5f4fafff5910e5fcd3f3d9184c0f6ac96837b521f3e3df32bab2cf8405
- 在task5的move.toml，添加对task2的依赖，分别在dependenct节点添加task2 = { local = "../task2" }，在address节点添加 task2 = "0xd4f5cb5f4fafff5910e5fcd3f3d9184c0f6ac96837b521f3e3df32bab2cf8405"


构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```

输出：packageid： 0xecaa749032f5d9da13578c71f8a0fde59be1bd588ab9863b61b9bff833e29183
admin-cap： 0xd906afbc07fcae262c13ccde250988b476cc274419e94b93fa7e9ad1438e440b


## 初始化&swap
```bash
# 查看余额，带coinid的
sui client balance --with-coins

# 找到其中一个coin放进去，要找对包id（示例是0xd4f5cb5f4fafff5910e5fcd3f3d9184c0f6ac96837b521f3e3df32bab2cf8405）
# 或者去 https://suiscan.xyz/testnet/account/0x95713e6f17aec080bb71cc7b99441612367e446d561e8c50cba3f6879b1e1843 这里找
# FAUCETCoin 0xe7ffe1a9d7a77b7f7a5b0375fcfbcd32db56ed5bb79fb273b0c6abdb03c7002a
# MYCoin 0xaaefb9a3dbfe5eceed0de0bd979e158eaa3f1a0bfae31258e8c1a415da5c6301

# 初始化，要放点钱进去
sui client call --function initialize --module myswap --package 0xecaa749032f5d9da13578c71f8a0fde59be1bd588ab9863b61b9bff833e29183 --args 0xd906afbc07fcae262c13ccde250988b476cc274419e94b93fa7e9ad1438e440b 0xaaefb9a3dbfe5eceed0de0bd979e158eaa3f1a0bfae31258e8c1a415da5c6301 0xe7ffe1a9d7a77b7f7a5b0375fcfbcd32db56ed5bb79fb273b0c6abdb03c7002a --gas-budget 50000000

# 返回WalletID 0xb5e9cf4aaf8e3ff14bb9cea72912242b4849f45efd1166735b6aebf345f3dd0e


# 换零钱
sui client split-coin --amounts 10000 --coin-id 0x2fc4ad2f8fc8acf5ad885d69b6360d35d46d8ae231404d72b86bf3ddc56db0b1 --gas-budget 50000000

#swapForB 
sui client call --function swapForB --module myswap --package 0xecaa749032f5d9da13578c71f8a0fde59be1bd588ab9863b61b9bff833e29183 --args 0x2ae543962d85cfecebd82c21e05831941590253e1baadaa365bc10486c2347f1 0xb5e9cf4aaf8e3ff14bb9cea72912242b4849f45efd1166735b6aebf345f3dd0e --gas-budget 50000000

```
最后得到交易hash： AZApkbsMaGjbi76AvUXo3WqquniLW7SXxKHBaDZMnoaK
