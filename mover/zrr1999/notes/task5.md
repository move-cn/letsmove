# Task 5 - 完成一个 Swap 的上链部署(mainnet)

> 任务
>
> - 完成 Swap 相关知识的学习
>
> - 完成第一个 Swap 合约的上链部署

这个任务相对来讲难度较大，因此记录一下具体操作步骤以便后续查阅。

代码包含了两个初始代币 COIN_A 和 COIN_B，方便测试，以及一个合约。

参考了 [xLog](https://xlog.yuheng.site/letsmove-task5) 

## 代码详解

### 发币
这部分代码与 Task1 相同，以 coin_a 为例讲解

创建模块并导入相关库
```move
module my_swap::coin_a {
    use sui::balance::Supply;
    use sui::balance::{Self};
    use sui::coin::{Self, Coin, TreasuryCap};
    ...
}
```
初始化 coin_a 代币，首先定义一个[见证者](https://intro-zh.sui-book.com/unit-three/lessons/3_witness_design_pattern.html)类（即只使用一次），
然后通过 `create_currency` 函数创建代币，最后将代币的 TreasuryCap（类似管理员权限）对象转给调用者，并将代币元数据冻结。
```move
module my_swap::coin_a {
    ...
    public struct COIN_A has drop {}
    fun init(witness: COIN_A, ctx: &mut TxContext){
        let (treasury_cap, metadata) =
            coin::create_currency<COIN_A>(witness, 8, b"ac", b"ACoin", b"new coin name ac", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }
    ...
}
```
定义一些函数（可以当成特定币的方法），用于铸币和销毁代币，这部分有相应的内置函数可用。
```move
module my_swap::coin_a {
    ...
    public entry fun mint(treasury_cap: &mut TreasuryCap<COIN_A>, amount: u64, recipient: address, ctx: &mut TxContext){
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<COIN_A>, c: Coin<COIN_A>){
        coin::burn(treasury_cap, c);
    }
}
```

### 创建流动性池
此处实现的是一个简单的流动性池，他需要保证池中总价值不变，这里我们用两币之积作为总价值，即 `coin_a * coin_b = k`，这里的 k 是一个常数。

## 发布包

将网络切换至主网，然后发布包

```bash
sui client switch --env mainnet

sui client publish --gas-budget 200000000
```

在得到的交易结果中，找到 `Package ID`，Coin_A 的 `TreasuryCap ID` 和 Coin_B 的 `TreasuryCap ID`，将其导出到环境变量。
同时将自己的钱包地址也导出为变量。

```bash
export PACKAGE_ID=0x8c192a799c90a78480ead888f8e71917de8a0b93cedee625786b05236bf9635d
export COIN_A=$PACKAGE_ID::coin_a::COIN_A
export COIN_B=$PACKAGE_ID::coin_b::COIN_B

export COIN_A_TREASURY_CAP_ID=0x50af367a46a520f3befa25328866d1899f55e24a73e15331892ee97840003cf1
export COIN_B_TREASURY_CAP_ID=0x5ddb8025e1f4112bca2a2067d48bb196eac2ed111c9fdf6aff000cf15840f4d2

export MY_ADDRESS=0x0da178626ee2b7910f827a26491cb28f6ef67d1679e5068d2e2407a54f4008ce
```

## 铸币

提前铸造不同数值的 COIN_A 和 COIN_B，因为仅作测试使用，所以两个代币的 decimals 设置为 3，方便后续识别。

```bash
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module coin_a --function mint --args $COIN_A_TREASURY_CAP_ID 1000 $MY_ADDRESS
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module coin_b --function mint --args $COIN_B_TREASURY_CAP_ID 10000 $MY_ADDRESS
```

将输出记录下来

```bash
# 1 coin A
export COIN_A_ID_1=0xd9a4c080626c8071a5501d4fb9343048944e46a9af3bb27bbee79537706d8f21
export COIN_A_ID_2=
export COIN_A_ID_3=
export COIN_A_ID_4=

# 10 coin B
export COIN_B_ID_1=0x6089a066e069c4c73460f64e570cacfc4e2a8d340e2e48c55edc6cc6c4fa9ffc
export COIN_B_ID_2=
export COIN_B_ID_3=
export COIN_B_ID_4=
```

## 构建流动性池

将前面铸造的 coin a 1 和 coin b 1 拿来构建流动性池

```bash
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module my_swap \
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
