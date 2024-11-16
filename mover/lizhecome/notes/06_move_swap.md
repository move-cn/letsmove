# （六）Move实现简单的代币swap功能
## 在开始之前
本系列文章将深入浅出的全面讲解Move语言。 
   
> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH.png)
### 新的任务

大家好，又来做HOH水分子社区的学习任务啦，今天我们来聊聊用 Move 语言实现一个非常简单的 swap 功能，也就是两种代币之间的兑换。这个功能类似于我们在生活中把美元换成人民币，只不过在这里，我们要在两种虚拟代币——LIZHECOME_COIN 和 LIZHECOME_FAUCET_COIN 之间进行转换。

这篇笔记会带你逐步了解代码是怎么实现的，并帮助大家理解背后的逻辑。

### 模块总览

#### 1. 模块介绍

首先，我们要创建一个模块，名字叫 swap_lizhecome，就像是我们在编写一个简单的“代币兑换所”。

```move
module swap_lizhecome::swap_lizhecome;
```

#### 2. 引入需要的工具

接下来，我们需要引入一些功能模块，就像是搭积木前先找好需要的零件。

```move
use faucetcoin::lizhecome_faucet_coin::LIZHECOME_FAUCET_COIN;
use mycoin::lizhecome_coin::LIZHECOME_COIN;
use sui::balance::{Self, Balance};
use sui::transfer::{transfer, share_object, public_transfer};
use sui::coin::{Self, Coin};
```

- faucetcoin 和 mycoin：这是我们要操作的两种代币。
- sui::balance 和 sui::coin：这些模块帮我们处理代币的余额和具体操作。
- sui::transfer：用于代币的转移，确保代币可以安全地从一个账户转到另一个账户。

#### 3. 定义银行和管理员

我们需要两个结构体，一个是 AdminCap，用来表示管理员的权限；另一个是 Bank，它就像我们的银行，用来存储代币。

**管理员权限 AdminCap**

```move
public struct AdminCap has key {
    id: UID
}
```

- AdminCap：这个结构体只有一个 id，用于标识管理员身份。管理员可以做一些普通用户不能做的事情，比如存取款操作。

**银行结构体 Bank**

```move
public struct Bank has key {
    id: UID,
    lizhecome: Balance<LIZHECOME_COIN>,
    lizhecome_faucet: Balance<LIZHECOME_FAUCET_COIN>
}
```

- Bank：这个结构体就是银行啦，包含两个余额：
  - lizhecome: 存储 LIZHECOME_COIN。
  - lizhecome_faucet: 存储 LIZHECOME_FAUCET_COIN。

#### 初始化银行

接下来，我们来写一个初始化银行的函数，让银行正式“开门营业”。

```move
fun init(ctx: &mut TxContext) {
    let bank = Bank {
        id: object::new(ctx),
        lizhecome: balance::zero<LIZHECOME_COIN>(),
        lizhecome_faucet: balance::zero<LIZHECOME_FAUCET_COIN>()
    };
    share_object(bank);

    let admin_cap = AdminCap { id: object::new(ctx) };
    transfer(admin_cap, ctx.sender());
}
```

- 这里我们创建了一个 Bank 对象，初始化时两种代币的余额都是 0。
- 接着我们分享这个银行（share_object），意思是让用户都能看到并使用这个银行。
- 然后我们创建了一个管理员权限（AdminCap）并把它交给调用这个函数的人，也就是“开店老板”拿到钥匙了。

#### 存款和取款

##### 1. 存款功能

我们先来看看如何往银行里存钱（代币）。这部分由两个函数组成，分别是存入 LIZHECOME_COIN 和 LIZHECOME_FAUCET_COIN。

```move
public entry fun deposit_lizhecome(_: &AdminCap, bank: &mut Bank, lizhecome: Coin<LIZHECOME_COIN>, _: &mut TxContext) {
    let lizhecome_balance = coin::into_balance(lizhecome);
    balance::join(&mut bank.lizhecome, lizhecome_balance);
}

public entry fun deposit_lizhecome_faucet(_: &AdminCap, bank: &mut Bank, lizhecome_faucet: Coin<LIZHECOME_FAUCET_COIN>, _: &mut TxContext) {
    let lizhecome_faucet_balance = coin::into_balance(lizhecome_faucet);
    balance::join(&mut bank.lizhecome_faucet, lizhecome_faucet_balance);
}
```

- 这两个函数接收用户存入的代币，然后把这些代币加到银行的余额中。
- 简单理解就是：用户拿代币给银行，银行把这些代币加到自己的库存里。

##### 2. 取款功能

如果用户想要从银行里取代币，也有两个对应的函数：

```move
public entry fun withdraw_lizhecome(_: &AdminCap, bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
    let lizhecome_balance = balance::split(&mut bank.lizhecome, amount);
    let lizhecome = coin::from_balance(lizhecome_balance, ctx);
    public_transfer(lizhecome, ctx.sender());
}

public entry fun withdraw_lizhecome_faucet(_: &AdminCap, bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
    let lizhecome_faucet_balance = balance::split(&mut bank.lizhecome_faucet, amount);
    let lizhecome_faucet = coin::from_balance(lizhecome_faucet_balance, ctx);
    public_transfer(lizhecome_faucet, ctx.sender());
}
```

- 用户告诉银行要取多少代币，银行从余额中取出相应数量的代币，并转移到用户账户。
- 这个过程就像从 ATM 取钱，用户输入金额，银行吐出对应的代币。

#### 核心功能：代币兑换（swap）

终于到了重点，代币兑换功能！在这里，用户可以用 LIZHECOME_COIN 换 LIZHECOME_FAUCET_COIN，反之亦然。我们设定的兑换比例是 1:2，也就是 1 LIZHECOME_COIN 能换 2 LIZHECOME_FAUCET_COIN。

##### 1. 用 LIZHECOME 换 FAUCET

```move
public entry fun swap_lizhecome_to_faucet(bank: &mut Bank, lizhecome: Coin<LIZHECOME_COIN>, ctx: &mut TxContext) {
    let amount = coin::value(&lizhecome);
    balance::join(&mut bank.lizhecome, coin::into_balance(lizhecome));

    let amount_end = amount * 2;
    let faucet = balance::split(&mut bank.lizhecome_faucet, amount_end);
    public_transfer(coin::from_balance(faucet, ctx), ctx.sender());
}
```

- 用户输入一定数量的 LIZHECOME_COIN，系统计算它的价值，并存入银行。
- 然后计算用户可以获得的 LIZHECOME_FAUCET_COIN 数量（数量翻倍）。
- 银行把换算好的 LIZHECOME_FAUCET_COIN 转给用户。

##### 2. 用 FAUCET 换 LIZHECOME

```move
public entry fun swap_faucet_to_lizhecome(bank: &mut Bank, lizhecome_faucet: Coin<LIZHECOME_FAUCET_COIN>, ctx: &mut TxContext) {
    let amount = coin::value(&lizhecome_faucet);
    balance::join(&mut bank.lizhecome_faucet, coin::into_balance(lizhecome_faucet));

    let amount_end = amount / 2;
    let lizhecome = balance::split(&mut bank.lizhecome, amount_end);
    public_transfer(coin::from_balance(lizhecome, ctx), ctx.sender());
}
```

- 用户输入一定数量的 LIZHECOME_FAUCET_COIN，系统计算其价值并存入银行。
- 计算用户可以获得的 LIZHECOME_COIN 数量（数量减半）。
- 银行把换算好的 LIZHECOME_COIN 转给用户。

### 总结

通过这个模块，我们轻松实现了：
1. 代币的存款与取款功能。
2. 两种代币的兑换（swap）功能。

这个模块为我们打造了一个简易的“代币兑换所”，让用户可以在两种代币之间自由转换。这样的小功能，在日常的 DeFi 应用中非常实用。学会了这些，你就可以开始构建自己的智能合约，实现更多有趣的金融功能啦！