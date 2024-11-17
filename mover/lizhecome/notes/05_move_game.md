# （五）使用Move语言开发第一个链上游戏
## 在开始之前
本系列文章将深入浅出的全面讲解Move语言。 
   
> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH.png)
## 一、缘起：从兴趣到行动

作为一名对区块链技术充满好奇的萌新开发者，我一直在寻找机会深入学习并实践这一前沿技术。非常幸运的参加了HOH水分子社区组织一次关于Move语言的共学营活动。随着任务的推进，终于到了激动人心的链上游戏开发。

我选择开发一个 猜单双的小游戏（GuessGame），这是我第一次尝试用Move编写完整的链上应用，过程既新鲜又充满挑战。通过这篇学习笔记，我想记录下我的学习历程和收获，希望能为其他学习Move的朋友提供一些参考。

## 二、设计思路与模块分析

### 1. 模块导入

```move
use sui::balance::{Self,Balance};
use sui::coin::{Self,Coin};
use faucetcoin::lizhecome_faucet_coin::LIZHECOME_FAUCET_COIN;
use sui::random::{Self,Random};
use sui::transfer::{share_object};
```

在开发过程中，我首先导入了几个必要的模块：
- balance 和 coin: 负责管理游戏中的货币和余额操作。
- random: 提供随机数生成功能，这是链上游戏中实现随机结果的关键。
- transfer: 处理转账操作，用于资产的转移。

在Move的世界中，每个模块都封装了独立的功能，这种模块化设计既方便了开发，又提高了代码的可读性。

### 2. 常量定义

```move
const EOverBalance:u64 = 0;
const EOnlyOneFAUCET:u64 = 1;
const EVaultIsEmpty:u64 = 2;
```

定义了三个错误码，分别对应余额不足、输入金额不符合要求、金库为空的情况。这种错误码机制在调试过程中非常方便，有助于快速定位问题。

## 三、游戏金库与权限设计

### 1. 金库 Vault 和管理员权限 AdminCap

```move
public struct Vault has key {
    id:UID,
    balance:Balance<LIZHECOME_FAUCET_COIN>,
}
public struct AdminCap has key{
    id:UID
}
```

在游戏中，我们需要有一个“金库”来存储用户存入的游戏币，同时也需要有一个管理员权限 AdminCap 来管理游戏的核心操作。这种设计符合区块链的去中心化思维，让所有参与者都能访问金库，同时确保只有管理员能进行存取操作，避免了滥用权限的风险。

### 2. 初始化函数 init

```move
fun init(ctx: &mut TxContext){
    let admincap = AdminCap { id:object::new(ctx) };
    let vault = Vault { id:object::new(ctx), balance:balance::zero<LIZHECOME_FAUCET_COIN>() };
    share_object(vault);
    transfer::transfer(admincap, ctx.sender());
}
```

实现初始化函数，用于创建游戏金库和分配管理员权限。在运行这个函数时，我体会到了智能合约的实际操作感，看到自己的账户获得了管理员权限，就像拿到了游戏的“主控权”，非常有趣。

## 四、游戏功能实现

### 1. 存款功能 deposit

```move
public entry fun deposit(_:&AdminCap, vault:&mut Vault, faucet:Coin<LIZHECOME_FAUCET_COIN>, _: &mut TxContext){
    let deposit_amount = coin::into_balance(faucet);
    balance::join(&mut vault.balance, deposit_amount);
}
```

在开发这个函数时，我深刻体会到了Move语言的资源管理能力。通过 coin::into_balance 和 balance::join 的组合，我们可以将用户存入的游戏币安全地加入金库，充分保障了资产的安全性和流动性。

### 2. 提款功能 withdraw

```move
public entry fun withdraw(_:&AdminCap, vault:&mut Vault, amount:u64, ctx:&mut TxContext){
    assert!(amount <= balance::value(&vault.balance), EOverBalance);
    let withdraw_amount = balance::split(&mut vault.balance, amount);
    transfer::public_transfer(coin::from_balance(withdraw_amount, ctx), ctx.sender());
}
```

管理员可以通过这个函数从金库中提取指定金额。在设计这部分功能时，我学习到了如何使用 balance::split 来拆分余额，并通过 transfer::public_transfer 安全地转移资金。

### 3. 游戏功能 gameplay

```move
entry fun gameplay(r:&Random, vault:&mut Vault, inputcoin:Coin<LIZHECOME_FAUCET_COIN>, guess:bool, ctx:&mut TxContext){
    assert!(balance::value(&vault.balance) >= 1000000, EVaultIsEmpty);
    let balance_dewrap = coin::into_balance(inputcoin);
    assert!(balance::value(&balance_dewrap) == 1000000, EOnlyOneFAUCET);
    balance::join(&mut vault.balance, balance_dewrap);

    let mut generator = random::new_generator(r, ctx);
    let random_result = random::generate_bool(&mut generator);
    if (guess == random_result){
        let win_back = balance::split(&mut vault.balance, 2000000);
        transfer::public_transfer(coin::from_balance(win_back, ctx), ctx.sender());
    }
}
```

这是游戏的核心部分，用户通过下注一枚游戏币，猜测随机生成的布尔值。当猜中时，用户可以获得双倍奖励。这个过程让我充分体验到了Move语言处理资产的灵活性，以及随机数在链上游戏中带来的趣味性。

## 五、我的学习感悟

通过这次在HOH共学营中的学习和实践，我对Move语言有了全新的认识，也逐渐理解了它在区块链开发中的优势：
- 安全性：Move语言的所有权和生命周期管理让我在开发过程中几乎不必担心资产丢失或滥用。尤其是在设计Vault和管理员权限时，我深刻感受到Move对资源的严谨控制。
- 模块化与可读性：Move的模块化设计让我可以轻松地调用各类功能模块，代码结构清晰且易于维护。
- 随机性与公平性：在实现 gameplay 功能时，我通过 random::generate_bool 生成随机结果，让游戏更加公平，玩家体验得到了保障。