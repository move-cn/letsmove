# Task 4 - sui game

## 新建项目
新建项目
```bash
sui move new task4
```

构建、发布
```bash
sui move build
sui client publish --gas-budget=50000000 
```

输出：
```
    packageid： 0xe62d21f41e1beed5bd90c9c87888689f30a72b077f5b72c3fcce4d8022873033
    admin-cap： 0x47c6486b441cb4d666498831725035cd471754a39457692c325f345433e8aa2e
```

## 初始化&玩游戏
```bash
# 初始化，要放点钱进去
sui client call --function initialize --module coin_game --package 0xe62d21f41e1beed5bd90c9c87888689f30a72b077f5b72c3fcce4d8022873033 --args 0x47c6486b441cb4d666498831725035cd471754a39457692c325f345433e8aa2e 0x2c0c46b8b0f66ab49b8cb2e94a65cec54752d10ef1f9b2db89562cf8a909f671 --gas-budget 50000000

# 返回HouseData 0xdcf3f1428900798dca74cb62a99499a03810d1d1ba37f7c8f737400c96f1b5b0

#加钱 
sui client call --function top_up --module coin_game --package 0xe62d21f41e1beed5bd90c9c87888689f30a72b077f5b72c3fcce4d8022873033 --args 0xdcf3f1428900798dca74cb62a99499a03810d1d1ba37f7c8f737400c96f1b5b0 0x82c3d7bef38578ded74b13a90e0f57cfda958bc77e02b43b8b6cd7e80deb2130 --gas-budget 50000000

# 先分出来小coin
sui client split-coin --amounts 200000000 --coin-id 0xa2e819d6f41c3f3725924ab7f127f4ebb4193529bc5b227d9360de3063e04dd8 --gas-budget 50000000

# play
sui client call --function play --module coin_game --package 0xe62d21f41e1beed5bd90c9c87888689f30a72b077f5b72c3fcce4d8022873033 --args 1 0x33a7109320bfa8d6288b280519a5df36842315117b192bce7cc6ca0a46c99198 0xdcf3f1428900798dca74cb62a99499a03810d1d1ba37f7c8f737400c96f1b5b0 0x6 --gas-budget 50000000

# 取回钱，逻辑限制还剩2*STAKE不能取出
sui client call --function withdraw --module coin_game --package 0xe62d21f41e1beed5bd90c9c87888689f30a72b077f5b72c3fcce4d8022873033 --args  0xdcf3f1428900798dca74cb62a99499a03810d1d1ba37f7c8f737400c96f1b5b0 --gas-budget 50000000

```
