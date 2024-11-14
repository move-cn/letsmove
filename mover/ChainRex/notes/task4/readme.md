# 手摸手教你完成HOH Move共学Task4-Move Game

![HOH](assets/HOH.webp)

> Move 共学由 HOH 社区、HackQuest、OpenBuild、KeyMap 联合发起。共学营集齐了多位 Move 语言领域内的专业导师，帮助新手小白快速了解 Move 语言及应用于 Web3 开发。

本教程面向新手，即使没有任何编程基础也能快速上手，有基础的同学可以跳着看。

## 写在前面
经过前三个task的学习，相信你已经掌握Move的基本语法、项目的部署流程、链上交互流程，在之前文章中提到的内容之后不会重复讲解。

如果你还未完成task1-3，可以翻看我之前的教程：

- [手摸手教你完成HOH Move共学Task1-HelloWorld](https://learnblockchain.cn/article/9810)
- [手摸手教你完成HOH Move共学Task2-Move Coin](https://learnblockchain.cn/article/9822)
- [手摸手教你完成HOH Move共学Task3-Move NFT](https://learnblockchain.cn/article/9833)

## Task4需求
- 完成 链游相关知识的学习
- 完成 随机数的学习，游戏必须包含随机数
- 完成 存和取游戏资金池
- 完成 如何存储Coin在合约的学习，游戏必须能存取[task2] 发行的Faucet Coin,用task2的 Faucet Coin作为游戏输赢的资产
- 完成 第一个游戏合约部署主网

## 游戏玩法
- 任何人都可以向资金池投入资金，一般而言，游戏创建之初需要有管理员存入初始资金
- 只有管理员可以提取资金池里的资金
- 玩家投入代币并猜测结果
    - 如果猜对，玩家获得双倍奖励
    - 如果猜错，则损失所有投入的代币，损失的金额存入游戏资金池

## 代码详解
### 定义对象
首先先创建游戏对象，该对象中只需要存储资金池的余额
```rust
public struct Game has key {
    id: UID,
    balance: Balance<CHAINREX_FAUCET_COIN>,
}
```
另外需要一个对象用于控制资金池的取款权限，该对象将在模块部署时将权限转移给部署者，并在取款函数中作为参数，这样只有部署者才能调用取款函数
```rust
public struct Admin has key {
    id: UID,
}
```
### 初始化
初始化函数也比较简洁，创建了game对象并将其作为共享对象，创建了Admin对象并将其权限转移给部署者
```rust
fun init(ctx: &mut TxContext) {
    let game = Game {
        id: object::new(ctx),
        balance: balance::zero(),
    };
    transfer::share_object(game);

    let admin = Admin {id: object::new(ctx)};
    transfer::transfer(admin, ctx.sender());
}
```
### 存款
```rust
public entry fun Deposit(
    game: &mut Game,
    coin: &mut Coin<CHAINREX_FAUCET_COIN>,
    amount: u64,
) {
    assert!(
        coin::value(coin) >= amount,
        EUserInsufficientBalance
    );
    let split_balance = balance::split(coin::balance_mut(coin), amount);
    balance::join(&mut game.balance, split_balance);
}
```
首先我们需要判断用户传入的coin余额是否大于等于amount，不满足的话则使用assert抛出异常，其中异常代码的定义为：
```rust
const EUserInsufficientBalance: u64 = 1000;
```
接着从用户的coin中分离出指定数额的balance，并使用join合并到资金池中
```rust
let split_balance = balance::split(coin::balance_mut(coin), amount);
balance::join(&mut game.balance, split_balance);
```

### 取款
```rust
public entry fun Withdraw(
    game: &mut Game,
    _: &Admin,
    amount: u64,
    ctx: &mut TxContext
) {
    assert!(
        game.balance.value() >= amount,
        EGameInsufficientBalance
    );
    let cash = coin::take(&mut game.balance, amount, ctx);
    transfer::public_transfer(cash, ctx.sender());
}
```
取款函数只有管理员能调用，所以需要在参数中传入Admin对象，这样其他用户调用该函数时就会报错。

同样在一开始先检查资金池的余额是否满足要取款的金额
```rust
assert!(
    game.balance.value() >= amount,
    EGameInsufficientBalance
);
```
接着从资金池中取出指定数量余额并存入一个新的coin中，最后将该coin转移给管理员。
```rust
let cash = coin::take(&mut game.balance, amount, ctx);
transfer::public_transfer(cash, ctx.sender());
```

### 开始游戏
```rust
public entry fun Play(
    game: &mut Game,
    rnd: &Random,
    guess: bool,
    coin: &mut Coin<CHAINREX_FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext
) {
    // 检查合约余额是否充足，确保用户获胜时有足够金额奖励
    assert!(
        game.balance.value() >= amount,
        EGameInsufficientBalance
    );
    // 检查用户的余额是否充足
    assert!(
        coin::value(coin) >= amount,
        EUserInsufficientBalance
    );

    // 生成随机数
    let mut gen = random::new_generator(rnd, ctx);
    let flag = random::generate_bool(&mut gen);

    // 如果获胜
    if (flag == guess) {
        // 投入的代币不变，另外奖励等额的代币
        let reward = coin::take(&mut game.balance, amount, ctx);
        coin::join(coin, reward);
    }
    // 猜错了就损失投入的代币
    else {
        Self::Deposit(game, coin, amount)
    }
}
```
首先同样需要检查两个内容
- 资金池的余额是否大于等于用户将要投入的资金，如果用户获胜需要奖励双倍资金（包括原始投入），则需要给用户等额的资金
- 用户的coin余额是否大于等于声称要投入的资金

```rust
assert!(
    game.balance.value() >= amount,
    EGameInsufficientBalance
);
// 检查用户的余额是否充足
assert!(
    coin::value(coin) >= amount,
    EUserInsufficientBalance
);
```
接着需要生成一个随机数，这里使用了`sui::random`模块，其中Random的object id为0x8，将作为Play函数的`rnd: &Random`参数。使用时，需要先创建一个随机数生成器，然后使用该生成器生成一个bool值。
```rust
let mut gen = random::new_generator(rnd, ctx);
let flag = random::generate_bool(&mut gen);
```
最后将生成的bool值和用户的猜测值进行比对
- 如果相等，则说明用户获胜，另外奖励用户等额的资金
    - 使用coin::take从资金池余额获取指定资金，并存入新的coin，然后将新的coin合并进用户的coin中
- 如果不相等，则说明用户输了，通过调用本模块的存款函数，则将用户的资金存入资金池中

```rust
// 如果获胜
if (flag == guess) {
    // 投入的代币不变，另外奖励等额的代币
    let reward = coin::take(&mut game.balance, amount, ctx);
    coin::join(coin, reward);
}
// 猜错了就损失投入的代币
else {
    Self::Deposit(game, coin, amount)
}
```

## 完整代码

最后贴一下完整代码
```rust
module game::game {
    use sui::coin::{Self, Coin};
    use chainrex_faucet_coin::chainrex_faucet_coin::CHAINREX_FAUCET_COIN;
    use sui::balance::{Self, Balance};
    use sui::random::{Self, Random};

    const EUserInsufficientBalance: u64 = 1000;
    const EGameInsufficientBalance: u64 = 1001;

    public struct Game has key {
        id: UID,
        balance: Balance<CHAINREX_FAUCET_COIN>,
    }

    public struct Admin has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            balance: balance::zero(),
        };
        transfer::share_object(game);

        let admin = Admin {id: object::new(ctx)};
        transfer::transfer(admin, ctx.sender());
    }

    public entry fun Deposit(
        game: &mut Game,
        coin: &mut Coin<CHAINREX_FAUCET_COIN>,
        amount: u64,
    ) {
        assert!(
            coin::value(coin) >= amount,
            EUserInsufficientBalance
        );
        let split_balance = balance::split(coin::balance_mut(coin), amount);
        balance::join(&mut game.balance, split_balance);
    }

    // 只有管理员能够提现
    public entry fun Withdraw(
        game: &mut Game,
        _: &Admin,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(
            game.balance.value() >= amount,
            EGameInsufficientBalance
        );
        let cash = coin::take(&mut game.balance, amount, ctx);
        transfer::public_transfer(cash, ctx.sender());
    }

    // 如果用户猜对了，获得双倍奖励。如果用户猜错了，损失投入的代币

    public entry fun Play(
        game: &mut Game,
        rnd: &Random,
        guess: bool,
        coin: &mut Coin<CHAINREX_FAUCET_COIN>,
        amount: u64,
        ctx: &mut TxContext
    ) {
        // 检查合约余额是否充足，确保用户获胜时有足够金额奖励
        assert!(
            game.balance.value() >= amount,
            EGameInsufficientBalance
        );
        // 检查用户的余额是否充足
        assert!(
            coin::value(coin) >= amount,
            EUserInsufficientBalance
        );

        // 生成随机数
        let mut gen = random::new_generator(rnd, ctx);
        let flag = random::generate_bool(&mut gen);

        // 如果获胜
        if (flag == guess) {
            // 投入的代币不变，另外奖励等额的代币
            let reward = coin::take(&mut game.balance, amount, ctx);
            coin::join(coin, reward);
        }
        // 猜错了就损失投入的代币
        else {
            Self::Deposit(game, coin, amount)
        }
    }
}
```

## ⚠️注意事项
- 需要在Move.toml中引入自己的faucet代币模块，并且会使用你最后一次部署的faucet代币地址
    ```toml
    chainrex_faucet_coin = { local = "../../task2/chainrex_faucet_coin" }
    ```
- Play函数的第二个参数`sui::random::Random`的object id 为0x8

- 在区块链浏览器上无法输入Bool类型的参数，需要使用命令行进行调用，具体参数修改为自己的即可
    ```bash
    sui client call --package 0x37c3152c9b1dcce88d27f6d2375fdbf9fbd357eb0a7baaea4b268a12af15b524 --module game --function Play --args 0x044b841ce7633af6c98067359b6215227049ff14142185ca2e4a30047527f805 0x8 true 0x184f91c7f9daea73caee3af40b408b86929acfd2c837be8ea48bd531fd47996e 1000000000 --gas-budget 1000000
    ```