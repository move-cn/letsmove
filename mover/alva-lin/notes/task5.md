> [letsmove](https://github.com/move-cn/letsmove)
>
> Let's Move 一项学Move获得SUI的激励计划，鼓励更多的人学习Move语言
>
> 学习日志 ([alva-lin](https://github.com/alva-lin/letsmove))
>
> 本文首发于 [xLog](https://xlog.yuheng.site/letsmove-task5) ，如需转载，请联系作者

# Task 5 - 完成一个 Swap 的上链部署(mainnet)

> 任务
>
> - 完成 Swap 相关知识的学习
>
> - 完成第一个 Swap 合约的上链部署

关于 Swap 的概念，不做过多赘述，本文主要讲解发布包后的操作

本文代码位于 [new_swap](https://github.com/alva-lin/sui-learn/tree/master/src/09_new_swap) 中，可自行下载。

代码包含了两个初始代币 COIN_A 和 COIN_B，方便测试，以及一个 Simple_Swap 合约。

代码参考了 [pool.move - sui program examples](https://github.com/MystenLabs/sui/blob/main/sui_programmability/examples/defi/sources/pool.move)

## 发布包

将网络切换至主网，然后发布包

```bash
sui client switch --env mainnet

sui client publish --gas-budget 200000000
```

在得到的交易结果中，找到 `Package ID`，Coin_A 的 `TreasuryCap ID` 和 Coin_B 的 `TreasuryCap ID`，将其导出到环境变量。
同时将自己的钱包地址也导出为变量。

```bash
export PACKAGE_ID=0xfac346bf4cbd8284cc76e76981abc9b30c0f2398cde2913e7b21ead99d1f6536
export COIN_A=$PACKAGE_ID::coin_a::COIN_A
export COIN_B=$PACKAGE_ID::coin_b::COIN_B

export COIN_A_TREASURY_CAP_ID=0xe5636992dde57ee943689be2b4377711e399a5af28c6572c12b114895769e219
export COIN_B_TREASURY_CAP_ID=0x7e29738f66374d2f15a83fe4e93c1f6c114e6fb75367d34438164f16b2c6376c

export ADDRESS=<your wallet address>
```

## 铸币

提前铸造不同数值的 COIN_A 和 COIN_B，因为仅作测试使用，所以两个代币的 decimals 设置为 3，方便后续识别。

```bash
# mint COIN_A
# 根据需要，可以多次少量铸币，方便后续调用
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module coin_a --function mint --args $COIN_A_TREASURY_CAP_ID 1000 $ADDRESS

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module coin_b --function mint --args $COIN_B_TREASURY_CAP_ID 10000 $ADDRESS
```

将输出记录下来

```bash
# 1 coin A
export COIN_A_ID_1=0x588a71ce52b95ec891e8c7593994ca1b34f85c24ca5791a5f88f43a5cda4dd62
export COIN_A_ID_2=0x969d24aa2d4f193448026c7e579e189702320c05a54f201c96dfdaf4f04a0a6f
export COIN_A_ID_3=0x6e768e76b28d7edda8dbfe37d9f7bcfe370645259cdccf0661164b712e0d1ab8
export COIN_A_ID_4=0x5c8e764c236e1ce80119d13d0b1744fa7df652e3664498bb413af2ab3ba2bf5c

# 10 coin B
export COIN_B_ID_1=0x2d6b2436b534e49edfd235fb9a1f9db393d1f7f2d0bb63199cf7c9d0a4b0ac22
export COIN_B_ID_2=0xb8ac379c3fc2238f5cee0e6a8ad2bfab82c01b841869ee8d4817d499aaf5cb7e
export COIN_B_ID_3=0xcfb9b7dc4488bcd40a242189dbed996b9aa401431fa9824a5756ed1ee822239f
export COIN_B_ID_4=0xbf5d27d4024ba6572aea61a60f16324778a8d2f63b99920e64514be6696d2d38
```

## 构建流动性池

将前面铸造的 coin a 1 和 coin b 1 拿来构建流动性池

```bash
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module simple_swap \
    --function create_pool --type-args $COIN_A $COIN_B \
    --args $COIN_A_ID_1 $COIN_B_ID_1
```

在输出的内容中，找到 `Pool ID` 和发放给我们的 `LSP ID`

```bash
export POOL_ID=0x50cdc0af15ceb8b660d15e843579587699c27c86868dc49e3945e2f73b546118
export LSP_ID_1=0x597a50ce6afacc3d26236ab52aab4342dc258554fe1520412e20675ffd7df9b6
```

我们可以根据 `Pool ID`，在 SuiScan 浏览器中查看流动性池的相关信息

```text
url: https://suiscan.xyz/mainnet/object/0x50cdc0af15ceb8b660d15e843579587699c27c86868dc49e3945e2f73b546118
```

### 添加流动性

将前面铸造的 coin a 2 和 coin b 2 拿来添加流动性

```bash
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module simple_swap \
    --function add_liquidity --type-args $COIN_A $COIN_B \
    --args $POOL_ID $COIN_A_ID_2 $COIN_B_ID_2
```

拿到发放的第二个 LSP 代币

```bash
export LSP_ID_2=0x076230c8207d445f3eb1cf43cd3415304de9721f8ab9940f6127f90a6650ea31
```

同时查看前后两个 LSP 代币的值，都是一样的（3100）

此时我们再次添加等额的流动性

```bash
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module simple_swap \
    --function add_liquidity --type-args $COIN_A $COIN_B \
    --args $POOL_ID $COIN_A_ID_3 $COIN_B_ID_3
```

拿到第三枚 LSP 代币

```bash
export LSP_ID_3=0xe44da8865c2b3cd79a5a28fe98706f91c35b7e719f80b71d39624291320d23e2
```

### 减少流动性

拿出第三枚 LSP 代币，减少流动性，查看运行结果

```bash
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module simple_swap \
    --function remove_liquidity --type-args $COIN_A $COIN_B \
    --args $POOL_ID $LSP_ID_3
```

拿到了等值的 COIN A 代币和 COIN B 代币，将其记录

```bash
# 1 coin A
export COIN_A_ID_5=0x0c0fd563d78f58b8ffa6fa21d4a9b75bb11c53cee468201e4c86632271a7008c

# 10 coin B
export COIN_B_ID_5=0xe1565ef7e7bd4569a589242b4393235ba877f488f1ca00231688c8119050d62a
```

## Swap

此时流动性池子内的代币数量如下

- Coin A: 2

- Coin B: 20

Coin A : Coin B = 1:10

### 使用 Coin A 交易 Coin B

拿出第四枚代币 Coin A，向流动性池子发起交易

```bash
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module simple_swap \
    --function swap_a_to_b --type-args $COIN_A $COIN_B \
    --args $POOL_ID $COIN_A_ID_4
```

可以看到交易结果，我们使用 1 个 Coin A，购买到了 10.015 个 Coin B。将其记录

```bash
# 10.015 coin B
export COIN_B_ID_6=0xdccf55457cf82b6b8a14f6627002fc83a4c4456ccfa1ca16bf8164ea7b3e9db7
```

而回到流动性池的信息中，还剩下 3 个 Coin A，和 9.985 个 Coin B。

### 使用 Coin B 交易 Coin A

拿出第四枚代币 Coin B，向流动性池子发起交易

```bash
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module simple_swap \
    --function swap_b_to_a --type-args $COIN_A $COIN_B \
    --args $POOL_ID $COIN_B_ID_4
```

可以看到交易结果，我们使用 10 个 Coin B，购买到了 1.503 个 Coin A。将其记录

```bash
# 1.503 coin A
export COIN_A_ID_6=0x33ab32733faaa4a8985ccba27692fbf466d54ee854ef919d1d5ae52b444a23dc
```

而回到流动性池的信息中，还剩下 1.497 个 Coin A，和 19.985 个 Coin B。

---

## 统计结果

最开始，钱包和池内的代币资金都是 2 Coin A, 20 Coin B。

经过两次交易，钱包和流动性池内的资金变化如下

| 代币数量 | Coin A | Coin B |
|:---------|:-------|:-------|
| Wallet   | 2.503  | 20.015 |
| Pool     | 1.497  | 19.985 |

两个代币的比例从 1:10 变为 1:13.35，Coin A 相对升值，Coin B 相对贬值。

代币价值上，钱包的代币价值是 4 CoinA（或是 40 Coin B）

| 代币价值 | Coin A 视角 | Coin B 视角 |
|:---------|:------------|:------------|
| Wallet   | 3.993       | 53.43       |

代币价值变化也符合代币涨跌。
