---
title: sui-move基础（六）：letsmove-task5
date: 2024-11-24 17:27:00
tags:
---

# sui-move基础（六）：letsmove-task5

### 需求

- 完成 swap相关知识的学习
- 完成第一个Swap合约的上链部署
- swap 必须是 swap 自己发行的 task2 两个 Coin的互换，包名必须是自己的`github id`

### 写在前面

本节的内容相对比较简单，基本上完成了前面一个任务就没有任何问题了（尤其是跟着看我的教程的朋友，我的上一个教程写的较难）。

所以，本节最重要的是，千万不要想复杂了。如果你发现一个比较简单的实现方法，但是不够优雅，没关系，写！

毕竟，本task的要求只是：实现一个最简单的swap

### 概述

实现一个最简单的swap，这确实很简单，我们只需要构筑一个池子(`Pool`)，其中可以仅仅注入两种Coin（就是我们task2完成的那两种即可），然后编写两个接口，使得这两种Coin可以按照一定的比例兑换：存入x数量的CoinA，然后取走y数量的CoinB；反之亦然。

这有点类似原始的以物易物，只是我们以相对高科技的自动化手段实现：Move合约。

### 代码概览

***请一定注意看代码中的注释！！！***

```rust

module move_swap::move_swap;

use move_coin::faucet_coin::FAUCET_COIN;
use move_coin::my_coin::MY_COIN;
use sui::balance::{Self, Balance};
use sui::coin::{Self, Coin};

const EInputNotEnough: u64 = 0;
const EPoolNotEnough: u64 = 1;

public struct AdminCap has key { id: UID }

public struct Pool has key {
    // 如果需要，可以加上两种代币分别的存量属性，这里先不添加
    id: UID,
    faucet_coin: Balance<FAUCET_COIN>,
    //faucet_coin_balance: u64,
    my_coin: Balance<MY_COIN>,
    //faucet_coin_balance: u64,
}

fun init(ctx: &mut TxContext) {
    let pool = Pool {
        id: object::new(ctx),
        faucet_coin: balance::zero<FAUCET_COIN>(),
        my_coin: balance::zero<MY_COIN>(),
    };
    transfer::share_object(pool); // pool需要公开，通过AdminCap给予自己额外的管理员权限
    transfer::transfer(AdminCap { id: object::new(ctx) }, tx_context::sender(ctx));
}

// 这里我踩了个坑，给pool铸造coin无法增加balance，必须使用balance_join
// 由于在单一函数中无法获取铸造的coin的对象（mint函数直接将coin转给recipient）
// 所以我放弃这个实现
// public entry fun infuse(
//     // 本函数用于给pool注入资金，注意调用这个函数的地址需要拥有MY_COIN的TreasuryCap
//     // pool: &mut Pool,
//     faucet_treasury_cap: &mut coin::TreasuryCap<FAUCET_COIN>,
//     my_treasury_cap: &mut coin::TreasuryCap<MY_COIN>,
//     amount: u64,
//     pool_address: address,
//     ctx: &mut TxContext,
// ) {
//     my_coin::mint(my_treasury_cap, amount, pool_address, ctx);
//     faucet_coin::mint(faucet_treasury_cap, amount, pool_address, ctx);
// }
// 但是，我们可以通过deposit函数，将coin转入pool的balance中
// 我们还可以指定一个amount，并资金是否足够进行检查，与我们在guess_game中的实现类似
public entry fun deposit_my_coin(
    pool: &mut Pool,
    input: Coin<MY_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let caller = tx_context::sender(ctx);
    let input_value = coin::value(&input);
    assert!(input_value >= amount, EInputNotEnough);
    let mut input_balance = coin::into_balance(input);
    if (input_value > amount) {
        balance::join(
            &mut pool.my_coin,
            balance::split(&mut input_balance, amount),
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.my_coin, input_balance);
    };
}

public entry fun deposit__faucet_coin(
    pool: &mut Pool,
    input: Coin<FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let caller = tx_context::sender(ctx);
    let input_value = coin::value(&input);
    assert!(input_value >= amount, EInputNotEnough);
    let mut input_balance = coin::into_balance(input);
    if (input_value > amount) {
        balance::join(
            &mut pool.faucet_coin,
            balance::split(&mut input_balance, amount),
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.faucet_coin, input_balance);
    };
}

// 我们可以编写一个withdraw函数，并限制只有拥有管理员权限才能提取资金
public entry fun withdraw_zzf222_coin(
    _: &AdminCap,
    pool: &mut Pool,
    amount: u64,
    ctx: &mut TxContext,
) {
    let my_coin_balance = balance::split(&mut pool.my_coin, amount);
    let my_coin = coin::from_balance(my_coin_balance, ctx);
    transfer::public_transfer(my_coin, tx_context::sender(ctx));
}

public entry fun withdraw_zzf222_faucet_coin(
    _: &AdminCap,
    pool: &mut Pool,
    amount: u64,
    ctx: &mut TxContext,
) {
    let faucet_coin_balance = balance::split(&mut pool.faucet_coin, amount);
    let faucet_coin = coin::from_balance(faucet_coin_balance, ctx);
    transfer::public_transfer(faucet_coin, tx_context::sender(ctx));
}

// 在swap函数中，我们可以沿用部分上一节guess_game的代码
public entry fun swap_faucet_coin_to_my_coin(
    pool: &mut Pool,
    input: Coin<FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    // let faucet_amount = coin::value(& faucet_coin);
    // let my_amount = faucet_amount * 1000 / 2000;
    // balance::join(&mut pool.faucet_coin, coin::into_balance(faucet_coin)); // join 函数用于接收代币
    // let my_coin_balance = balance::split(&mut pool.my_coin, my_amount); // split函数用于将pool_balance减去对应于amount的数量
    // let my_coin = coin::from_balance(my_coin_balance, ctx);
    // transfer::public_transfer(my_coin, tx_context::sender(ctx));

    let caller = tx_context::sender(ctx);
    // get the input value and assert
    let input_value = coin::value(&input);
    let output_value = amount * 1000 / 2000; // amount千万不要写成input_value!
    assert!(input_value >= amount, EInputNotEnough);
    // transection the input value to Balance
    let mut input_balance = coin::into_balance(input); //Destruct a Coin wrapper and keep the balance.
    assert!(balance::value(&pool.my_coin) >= output_value, EPoolNotEnough);
    // if input value much than amount, change the excess
    if (input_value > amount) {
        balance::join(
            // join 函数用于接收代币
            &mut pool.faucet_coin,
            balance::split(&mut input_balance, amount), // split函数用于将pool_balance减去对应于amount的数量，并返回值为amount的Balance
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.faucet_coin, input_balance);
    };
    let output_balance = balance::split(&mut pool.my_coin, output_value);
    let output = coin::from_balance(output_balance, ctx);
    transfer::public_transfer(output, caller);
}

public entry fun swap_my_coin_to_faucet_coin(
    pool: &mut Pool,
    input: Coin<MY_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let caller = tx_context::sender(ctx);
    let input_value = coin::value(&input);
    let output_value = amount * 2000 / 1000;
    assert!(input_value >= amount, EInputNotEnough);
    let mut input_balance = coin::into_balance(input);
    assert!(balance::value(&pool.faucet_coin) >= output_value, EPoolNotEnough);
    if (input_value > amount) {
        balance::join(
            &mut pool.my_coin,
            balance::split(&mut input_balance, amount),
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.my_coin, input_balance);
    };
    let output_balance = balance::split(&mut pool.faucet_coin, output_value);
    let output = coin::from_balance(output_balance, ctx);
    transfer::public_transfer(output, caller);
}

```

我在注释中已经写明了绝大部分需要注意的内容，但我在这里仍然进行一下细节的讲解。

### 代码讲解

#### 资金池和管理员权限

```rust
public struct AdminCap has key { id: UID }

public struct Pool has key {
    // 如果需要，可以加上两种代币分别的存量属性，这里先不添加
    id: UID,
    faucet_coin: Balance<FAUCET_COIN>,
    //faucet_coin_balance: u64,
    my_coin: Balance<MY_COIN>,
    //faucet_coin_balance: u64,
}
```

这是一个很简单的资金池，它只支持进行两种Coin之间的转换。另外，注意类型：`Balance<YOUR_COIN>`。

这个资金池必须自身拥有资金，才能进行swap，也就是说我们需要给它注入资金。

`AdminCap`的作用与前一节的作用相同，赋予管理员权限，用于构造一些只有拥有管理员权限才能调用的函数。

#### 初始化

```rust
fun init(ctx: &mut TxContext) {
    let pool = Pool {
        id: object::new(ctx),
        faucet_coin: balance::zero<FAUCET_COIN>(),
        my_coin: balance::zero<MY_COIN>(),
    };
    transfer::share_object(pool); // pool需要公开，通过AdminCap给予自己额外的管理员权限
    transfer::transfer(AdminCap { id: object::new(ctx) }, tx_context::sender(ctx));
}
```

我们初始化一个Pool，将其公开，并将管理员权限赋予自己。

#### 踩坑记录

```rust
// 这里我踩了个坑，给pool铸造coin无法增加balance，必须使用balance_join
// 由于在单一函数中无法获取铸造的coin的对象（mint函数直接将coin转给recipient）
// 所以我放弃这个实现
// public entry fun infuse(
//     // 本函数用于给pool注入资金，注意调用这个函数的地址需要拥有MY_COIN的TreasuryCap
//     // pool: &mut Pool,
//     faucet_treasury_cap: &mut coin::TreasuryCap<FAUCET_COIN>,
//     my_treasury_cap: &mut coin::TreasuryCap<MY_COIN>,
//     amount: u64,
//     pool_address: address,
//     ctx: &mut TxContext,
// ) {
//     my_coin::mint(my_treasury_cap, amount, pool_address, ctx);
//     faucet_coin::mint(faucet_treasury_cap, amount, pool_address, ctx);
// }
// 但是，我们可以通过deposit函数，将coin转入pool的balance中
// 我们还可以指定一个amount，并资金是否足够进行检查，与我们在guess_game中的实现类似
```

为什么我们需要注意类型：`Balance<YOUR_COIN>`，我就是因为没有注意所以踩了这个坑。

我的这个infuse实现仅仅将Coin直接铸造并转给了Pool而已，对它的两种Coin的Balance并没有影响，因为我们不曾调用balance包中的函数给其增加balance。

并且由于Coin是属于Pool的，我们无法直接操作它，除非额外在这个包中编写接口，但那太麻烦了。

#### 存取函数

既然无法直接注入资金，我们就编写deposit函数来进行存入，并编写有权限控制的withdraw函数。

```rust
public entry fun deposit_my_coin(
    pool: &mut Pool,
    input: Coin<MY_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let caller = tx_context::sender(ctx);
    let input_value = coin::value(&input);
    assert!(input_value >= amount, EInputNotEnough);
    let mut input_balance = coin::into_balance(input);
    if (input_value > amount) {
        balance::join(
            &mut pool.my_coin,
            balance::split(&mut input_balance, amount),
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.my_coin, input_balance);
    };
}

public entry fun deposit__faucet_coin(
    pool: &mut Pool,
    input: Coin<FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let caller = tx_context::sender(ctx);
    let input_value = coin::value(&input);
    assert!(input_value >= amount, EInputNotEnough);
    let mut input_balance = coin::into_balance(input);
    if (input_value > amount) {
        balance::join(
            &mut pool.faucet_coin,
            balance::split(&mut input_balance, amount),
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.faucet_coin, input_balance);
    };
}

// 我们可以编写一个withdraw函数，并限制只有拥有管理员权限才能提取资金
public entry fun withdraw_zzf222_coin(
    _: &AdminCap,
    pool: &mut Pool,
    amount: u64,
    ctx: &mut TxContext,
) {
    let my_coin_balance = balance::split(&mut pool.my_coin, amount);
    let my_coin = coin::from_balance(my_coin_balance, ctx);
    transfer::public_transfer(my_coin, tx_context::sender(ctx));
}

public entry fun withdraw_zzf222_faucet_coin(
    _: &AdminCap,
    pool: &mut Pool,
    amount: u64,
    ctx: &mut TxContext,
) {
    let faucet_coin_balance = balance::split(&mut pool.faucet_coin, amount);
    let faucet_coin = coin::from_balance(faucet_coin_balance, ctx);
    transfer::public_transfer(faucet_coin, tx_context::sender(ctx));
}
```

在deposit函数中，我们支持存入定量的资金，并可以使用上一节`game_guess`实现过的资金检查机制来进行检查。

#### swap实现

```rust
// 在swap函数中，我们可以沿用部分上一节guess_game的代码
public entry fun swap_faucet_coin_to_my_coin(
    pool: &mut Pool,
    input: Coin<FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    // let faucet_amount = coin::value(& faucet_coin);
    // let my_amount = faucet_amount * 1000 / 2000;
    // balance::join(&mut pool.faucet_coin, coin::into_balance(faucet_coin)); // join 函数用于接收代币
    // let my_coin_balance = balance::split(&mut pool.my_coin, my_amount); // split函数用于将pool_balance减去对应于amount的数量
    // let my_coin = coin::from_balance(my_coin_balance, ctx);
    // transfer::public_transfer(my_coin, tx_context::sender(ctx));

    let caller = tx_context::sender(ctx);
    // get the input value and assert
    let input_value = coin::value(&input);
    let output_value = amount * 1000 / 2000; // amount千万不要写成input_value!
    assert!(input_value >= amount, EInputNotEnough);
    // transection the input value to Balance
    let mut input_balance = coin::into_balance(input); //Destruct a Coin wrapper and keep the balance.
    assert!(balance::value(&pool.my_coin) >= output_value, EPoolNotEnough);
    // if input value much than amount, change the excess
    if (input_value > amount) {
        balance::join(
            // join 函数用于接收代币
            &mut pool.faucet_coin,
            balance::split(&mut input_balance, amount), // split函数用于将pool_balance减去对应于amount的数量，并返回值为amount的Balance
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.faucet_coin, input_balance);
    };
    let output_balance = balance::split(&mut pool.my_coin, output_value);
    let output = coin::from_balance(output_balance, ctx);
    transfer::public_transfer(output, caller);
}

public entry fun swap_my_coin_to_faucet_coin(
    pool: &mut Pool,
    input: Coin<MY_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let caller = tx_context::sender(ctx);
    let input_value = coin::value(&input);
    let output_value = amount * 2000 / 1000;
    assert!(input_value >= amount, EInputNotEnough);
    let mut input_balance = coin::into_balance(input);
    assert!(balance::value(&pool.faucet_coin) >= output_value, EPoolNotEnough);
    if (input_value > amount) {
        balance::join(
            &mut pool.my_coin,
            balance::split(&mut input_balance, amount),
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut pool.my_coin, input_balance);
    };
    let output_balance = balance::split(&mut pool.faucet_coin, output_value);
    let output = coin::from_balance(output_balance, ctx);
    transfer::public_transfer(output, caller);
}
```

swap函数同样使用了之前我们实现过的资金检查机制。

我们设置MY_COIN和FAUCET_COIN的兑换比例为 `1 : 2` 。

注意我的注释`// amount千万不要写成input_value!`，阅读一下代码，我们将会发现，如果将amount写成input_value，output_value将是以input_value为乘数的积，这将导致检查不通过或者严重的资金损失。

上面的被注释掉的代码是没有检查的实现。

对于一些需要注意的函数，例如`balance::split`，我已在代码注释中进行了简单的讲解，请仔细阅读。

除此之外，其他你认为需要注意的或者感到好奇的函数，请通过`sui move new`新建一个move项目，将本代码复制进去。如果你正确安装了插件，你按住`Ctrl`并点击该函数将可以跳转到对应的源码。

阅读源码永远是理解库最好的办法！！！