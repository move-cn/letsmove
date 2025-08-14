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

# 10 coin B
export COIN_B_ID_1=0x6089a066e069c4c73460f64e570cacfc4e2a8d340e2e48c55edc6cc6c4fa9ffc
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
export POOL_ID=0x6b9cc814bea554f8ba37fd3ed9ec491d850e9393cc5aa37719de9948e4178b06
export LSP_ID_1=0x5ed06b89f99c567d74f74627ac0977ceeacd9fcf10649bacb3076fcc596b5578
```
