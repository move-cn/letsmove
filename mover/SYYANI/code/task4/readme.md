### 游戏简介

“猜数字”游戏，玩家尝试猜测系统随机选择的一个范围内的数字，庄家（当然是我了~）(syyani)，使用随机数来生成操作，引入了MaxNumber用来定义可猜数字的上限（默认设置为 5）。

随机数生成： 调整 get_random_number 来提供从 0 到 MaxNumber 范围内的随机数。

### 随机数

代码中使用了 `sui::clock::Clock` 时钟，来作为随机数,传入 Clock 时，使用它的地址 `0x6`

## 推送和调用

玩法

```bash
# 使用我已经发布好的包
# export PACKAGE_ID=0x33812c5da6adb88ea576342fad119d9162165794508c67d3067286418893dc3c
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module guess_the_number --function play --args 1 0x6
```