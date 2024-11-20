# MOVE共学营TASK4教程
🧑‍💻作者：gracecampo

##  完成游戏的上链部署

- 上链网络: 主网(mainnet)

## 需求

- 完成 链游相关知识的学习
- 完成 随机数的学习，游戏必须包含随机数
- 完成 存和取游戏资金池
- 完成 如何存储Coin在合约的学习，游戏必须能存取[task2] 发行的`Faucet Coin`,用`task2`的 `Faucet Coin`作为游戏输赢的资产
- 完成 第一个游戏合约部署主网
- 的game 必须包含自己的 `github id`的元素

## 任务指南
### 链游是什么
链游（Blockchain Games）是指利用区块链技术开发的网络游戏。与传统游戏不同，链游通常具有以下特点：

资产所有权：玩家可以真正拥有游戏内的数字资产（如角色、道具、皮肤等），这些资产通常以NFT（非同质化代币）的形式存在于区块链上。

去中心化：游戏的某些或全部逻辑运行在区块链上，确保游戏规则的透明和公平。

可交易性：玩家可以在区块链上自由交易他们的游戏资产，这为玩家提供了新的经济激励。

互操作性：某些链游允许玩家在不同的游戏中使用相同的资产，这种特性通常被称为“跨游戏互操作性”。

### 随机数
在 Sui 区块链上，你可以使用 sui::random 模块来生成安全的随机数。这个模块提供了多种生成随机数的方法，确保了随机数的不可预测性和不可操控性。以下是一些关键功能：

创建随机生成器：

```sui move
public fun new_generator(r: &random::Random, ctx: &mut tx_context::TxContext): random::RandomGenerator
```

生成随机数：

参考官方库：sui::random模块

以下是官方库中的函数：

生成一个 u8 类型的随机数：
```sui move
public fun generate_u8(g: &mut random::RandomGenerator): u8
```
生成一个范围内的 u32 类型随机数：
```sui move
public fun generate_u32_in_range(g: &mut random::RandomGenerator, min: u32, max: u32): u32

```
使用示例： 你可以在 Move 语言中使用这些功能来实现一个简单的掷骰子功能：
```sui move
    public entry fun roll_dice(r: &Random, ctx: &mut TxContext): Dice {
        let mut generator = new_generator(r, ctx);
        //生成1范围在1-6的随机数
        Dice { value: random::generate_u8_in_range(&mut generator, 1, 6) }
}
```
这些功能确保了在 Sui 上生成的随机数是安全的，并且可以用于各种应用场景，如游戏、抽奖等。

### 游戏合约开发
#### 定义奖池结构体
```sui move
    public struct Game has key {
        id: UID,
        balance: Balance<FAUCET_COIN>,
        game_name:vector<u8>
    }
```
#### 定义管理员结构体
```sui move
    public struct Admin has key {
        id: UID,
    }
```
#### 定义初始化函数
```sui move
    fun init(ctx: &mut TxContext) {
            let game = Game {
                id: object::new(ctx),
                balance: balance::zero(),
                game_name:b"GRACECAMPO GAME"
    
            };
            transfer::share_object(game);
    
            let admin = Admin {id: object::new(ctx)};
            transfer::transfer(admin, ctx.sender());
        }
```
#### 定义存款函数
```sui move
    public entry fun deposit(game: &mut Game, coin: &mut Coin<FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        assert!(coin.value() >= amount, EUserInsufficientBalance);
        let split_balance = coin::balance_mut(coin).split(amount);
        game.balance.join(split_balance);
    }
```
#### 定义取款函数
```sui move
    public entry fun withdraw(game: &mut Game, _: &Admin, amount: u64, ctx: &mut TxContext) {
        assert!(game.balance.value() >= amount, EGameInsufficientBalance);
        let cash = coin::take(&mut game.balance, amount, ctx);
        transfer::public_transfer(cash, ctx.sender());
    }
```
#### 定义游戏主逻辑
```sui move
    public entry fun play(game: &mut Game, rnd: &Random, guess: bool, coin: &mut Coin<FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        assert!(game.balance.value() >= amount, EGameInsufficientBalance);
        assert!(coin.value() >= amount, EUserInsufficientBalance);
        //创建随机数生成器
        let mut gen = random::new_generator(rnd, ctx);
        //根据随机数生成器生成布尔值
        let flag = random::generate_bool(&mut gen);
        //判断是否猜对,如果猜对将奖励发送到玩家账户
        if (flag == guess) {
            let reward = coin::take(&mut game.balance, amount, ctx);
            coin.join(reward);
        }else 
        //如果猜错，将赌注存入奖池
            Self::deposit(game, coin, amount,ctx)
        }
    }
```
#### 整体代码如下

```sui move
module task4::game{
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::random::{Self, Random};
    use task2::faucet_coin::FAUCET_COIN;

    const EUserInsufficientBalance: u64 = 1000;
    const EGameInsufficientBalance: u64 = 1001;

    public struct Game has key {
        id: UID,
        balance: Balance<FAUCET_COIN>,
        game_name:vector<u8>
    }

    public struct Admin has key {
    id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            balance: balance::zero(),
            game_name:b"GRACECAMPO GAME"

        };
        transfer::share_object(game);

        let admin = Admin {id: object::new(ctx)};
        transfer::transfer(admin, ctx.sender());
    }

    public entry fun deposit(game: &mut Game, coin: &mut Coin<FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        assert!(coin.value() >= amount, EUserInsufficientBalance);
        let split_balance = coin::balance_mut(coin).split(amount);
        game.balance.join(split_balance);
    }


    public entry fun withdraw(game: &mut Game, _: &Admin, amount: u64, ctx: &mut TxContext) {
        assert!(game.balance.value() >= amount, EGameInsufficientBalance);
        let cash = coin::take(&mut game.balance, amount, ctx);
        transfer::public_transfer(cash, ctx.sender());
    }

    public entry fun Play(game: &mut Game, rnd: &Random, guess: bool, coin: &mut Coin<FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        assert!(game.balance.value() >= amount, EGameInsufficientBalance);
        assert!(coin.value() >= amount, EUserInsufficientBalance);
        let mut gen = random::new_generator(rnd, ctx);
        let flag = random::generate_bool(&mut gen);
        // 如果获胜
        if (flag == guess) {
            let reward = coin::take(&mut game.balance, amount, ctx);
            coin.join(reward);
        }else {
            Self::deposit(game, coin, amount,ctx)
        }
    }
}
```

发布合约后，需要你记录
1. 合约的packageId
2. 合约的game结构体的ObjectID
3. 合约的admin结构体ObjectID
4. 获取调用地址的FAUCET_COIN的ObjectID
5. 
#### 执行合约函数
此合约函数都声明了entry，允许在区块浏览器进行函数调用。

packageId替换为你发布的包对象id

[访问地址](https://suivision.xyz/package/0xd5bc31660d727e41fcf1fc12c315045d2de4fa2ac176573088a4a67f2c0ab8a0?tab=Code):https://suivision.xyz/package/packageId?tab=Code


## 学习要点
1.导入coin模块
需要在move.toml中引入之前发布的coin包
例如：
```toml
[dependencies]
Sui = { git = "https://gitee.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/testnet" }
task2 = { local = "../task2" }  #引入你之前task2发布的coin包
```

task2是我的包名，你需要根据自己的包名做修改

Move.lock 记录了你的包发布的信息，此文件不能删除或者修改

2.理解管理员结构体

我们创建了一个admin结构体，赋予它key能力，用于在调用withdraw函数，控制只能拥有这个对象的地址进行调用，在实践中一定注意这点。


💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove


