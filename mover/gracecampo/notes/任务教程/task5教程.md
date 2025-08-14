# MOVE共学营TASK5教程
🧑‍💻作者：gracecampo

## 实现一个最简单的swap

- 上链网络: 主网(mainnet)

### 需求

- 完成 swap相关知识的学习
- 完成第一个Swap合约的上链部署
- swap 必须是 swap 自己发行的 task2 两个 Coin的互换，包名必须是自己的`github id`

## 前置工作
### swap是什么？
区块链swap合约是一种基于智能合约的去中心化金融（DeFi）应用，允许用户在不同的加密货币之间进行自动化的、无需信任的交易。
主要依赖于区块链技术的去中心化特性和智能合约的自动化执行能力。
在swap合约中，智能合约充当了交易中介的角色，负责接收用户的资金并按照预定的规则进行资产交换。
swap合约的去中心化特性确保了交易的安全性和透明性。与传统的金融交易不同，swap合约不依赖于任何中心化的中介机构，如银行或交易所。
相反，它通过区块链网络进行交易，所有参与者的交易记录都是公开的，并且无法篡改。
在swap合约的工作流程中，用户首先需要将资金存入合约流动性池。智能合约会锁定这些资金。
当用户需要兑换另一种资产时，会根据当前的比例计算出用户可以兑换的另一种资产的数量。 
一旦用户确认交易，智能合约会自动执行兑换操作， 并将新的资产发送到用户的账户。整个过程无需人工干预，极大地提高了交易的效率和便捷性。
### 具体如何实现？
市面上常见的swap合约的实现主要依赖于以下几个关键技术组件和机制：

自动化市场做市商（AMM）：Uniswap的核心是其自动化市场做市商模型，这是一种去中心化的交易机制，不需要传统的买卖双方。

流动性池：流动性是通过流动性池来提供的。流动性池是由两种代币组成的资金池，任何人都可以通过向池中添加等值的两种代币来成为流动性提供者。

恒定乘积公式：使用恒定乘积公式来维持代币之间的汇率稳定。这个公式是x * y = k，其中x和y分别代表两种代币的数量，k是一个常数。
            当交易发生时，系统会自动调整代币的数量以保持k值不变。
## 代码实现
### 异常码定义
定义异常码（或中止码）的意义在于提高代码的可读性和可维护性。当事务中止时，返回的异常码可以帮助开发者和用户理解中止的原因。
定义异常码的好处：
可读性：使用描述性的异常码常量可以让代码更易于理解。例如，ENoAccess 比直接使用数字 0 更能表达其含义。
可维护性：当代码需要更新或调试时，使用异常码常量可以更容易地找到和修改相关的中止条件。
错误处理：通过不同的异常码，调用者可以根据不同的中止原因提供更有意义的错误信息。

在swap合约实现中，我们定义如下异常码，用于对代码执行过程中的异常码常量，进行错误提示
```sui move
    /// 金额为0时
    const ErrZeroAmount: u64 = 1001;
    ///错误的类型
    const ErrInvalidVecotrType: u64 = 1002;
    ///输入的金额小于0
    const ErrBalanceNotMatch :u64 = 1003;
    ///池子中无足够X代币余额供取出
    const ErrNotEnoughXInPool :u64 = 1004;
    ///池子中无足够Y代币余额供取出
    const ErrNotEnoughYInPool :u64 = 1005;
    ///用户地址无足够数量X/Y代币以供存入
    const ErrNotEnoughBalance :u64 = 1006;
```
### 结构体定义
#### LP凭证结构体定义
要实现一个成功的 swap 交易，我们需要精心地定义 LP 凭证以及流动性池。

LP 凭证在整个过程中扮演着关键角色，它主要用于储存存入的流动性信息。

而流动性池则是至关重要的组成部分，其主要用途是高效地储存兑换池子中的币种信息，这涵盖了币种的类型、数量、以及LP凭证的信息。

在 Move 中，`phantom` 类型参数用于定义一个类型参数，该参数不会在结构体的字段或方法中实际使用。它主要用于类型区分和约束，而不是存储或操作数据。

`LP<phantom X, phantom Y>` 是一个具有两个 `phantom` 类型参数 `X` 和 `Y` 的结构体。这些类型参数不会在结构体的字段中使用，但可以用于类型区分或施加某些约束。

```move
public struct LP<phantom X, phantom Y> has drop {}
```
关键点：
- **Phantom 类型参数**：`X` 和 `Y` 是 `phantom` 类型参数，这意味着它们不会在结构体的字段中使用。

- **`has drop` 能力**：结构体具有 `drop` 能力，这意味着它的实例可以被忽略或丢弃。

#### 流动性池结构体定义
`Pool<phantom X, phantom Y>` 是一个流动性池的结构体，用于管理两种不同资产的余额和流动性提供者（LP）代币的供应。
```move
/// 流动性池子结构体
public struct Pool<phantom X, phantom Y> has key, store {
    id: UID,
    coin_x: Balance<X>,
    coin_y: Balance<Y>,
    lp_supply: Supply<LP<X, Y>>
}
```
结构体字段说明：
- **`id: UID`**: 唯一标识符，用于标识这个流动性池。
- **`coin_x: Balance<X>`**: 资产 `X` 的余额。
- **`coin_y: Balance<Y>`**: 资产 `Y` 的余额。
- **`lp_supply: Supply<LP<X, Y>>`**: 流动性提供者代币的供应量，用于跟踪池中流动性提供者的份额。

关键点：
- **Phantom 类型参数**：`X` 和 `Y` 是 `phantom` 类型参数，表示池中支持的两种资产类型。
- **`has key, store` 能力**：结构体具有 `key` 和 `store` 能力，表示它可以存储在链上，并且可以通过唯一标识符进行访问。

### 函数定义
#### 创建流动性池
```sui move
    ///创建流动性池子
    public entry fun new_pool<X,Y>(ctx: &mut TxContext){
        let pool = Pool<X,Y>{
            id:object::new(ctx),
            coin_x: balance::zero<X>(),
            coin_y: balance::zero<Y>(),
            lp_supply: balance::create_supply(LP{})
        };
        share_object(pool);
    }
```
`new_pool<X, Y>` 函数用于创建一个新的流动性池。以下是代码的详细说明：
函数说明：
- **`new_pool<X, Y>`**: 这是一个泛型函数，用于创建一个新的流动性池，支持两种资产 `X` 和 `Y`。
- **`ctx: &mut TxContext`**: 交易上下文，用于跟踪交易的状态和执行环境。
结构体字段初始化：
- **`id: object::new(ctx)`**: 创建一个新的唯一标识符 `UID`，用于标识这个流动性池。
- **`coin_x: balance::zero<X>()`**: 初始化资产 `X` 的余额为零。
- **`coin_y: balance::zero<Y>()`**: 初始化资产 `Y` 的余额为零。
- **`lp_supply: balance::create_supply(LP{})`**: 创建一个新的流动性提供者代币供应。
关键点：

- **共享对象**：使用 `share_object(pool)` 将创建的流动性池对象共享，使其可以被其他交易访问。

#### 添加流动性
```sui move
    ///添加流动性
    public fun add_liquidity<X,Y>(pool: &mut Pool<X, Y>,
                                  coin_x:Coin<X>,
                                  coin_y:Coin<Y>,
                                  ctx: &mut TxContext): Coin<LP<X, Y>>{
        //获取输入的X代币数量
        let coin_x_value = coin_x.value();
        //获取输入的Y代币数量
        let coin_y_value = coin_y.value();
        //判断输入的代币是否为0，需要满足X,Y的代币都大于0
        assert!(coin_x_value > 0 && coin_y_value > 0, ErrZeroAmount);
        //更新流动性池子中X,Y代币的余额
        coin::put(&mut pool.coin_x,coin_x);
        coin::put(&mut pool.coin_y,coin_y);
        //更新lp对象的值
        let lp_bal = pool.lp_supply.increase_supply(coin_x_value+coin_y_value);
        coin::from_balance(lp_bal, ctx)
    }
```

`add_liquidity<X, Y>` 函数用于向流动性池中添加流动性。以下是代码的详细说明：
函数说明：
- **`add_liquidity<X, Y>`**: 这是一个泛型函数，用于向指定的流动性池中添加流动性。
- **`pool: &mut Pool<X, Y>`**: 可变引用，指向要添加流动性的流动性池。
- **`coin_x: Coin<X>` 和 `coin_y: Coin<Y>`**: 要添加到池中的两种资产。
- **`ctx: &mut TxContext`**: 交易上下文，用于跟踪交易的状态和执行环境。
- 
逻辑步骤：
1. **获取代币数量**：使用 `coin_x.value()` 和 `coin_y.value()` 获取输入的 X 和 Y 代币数量。
2. **检查代币数量**：使用 `assert!` 确保输入的代币数量都大于 0。
3. **更新池余额**：使用 `coin::put` 更新池中 X 和 Y 代币的余额。
4. **更新 LP 代币供应**：通过增加供应量来更新流动性提供者代币的值。
5. **返回 LP 代币**：使用 `coin::from_balance` 创建并返回新的流动性提供者代币。

coin::value 函数用于获取 Coin<T> 的数值：
```sui move
public fun value<T>(coin: &Coin<T>): u64
```
coin::put 函数用于将一个 Coin<T> 对象的数值增加到另一个 Coin<T> 对象中
```sui move
public fun put<T>(coin: &mut Coin<T>, amount: u64)
```
balance::increase_supply 函数用于增加供应量并创建一个新的 Balance<T> 对象
```sui move
public fun increase_supply<T>(self: &mut balance::Supply<T>, value: u64): balance::Balance<T>
```
coin::from_balance 函数用于从一个 Balance<T> 对象创建一个新的 Coin<T> 对象
```sui move
public fun from_balance<T>(balance: balance::Balance<T>): coin::Coin<T>
```
#### 供用户调用的存入流动性函数
```sui move
public entry fun  deposit_liquidity<X,Y>(pool: &mut Pool<X, Y>,
                                             coin_x:&mut Coin<X>,
                                             coin_y:&mut Coin<Y>,
                                             coin_x_amt: u64,
                                             coin_y_amt: u64,
                                             ctx: &mut TxContext){
        //获取调用地址X代币余额
        let  coin_x_balance = coin::balance(coin_x).value();
        //获取调用地址Y代币余额
        let  coin_y_balance = coin::balance(coin_y).value();
        //判断用户输入代币数量是否小于等于地址拥有数量
        assert!(coin_x_balance >= coin_x_amt && coin_y_balance >= coin_y_amt,ErrNotEnoughBalance);
        //调用存入流动性函数
        let coin_x_in = coin_x.split(coin_x_amt, ctx);
        let coin_y_in = coin_y.split(coin_y_amt, ctx);
        let (lp) = add_liquidity(pool,coin_x_in,coin_y_in,ctx);
        //将lp发送给调用者
        transfer::public_transfer(lp, sender(ctx))
    }
```

 `deposit_liquidity` 函数是一个用于在流动性池中存入流动性的入口函数。它的作用是将用户指定数量的两种代币（`X` 和 `Y`）存入一个流动性池中，并返回相应的流动性凭证（`lp`）给用户。以下是该函数的详细描述：
1. **参数说明**：
    - `pool`: 这是一个可变引用，指向流动性池对象。
    - `coin_x`: 这是一个可变引用，指向用户持有的 `X` 类型代币。
    - `coin_y`: 这是一个可变引用，指向用户持有的 `Y` 类型代币。
    - `coin_x_amt`: 用户希望存入的 `X` 类型代币的数量。
    - `coin_y_amt`: 用户希望存入的 `Y` 类型代币的数量。
    - `ctx`: 交易上下文，用于处理交易相关信息。

2. **功能描述**：
    - 首先，获取调用者账户中 `X` 和 `Y` 类型代币的余额。
    - 检查用户输入的代币数量是否小于等于其账户中持有的代币数量。如果不足，则抛出 `ErrNotEnoughBalance` 错误。
    - 使用 `split` 方法从用户的代币中分离出指定数量的 `X` 和 `Y` 代币。
    - 调用 `add_liquidity` 函数，将分离出的代币存入流动性池，并获取流动性凭证（`lp`）。
    - 最后，将流动性凭证通过 `public_transfer` 函数发送给调用者。

这个函数确保用户在存入流动性之前拥有足够的代币，并在成功存入后将流动性凭证返还给用户。

coin::balance 是一个函数，用于获取某个 Coin 对象的余额
```sui move
public fun balance<T>(coin: &coin::Coin<T>): &balance::Balance<T>
```
coin::split 函数用于将一个 Coin 对象分成两部分。指定的 split_amount 将从原始 Coin 中分离出来，剩余的余额将保留在原始 Coin 中
```sui move
public fun split<T>(self: &mut coin::Coin<T>, split_amount: u64, ctx: &mut tx_context::TxContext): coin::Coin<T>
```
#### X兑换Y
```sui move
    public entry fun swap_x_to_y<X, Y>(pool: &mut Pool<X, Y>,
                                       coin_x: &mut Coin<X>,
                                       amount: u64,
                                       ctx: &mut TxContext){
        //判断池中是否有足量的代币以供兑换
        assert!(amount < pool.coin_y.value(), ErrNotEnoughYInPool);
        //减去兑换地址X代币的数量
        let x_value = coin_x.split(amount,ctx);
        //将代币数量添加到pool
        coin::put(&mut pool.coin_x, x_value);
        //减去兑换Y代币数量
        let receive_y =  coin::take(&mut pool.coin_y, amount, ctx);
        public_transfer(receive_y,sender(ctx));
    }
```
这个函数 `swap_x_to_y` 用于在一个流动性池中将 `X` 类型的代币兑换为 `Y` 类型的代币。以下是对该函数的逐步解释：
参数：
- `pool`: 一个可变引用，指向包含 `X` 和 `Y` 类型代币的流动性池。
- `coin_x`: 一个可变引用，指向用户持有的 `X` 类型代币。
- `amount`: 用户希望兑换的 `X` 类型代币的数量。
- `ctx`: 交易上下文，用于管理交易相关的信息。

逻辑步骤：
1. **检查池中是否有足够的 `Y` 代币**：
    - 使用 `assert!` 语句检查池中 `Y` 代币的数量是否足够进行兑换。如果不够，则抛出错误 `ErrNotEnoughYInPool`。

2. **从用户的 `X` 代币中扣除兑换数量**：
    - 使用 `coin_x.split(amount, ctx)` 从用户的 `X` 代币中分离出 `amount` 数量。

3. **将 `X` 代币添加到池中**：
    - 使用 `coin::put(&mut pool.coin_x, x_value)` 将分离出的 `X` 代币数量添加到池中。

4. **从池中扣除 `Y` 代币数量**：
    - 使用 `coin::take(&mut pool.coin_y, amount, ctx)` 从池中扣除等量的 `Y` 代币。

5. **将 `Y` 代币转移给用户**：
    - 使用 `public_transfer(receive_y, sender(ctx))` 将扣除的 `Y` 代币转移给交易的发送者。

这个函数实现了一个简单的代币兑换逻辑，确保在执行兑换时，流动性池中有足够的代币供用户兑换。

#### B兑换A
```sui move
    ///交换Y代币到X代币：因代币数量是1:1 ,就无须计算代币兑换比例
    public entry fun swap_y_to_x<X, Y>(pool: &mut Pool<X, Y>,
                                       coin_y: &mut Coin<Y>,
                                       amount: u64,
                                       ctx: &mut TxContext){
        assert!(amount < pool.coin_x.value(), ErrNotEnoughYInPool);
        //池中减去兑换地址Y代币的数量
        let y_value = coin_y.split(amount,ctx);
        //将代币数量添加到pool
        coin::put(&mut pool.coin_y, y_value);
        //池中减去兑换X代币数量
        let receive_x = coin::take(&mut pool.coin_x, amount, ctx);
        public_transfer(receive_x,sender(ctx));
    }
```

这个函数 `swap_y_to_x` 用于在一个流动性池中将 `Y` 类型的代币兑换为 `X` 类型的代币。由于代币的兑换比例是 1:1，因此不需要计算兑换比例。以下是对该函数的逐步解释：
参数：
- `pool`: 一个可变引用，指向包含 `X` 和 `Y` 类型代币的流动性池。
- `coin_y`: 一个可变引用，指向用户持有的 `Y` 类型代币。
- `amount`: 用户希望兑换的 `Y` 类型代币的数量。
- `ctx`: 交易上下文，用于管理交易相关的信息。

逻辑步骤：
1. **检查池中是否有足够的 `X` 代币**：
    - 使用 `assert!` 语句检查池中 `X` 代币的数量是否足够进行兑换。如果不够，则抛出错误 `ErrNotEnoughYInPool`。

2. **从用户的 `Y` 代币中扣除兑换数量**：
    - 使用 `coin_y.split(amount, ctx)` 从用户的 `Y` 代币中分离出 `amount` 数量。

3. **将 `Y` 代币添加到池中**：
    - 使用 `coin::put(&mut pool.coin_y, y_value)` 将分离出的 `Y` 代币数量添加到池中。

4. **从池中扣除 `X` 代币数量**：
    - 使用 `coin::take(&mut pool.coin_x, amount, ctx)` 从池中扣除等量的 `X` 代币。

5. **将 `X` 代币转移给用户**：
    - 使用 `public_transfer(receive_x, sender(ctx))` 将扣除的 `X` 代币转移给交易的发送者。

这个函数实现了一个简单的代币兑换逻辑，确保在执行兑换时，流动性池中有足够的代币供用户兑换。由于兑换比例是 1:1，函数中没有涉及复杂的比例计算。

#### 移除流动性
##### 移除流动性入口函数
```sui move
    //供用户调用的移除流动性函数
    public entry fun  withdraw_liquidity<X,Y>(pool: &mut Pool<X, Y>,
                                              lp: &mut Coin<LP<X, Y>>,
                                              ctx: &mut TxContext){
        //获取流动池LP总供应
        let lp_supply = balance::supply_value(&pool.lp_supply);
        //计算用户输入的LP所占LP总供应份额
        let proportion = (lp.value() * PRODUCT_FACTOR)/lp_supply;
        //计算 X/Y 应提取数量
        let x_out = (pool.coin_x.value() * proportion) / PRODUCT_FACTOR;
        let y_out = (pool.coin_y.value() * proportion) / PRODUCT_FACTOR;
        //组装一个集合,元素为X,Y代币提出的数量
        let mut vec = vector::empty<u64>();
        vector::push_back(&mut vec,x_out);
        vector::push_back(&mut vec,y_out);
        let (coin_x,coin_y) = remove_liquidity(pool,lp,vec,ctx);
        //转移提出的代币数量发送到调用者
        public_transfer(coin_x,sender(ctx));
        public_transfer(coin_y,sender(ctx));
    }
```
`withdraw_liquidity` 是一个公开的入口函数，允许用户从流动性池中移除他们的全部流动性。以下是对该函数的逐步解释：
参数：
- `pool`: 一个可变引用，指向包含 `X` 和 `Y` 类型代币的流动性池。
- `lp`: 一个可变引用，指向用户持有的 LP 代币。
- `ctx`: 交易上下文，用于管理交易相关的信息。

逻辑步骤：
1. **获取流动池的 LP 总供应**：
    - 使用 `balance::supply_value(&pool.lp_supply)` 获取流动池中 LP 代币的总供应量。

2. **计算用户 LP 代币所占的比例**：
    - 计算用户持有的 LP 代币相对于总供应量的比例，使用 `proportion = (lp.value() * PRODUCT_FACTOR) / lp_supply`。这里 `PRODUCT_FACTOR` 是一个常量，用于精确计算比例。

3. **计算应提取的 `X` 和 `Y` 代币数量**：
    - 根据用户持有的 LP 代币比例，计算应提取的 `X` 和 `Y` 代币数量：
        - `x_out = (pool.coin_x.value() * proportion) / PRODUCT_FACTOR`
        - `y_out = (pool.coin_y.value() * proportion) / PRODUCT_FACTOR`

4. **组装一个集合，包含 `X` 和 `Y` 代币的提取数量**：
    - 创建一个空的向量 `vec`，并将 `x_out` 和 `y_out` 添加到向量中。

5. **调用 `remove_liquidity` 函数**：
    - 使用 `remove_liquidity(pool, lp, vec, ctx)` 函数从池中移除流动性，并获取提取的 `X` 和 `Y` 代币。

6. **转移提取的代币给调用者**：
    - 使用 `public_transfer(coin_x, sender(ctx))` 和 `public_transfer(coin_y, sender(ctx))` 将提取的 `X` 和 `Y` 代币转移给交易的发送者。

这个函数实现了从流动性池中移除用户全部流动性的逻辑，确保用户根据其持有的 LP 代币比例获取相应的 `X` 和 `Y` 代币，并将这些代币转移给用户。
##### 移除流动性具体实现
```sui move
    ///此函数主用于，验证移除流动性的正确性，以及返回应转移给调用者的代币数量
    public fun remove_liquidity<X,Y>(pool: &mut Pool<X, Y>,
                                     lp: &mut Coin<LP<X, Y>>,
                                     vec: vector<u64>,
                                     ctx: &mut TxContext): (Coin<X>, Coin<Y>) {
        assert!(vector::length(&vec)==2,ErrInvalidVecotrType);
        //LP的值
        let lp_balance_value = lp.value();
        //取出X代币的值
        let coin_x_out = vec[0];
        //取出Y代币的值
        let coin_y_out = vec[1];
        //判断池子中代币余额是否满足取出值
        assert!(lp_balance_value == coin_x_out + coin_y_out, ErrBalanceNotMatch);
        assert!(pool.coin_x.value() >= coin_x_out, ErrNotEnoughXInPool);
        assert!(pool.coin_y.value() >= coin_y_out, ErrNotEnoughYInPool);
        //销毁lp取出的供应量
        let lp_split = lp.split( coin_x_out + coin_y_out,ctx);
        pool.lp_supply.decrease_supply(coin::into_balance(lp_split));
        //组装返回值，包含应转移给调用者X,Y代币的数量
        (
            //从池中提取移除数量的X代币
            coin::take(&mut pool.coin_x, coin_x_out, ctx),
            //从池中提取移除数量的Y代币
            coin::take(&mut pool.coin_y, coin_y_out, ctx)
        )
    }
```
`remove_liquidity` 用于从一个流动性池中移除流动性。它接受流动性提供者的代币（LP 代币）并返回相应的 `X` 和 `Y` 类型的代币。以下是对该函数的逐步解释：
参数：
- `pool`: 一个可变引用，指向包含 `X` 和 `Y` 类型代币的流动性池。
- `lp`: 一个可变引用，指向流动性提供者持有的 LP 代币。
- `vec`: 一个向量，包含用户希望移除的 `X` 和 `Y` 代币的数量。
- `ctx`: 交易上下文，用于管理交易相关的信息。
逻辑步骤：
1. **验证向量长度**：
    - 使用 `assert!` 语句检查 `vec` 的长度是否为 2。如果不是，则抛出错误 `ErrInvalidVecotrType`。

2. **获取 LP 代币的值**：
    - 使用 `lp.value()` 获取 LP 代币的总值。

3. **从向量中提取 `X` 和 `Y` 代币的值**：
    - `coin_x_out` 和 `coin_y_out` 分别从 `vec` 中提取 `X` 和 `Y` 代币的数量。

4. **检查池中代币余额是否满足取出值**：
    - 使用 `assert!` 语句检查 LP 代币的总值是否等于 `coin_x_out` 和 `coin_y_out` 的和。如果不等，则抛出错误 `ErrBalanceNotMatch`。
    - 检查池中 `X` 和 `Y` 代币的余额是否足够。如果不足，则分别抛出错误 `ErrNotEnoughXInPool` 和 `ErrNotEnoughYInPool`。

5. **销毁 LP 代币**：
    - 使用 `lp.split(coin_x_out + coin_y_out, ctx)` 分离出需要销毁的 LP 代币数量。
    - 使用 `pool.lp_supply.decrease_supply(coin::into_balance(lp_split))` 减少池中的 LP 供应量。

6. **返回 `X` 和 `Y` 代币**：
    - 从池中提取移除数量的 `X` 和 `Y` 代币，并将它们作为返回值。

这个函数实现了从流动性池中移除流动性的逻辑，确保在移除流动性时，池中有足够的代币供用户取出，并更新池中的 LP 供应量。
最后附上合约源码，方便大家整体理解：
```sui move
module gracecampo::gracecampo {
    use std::vector;
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};
    use sui::transfer::{share_object, public_transfer};
    use sui::tx_context::sender;


    /// 金额为0
    const ErrZeroAmount: u64 = 1001;
    ///错误的类型
    const ErrInvalidVecotrType: u64 = 1002;
    ///输入的金额小于0
    const ErrBalanceNotMatch :u64 = 1003;
    ///池子中无足够X代币余额供取出
    const ErrNotEnoughXInPool :u64 = 1004;
    ///池子中无足够Y代币余额供取出
    const ErrNotEnoughYInPool :u64 = 1005;

    ///用户地址无足够数量X/Y代币以供存入
    const ErrNotEnoughBalance :u64 = 1006;
    ///乘积因子
    const PRODUCT_FACTOR :u64 = 10000000;

    ///LP结构体：类型是<phantom X, phantom Y> 拥有drop能力
    public struct LP<phantom X, phantom Y> has drop {
    }

    ///流动性池子结构体
    public struct Pool<phantom X,phantom Y> has key,store{
        id: UID,
        coin_x: Balance<X>,
        coin_y: Balance<Y>,
        lp_supply: Supply<LP<X, Y>>
    }

    ///创建流动性池子
    public entry fun new_pool<X,Y>(ctx: &mut TxContext){
        let pool = Pool<X,Y>{
            id:object::new(ctx),
            coin_x: balance::zero<X>(),
            coin_y: balance::zero<Y>(),
            lp_supply: balance::create_supply(LP{})
        };
        share_object(pool);
    }

    ///添加流动性
    public fun add_liquidity<X,Y>(pool: &mut Pool<X, Y>,
                                  coin_x:Coin<X>,
                                  coin_y:Coin<Y>,
                                  ctx: &mut TxContext): Coin<LP<X, Y>>{
        //获取输入的X代币数量
        let coin_x_value = coin_x.value();
        //获取输入的Y代币数量
        let coin_y_value = coin_y.value();
        //判断输入的代币是否为0，需要满足X,Y的代币都大于0
        assert!(coin_x_value > 0 && coin_y_value > 0, ErrZeroAmount);
        //更新流动性池子中X,Y代币的余额
        coin::put(&mut pool.coin_x,coin_x);
        coin::put(&mut pool.coin_y,coin_y);
        //更新lp对象的值
        let lp_bal = pool.lp_supply.increase_supply(coin_x_value+coin_y_value);
        coin::from_balance(lp_bal, ctx)
    }

    ///此函数主用于，验证移除流动性的正确性，以及返回应转移给调用者的代币数量
    public fun remove_liquidity<X,Y>(pool: &mut Pool<X, Y>,
                                     lp: &mut Coin<LP<X, Y>>,
                                     vec: vector<u64>,
                                     ctx: &mut TxContext): (Coin<X>, Coin<Y>) {
        assert!(vector::length(&vec)==2,ErrInvalidVecotrType);
        //LP的值
        let lp_balance_value = lp.value();
        //取出X代币的值
        let coin_x_out = vec[0];
        //取出Y代币的值
        let coin_y_out = vec[1];
        //判断池子中代币余额是否满足取出值
        assert!(lp_balance_value == coin_x_out + coin_y_out, ErrBalanceNotMatch);
        assert!(pool.coin_x.value() >= coin_x_out, ErrNotEnoughXInPool);
        assert!(pool.coin_y.value() >= coin_y_out, ErrNotEnoughYInPool);
        //销毁lp取出的供应量
        let lp_split = lp.split( coin_x_out + coin_y_out,ctx);
        pool.lp_supply.decrease_supply(coin::into_balance(lp_split));
        //组装返回值，包含应转移给调用者X,Y代币的数量
        (
            //从池中提取移除数量的X代币
            coin::take(&mut pool.coin_x, coin_x_out, ctx),
            //从池中提取移除数量的Y代币
            coin::take(&mut pool.coin_y, coin_y_out, ctx)
        )
    }
    //供用户调用的存入流动性函数
    public entry fun  deposit_liquidity<X,Y>(pool: &mut Pool<X, Y>,
                                             coin_x:&mut Coin<X>,
                                             coin_y:&mut Coin<Y>,
                                             coin_x_amt: u64,
                                             coin_y_amt: u64,
                                             ctx: &mut TxContext){
        //获取调用地址X代币余额
        let  coin_x_balance = coin::balance(coin_x).value();
        //获取调用地址Y代币余额
        let  coin_y_balance = coin::balance(coin_y).value();
        //判断用户输入代币数量是否小于等于地址拥有数量
        assert!(coin_x_balance >= coin_x_amt && coin_y_balance >= coin_y_amt,ErrNotEnoughBalance);
        //调用存入流动性函数
        let coin_x_in = coin_x.split(coin_x_amt, ctx);
        let coin_y_in = coin_y.split(coin_y_amt, ctx);
        let (lp) = add_liquidity(pool,coin_x_in,coin_y_in,ctx);
        //将lp发送给调用者
        transfer::public_transfer(lp, sender(ctx))
    }
    //供用户调用的移除全部流动性函数
    public entry fun  withdraw_liquidity<X,Y>(pool: &mut Pool<X, Y>,
                                              lp: &mut Coin<LP<X, Y>>,
                                              ctx: &mut TxContext){
        //获取流动池LP总供应
        let lp_supply = balance::supply_value(&pool.lp_supply);
        //计算用户输入的LP所占LP总供应份额
        let proportion = (lp.value() * PRODUCT_FACTOR)/lp_supply;
        //计算 X/Y 应提取数量
        let x_out = (pool.coin_x.value() * proportion) / PRODUCT_FACTOR;
        let y_out = (pool.coin_y.value() * proportion) / PRODUCT_FACTOR;
        //组装一个集合,元素为X,Y代币提出的数量
        let mut vec = vector::empty<u64>();
        vector::push_back(&mut vec,x_out);
        vector::push_back(&mut vec,y_out);
        let (coin_x,coin_y) = remove_liquidity(pool,lp,vec,ctx);
        //转移提出的代币数量发送到调用者
        public_transfer(coin_x,sender(ctx));
        public_transfer(coin_y,sender(ctx));
    }

    ///交换X代币到Y代币：因代币数量是1:1 ,就无须计算代币兑换比例
    public entry fun swap_x_to_y<X, Y>(pool: &mut Pool<X, Y>,
                                       coin_x: &mut Coin<X>,
                                       amount: u64,
                                       ctx: &mut TxContext){
        //判断池中是否有足量的代币以供兑换
        assert!(amount < pool.coin_y.value(), ErrNotEnoughYInPool);
        //减去兑换地址X代币的数量
        let x_value = coin_x.split(amount,ctx);
        //将代币数量添加到pool
        coin::put(&mut pool.coin_x, x_value);
        //减去兑换Y代币数量
        let receive_y =  coin::take(&mut pool.coin_y, amount, ctx);
        public_transfer(receive_y,sender(ctx));
    }

    ///交换Y代币到X代币：因代币数量是1:1 ,就无须计算代币兑换比例
    public entry fun swap_y_to_x<X, Y>(pool: &mut Pool<X, Y>,
                                       coin_y: &mut Coin<Y>,
                                       amount: u64,
                                       ctx: &mut TxContext){
        assert!(amount < pool.coin_x.value(), ErrNotEnoughYInPool);
        //池中减去兑换地址Y代币的数量
        let y_value = coin_y.split(amount,ctx);
        //将代币数量添加到pool
        coin::put(&mut pool.coin_y, y_value);
        //池中减去兑换X代币数量
        let receive_x = coin::take(&mut pool.coin_x, amount, ctx);
        public_transfer(receive_x,sender(ctx));
    }
}
```
## 任务总结
Swap 任务总结
任务概述
本次 Swap 任务 主要涉及以下方面：
1. 定义结构体
2. 处理异常
3. 创建池子
4. 添加以及移除流动性
5. 代币兑换
遇到的问题：

在任务实施过程中，主要遇到了以下问题：

1. 代币比例处理的问题：为了简化兑换操作，我们默认以1：1比例进行计算
2. 结构体设计问题：如何巧妙、合理地设计结构体，以高效地存储和处理相关信息。

经验与收获
经过这个项目，获得了很大的提升：

对 Swap 交易 的流程和关键环节有了更深刻的理解。提升了move编程能力 ，尤其是在定义结构体和处理异常方面积累了宝贵经验

加深了对 区块链 相关技术的认知和应用能力，能够更有效地应对复杂的问题和挑战

💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove