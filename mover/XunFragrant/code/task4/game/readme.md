### 游戏简介

石头剪刀布(抄的)，由单个玩家进行游玩，与之对抗的电脑(被命名为我的GithubID xunfragrant)，使用随机数来生成操作。随机数的来源，使用全局时钟

### 随机数

代码中使用了 `sui::clock::Clock` 时钟，来作为随机数。源码 [`clock.move`](crates/sui-framework/packages/sui-framework/sources/clock.move)，其中关于 Clock 有一段注释。解释了 Clock 是一个单例共享对象，为 Move 的调用提供时间。**该对象的地址为 `0x6`，只能由入口函数独取（通过不可变引用访问）**。

Move 中，对象即地址，也就是说我们在需要传入 Clock 时，直接使用它的地址 `0x6`，就可以传入 Clock 对象。

## 推送和调用

玩法

```bash
# 使用我已经发布好的包
# export PACKAGE_ID=0x4ad24a24af4a614c4b7940908af5cac623347a649b70362ab19deecbc79c09ad 
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module rock_paper_scissors --function play --args 0 0x6
```