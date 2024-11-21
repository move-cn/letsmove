---
title: sui-move基础（五）：letsmove-task4
date: 2024-11-20 00:00:27
tags:
---

# sui-move基础（五）：letsmove-task4

### 需求

- 完成 链游相关知识的学习
- 完成 随机数的学习，游戏必须包含随机数
- 完成 存和取游戏资金池
- 完成 如何存储Coin在合约的学习，游戏必须能存取[task2] 发行的`Faucet Coin`,用`task2`的 `Faucet Coin`作为游戏输赢的资产
- 完成 第一个游戏合约部署主网
- 的game 必须包含自己的 `github id`的元素

### 写在前面

本章的要求是完成一个链游，也就是一个区块链上的游戏。

那么既然是游戏，即便只是学习sui move 语言中的一个demo，不论是为了完成task也好，或者为了学习move上的链游也好，都需要进行设计，即使是一个很大概的设计。

在这一节中，我们来设计一个很简单的赌博(GAME)游戏————猜数字：

- 由我们————游戏发起者，设定一个秘密数字，简单起见，我们将其定在1到100之间
- 我们的游戏币是之前task2时发行的Faucet coin
- 每位游玩者每猜一次都需要支付一定的游戏币(FAUCET_COIN)，支付的游戏币将存储在游戏奖池中
- 每次进行游戏，我们将给出模糊的提示：
    - 太大！
    - 太小！
    - 正确！
- 我们设计多用户模式，随着游戏的进行，奖池金额将不断增加，而秘密数字的范围将逐渐明确
- BOOM!命中了！有一位幸运的（或者精明的）游玩者给出了正确的数字！

  而我们的奖励是：奖池所有的COIN！我们甚至会为其额外铸造一枚task4所发行的NFT，作为其胜利的证明！

  而其他倒霉蛋，只能失去他们所投入的所有COIN，还有gas。（O皿O）
- 这就是我们该死的赌徒游戏的原则：

  所有，或者一无所有！！！

现在，游戏模式已经明确了，让我们来进行代码的具体实现。

当然，你想要做什么，往往不会在一开始就很明朗，但我们在实现的过程中，专注的大脑往往会冒出一个又一个点子，甚至会令人感到惊艳。

所以，JUST DO IT!

### 代码实现

来看看我们的guess_game：
```rust
module move_game::guess_game {
    /// 所有，或者一无所有！
    use sui::tx_context::{sender};
    use sui::event::emit;
    use move_coin::faucet_coin::{Self, FAUCET_COIN};
    use move_nft::move_nft::{Self};
    use sui::coin::{Self,Coin,TreasuryCap};
    use sui::balance::{Self, Balance};
    use sui::address;
    use sui::table::{Self, Table};
    use sui::bcs;

    const EInvalid:u64 = 0;
    const EInputNotEnough:u64 = 1;
    const ECurrencyNotEnough:u64 = 2;
    const EHaveWon:u64 = 4;
    const ENotUser:u64 = 5;

    /// 定义游戏
    public struct Game has key, store {
        id: UID,
        secret_number: Option<u32>,
        attempts: u32,
        over: bool,
        winner: address,
        cost_per_round: u64,
        pool: u64,
        game_pool: Balance<FAUCET_COIN>,
        users: Table<address, USER>,
    }

    /// 定义游戏事件
    public enum GuessEvent has copy, drop, store {
        TooSmall,
        TooBig,
        Correct,
    }

    public struct USER has store{
        balance: u64,
    }

    public struct AdminCap has key{id:UID}

    /// 初始化游戏
    fun init(ctx: &mut TxContext){
        let game = Game {
            id: object::new(ctx),
            secret_number: option::none(),
            attempts: 0,
            over: false,
            winner: address::from_u256(0),
            cost_per_round: 10, //define the cost per round is 10 faucet_coin
            pool: 0,
            game_pool: balance::zero<FAUCET_COIN>(),
            users: table::new<address, USER>(ctx),
        };
        transfer::share_object(game);
        transfer::transfer(AdminCap{id:object::new(ctx)},sender(ctx));
    }

    //get random number
    // public entry fun get_random_number(_: &AdminCap, game: &mut Game, r: &Random, ctx: &mut TxContext) {
    //     let mut generator=random::new_generator(r,ctx);
    //     let random_value=random::generate_u8_in_range(&mut generator,1,101);
    //     game.secret_number = random_value as u32;
    // }
    public entry fun get_random_number(_: &AdminCap, game: &mut Game, magic_number: u64, ctx: &mut TxContext) { 
        let sender_address = tx_context::sender(ctx);
        let timestamp = tx_context::epoch_timestamp_ms(ctx);
        let address_bytes = address::to_bytes(sender_address);
        let timestamp_bytes = bcs::to_bytes(&timestamp);
        let magic_number_bytes = bcs::to_bytes(&magic_number);
        let mut hash_input = address_bytes;
        vector::append(&mut hash_input, timestamp_bytes);
        vector::append(&mut hash_input, magic_number_bytes);
        let hash_output = sui::hash::blake2b256(&hash_input);
        // 取哈希值的第一个字节并转换为随机数 [1, 100]
        let random_byte = *vector::borrow(&hash_output, 0); // 解引用 &u8
        let random_value = (random_byte as u32) % 100 + 1;
        game.secret_number = option::some(random_value);
    }

    //get faucet_coin
    public entry fun get_faucet_coin(
        treasury_cap:&mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        ctx: &mut TxContext) {
        faucet_coin::mint(treasury_cap,amount,tx_context::sender(ctx),ctx); 
    }

    //deposit Coin
    public entry fun deposit(game: &mut Game, input: Coin<FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        let caller = tx_context::sender(ctx);
        // get the input value and assert
        let input_value = coin::value(&input);
        assert!(input_value >= amount, EInputNotEnough);
        // transection the input value to Balance
        let mut input_balance = coin::into_balance(input);
        // if input valye much tran amount, change the excess
        if (input_value > amount) {
            balance::join(
                &mut game.game_pool,
                balance::split(&mut input_balance, amount),
            );
            let change = coin::from_balance(input_balance, ctx);
            transfer::public_transfer(change, caller);
        } else {
            balance::join(&mut game.game_pool, input_balance);
        };
        // check if user in table `users` 
        if (!table::contains(&game.users, caller)) {
            // insert new user, and set its balance
            table::add(&mut game.users, caller, USER { balance: amount });
        } else {
            // user is valid，update its balance
            let user = table::borrow_mut(&mut game.users, caller);
            user.balance = user.balance + amount;
        }
    }

    //withdraw Coin
    public entry fun withdraw(_: &AdminCap, game: &mut Game, amount: u64, ctx: &mut TxContext) {
        let output_balance = balance::split(&mut game.game_pool, amount);
        let output = coin::from_balance(output_balance, ctx);
        transfer::public_transfer(output, sender(ctx));
        game.pool = game.pool - amount;
    }

    //restart
    public entry fun restart(_: &AdminCap, game: &mut Game) {
        game.secret_number = option::none();
        game.attempts = 0;
        game.over = false;
        game.winner = address::from_u256(0);
    }

    /// user guess
    public entry fun make_guess(game: &mut Game, coin: Coin<FAUCET_COIN>, guess: u32, ctx: &mut TxContext) {
        game.attempts = game.attempts + 1;
        let caller = tx_context::sender(ctx);
        // base check
        assert!(game.secret_number != option::none(), EInvalid); 
        assert!(game.over != true, EHaveWon);       
        assert!(game.winner == address::from_u256(0), EHaveWon); 
        assert!(table::contains(&game.users, caller), ENotUser); 
        assert!(guess >= 1 && guess <= 100, EInvalid); 
        // check the balance
        let user = table::borrow_mut(&mut game.users, caller);
        assert!(user.balance >= game.cost_per_round, ECurrencyNotEnough); // currency not enough
        user.balance = user.balance - game.cost_per_round; // deduct the cost
        // input the balance into pool
        let input_balance = coin::into_balance(coin);
        balance::join(&mut game.game_pool, input_balance);
        game.pool = game.pool + game.cost_per_round;
        // compare guess with secret number
        let secret_number = option::borrow(&game.secret_number);
        if (guess < *secret_number) {
        emit(GuessEvent::TooSmall); // too small
        } else if (guess > *secret_number) {
        emit(GuessEvent::TooBig); // too big
        } else {
            // guess correct
            emit(GuessEvent::Correct);
            // game over
            game.over = true;
            game.winner = caller;
            // get reward
            // let reward_balance = balance::split(&mut game.game_pool, user.balance); 
            // let reward = coin::from_balance(reward_balance, ctx);
            // NOTHING, OR EVERYTHING!!!
            let reward_balance = balance::split(&mut game.game_pool, 0);
            let reward = coin::from_balance(reward_balance, ctx);
            transfer::public_transfer(reward, caller);
            // give a NFT to winner
            move_nft::mint(b"TruE", b"Bless Alysia! from ctianming≥v≤", b"https://avatars.githubusercontent.com/u/107739505?v=4", caller, ctx);
        }
    }
}
```

##### 游戏主体结构

首先，来看看我们的游戏主体结构：
```rust
public struct Game has key, store {
    id: UID,
    secret_number: Option<u32>,     // 游戏的秘密数字
    attempts: u32,                  // 用户猜测次数
    over: bool,                     // 游戏是否结束
    winner: address,                // 获胜者地址
    cost_per_round: u64,            // 每轮游戏的费用
    pool: u64,                      // 游戏池中总金额
    game_pool: Balance<FAUCET_COIN>,// 游戏资金池，使用 FAUCET_COIN
    users: Table<address, USER>,    // 用户表，记录每个用户的余额
}
```

通过以上的所有属性，我们可以方便地控制游戏的状态。

##### 辅助结构

接下来是一些辅助的结构：
```rust
    /// 定义游戏事件
    public enum GuessEvent has copy, drop, store {
        TooSmall,
        TooBig,
        Correct,
    }

    // 存储用户余额
    public struct USER has store{
        balance: u64,
    }

    // 存储管理员权限
    public struct AdminCap has key{id:UID}

    // 错误代码，用于在游戏过程中检测非法操作
    const EInvalid:u64 = 0;
    const EInputNotEnough:u64 = 1;
    const ECurrencyNotEnough:u64 = 2;
    const EHaveWon:u64 = 4;
    const ENotUser:u64 = 5;
```

通过`GuesssEvent`，我们可以在游玩者每次进行guess后对其进行一些模糊的提示，否则这个游戏就过于残酷了，将不会有人来玩它。

`USER`结构体非常简单，只有一个唯一的属性balance，用于存储用户余额。

`AdminCap`用于存储管理员权限，我们需要一些操作只有管理员才能有权进行，比如设置随机数和重启游戏。

这些错误代码用于检测并报告非法操作。

##### 游戏初始化

接下来，我们进行游戏的初始化，它将在游戏部署时自动执行：
```rust
fun init(ctx: &mut TxContext) {
    let game = Game {
        id: object::new(ctx),       // 创建游戏的唯一标识符
        secret_number: option::none(),          // 初始化秘密数字为 0
        attempts: 0,               // 初始化猜测次数为 0
        over: false,               // 游戏未结束
        winner: address::from_u256(0), // 初始化获胜者为空地址
        cost_per_round: 10,        // 每轮费用为 10 FAUCET_COIN
        pool: 0,
        game_pool: balance::zero<FAUCET_COIN>(), // 初始化空资金池
        users: table::new<address, USER>(ctx),  // 初始化用户表
    };
    transfer::share_object(game);              // 将游戏作为共享对象
    transfer::transfer(AdminCap { id: object::new(ctx) }, sender(ctx)); // 分发管理员权限
}
```

##### 设置秘密数字

我们可以看到，现在秘密数字被初始化为None，这代表我们需要在游戏主体中编写逻辑，使得若秘密数字为None则报错并退出；而在游戏开始前，我们需要按着管理员权限去设置秘密数字：
```rust
public entry fun get_random_number(_: &AdminCap, game: &mut Game, magic_number: u64, ctx: &mut TxContext) {
    // 获取随机数种子：调用者地址、时间戳、magic_number
    let sender_address = tx_context::sender(ctx);
    let timestamp = tx_context::epoch_timestamp_ms(ctx);
    let address_bytes = address::to_bytes(sender_address);
    let timestamp_bytes = bcs::to_bytes(&timestamp);
    let magic_number_bytes = bcs::to_bytes(&magic_number);

    // 构造哈希输入
    let mut hash_input = address_bytes;
    vector::append(&mut hash_input, timestamp_bytes);
    vector::append(&mut hash_input, magic_number_bytes);

    // 计算哈希值并生成随机数
    let hash_output = sui::hash::blake2b256(&hash_input);
    let random_byte = *vector::borrow(&hash_output, 0);
    let random_value = (random_byte as u32) % 100 + 1;
    game.secret_number = option::some(random_value); // 设置秘密数字
}
```

我们规定秘密数字范围为 [1, 100]。

注意到了吗，这个秘密数字是通过哈希函数生成的，作为管理员，我们能做的只是调用它，并设置一个参数`magic_number`而已。这代表即使是我们自己，也不知道这个秘密数字是什么！

***公平！公平！还是tmd，公平！***

好吧其实管理员完全可以复现一遍操作去将这个数字计算出来（因为哈希算法的源操作数一定，生成的结果也一定），这只能保证不知晓`magic_number`的人难以（或许比登天还难）知晓这个数字而已，诶嘿(≥v≤)。

顺带一提，这也就是著名的伪随机数漏洞，有兴趣的可以自行搜索。

另外，为了方便调试，我们这里的秘密数字差不多是公开的，可以在sui 浏览器被查到的，在实际的逻辑中，我们需要使用加密技术等方法去隐藏它，例如并不存储明文而是存储它的哈希值。

##### 用户存款

```rust
public entry fun deposit(game: &mut Game, input: Coin<FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
    let caller = tx_context::sender(ctx);
    let input_value = coin::value(&input); // 检查存入金额
    assert!(input_value >= amount, EInputNotEnough);

    // 转入资金池，处理找零
    let mut input_balance = coin::into_balance(input);
    if (input_value > amount) {
        balance::join(&mut game.game_pool, balance::split(&mut input_balance, amount));
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut game.game_pool, input_balance);
    };

    // 更新用户余额
    if (!table::contains(&game.users, caller)) {
        table::add(&mut game.users, caller, USER { balance: amount });
    } else {
        let user = table::borrow_mut(&mut game.users, caller);
        user.balance = user.balance + amount;
    };
    // 更新奖池余额
    game.pool = game.pool + amount;
}
```

在用户第一次存款时，我们将其加入到users表中，并将余额设置为其存入的COIN金额；若非第一次存款，则直接将其余额增加其存入金额。

用户存入的COIN将存入到pool中，等待最终的幸运儿来将它取走。

另外，由于用户必须有游戏币才能游玩游戏，所以我们将注册逻辑也集成在deposit函数中。

##### 猜数字

接下来，看看最重要的部分，我们游戏的主要逻辑：猜数字。

实际上，在将其余各结构体和函数设计完成后，这部分的编写是很自然而然的。

```rust
/// user guess
public entry fun make_guess(game: &mut Game, coin: Coin<FAUCET_COIN>, guess: u32, ctx: &mut TxContext) {
    game.attempts = game.attempts + 1;
    let caller = tx_context::sender(ctx);
    // base check
    assert!(game.secret_number != 0, EInvalid); 
    assert!(game.over != true, EHaveWon);       
    assert!(game.winner == address::from_u256(0), EHaveWon); 
    assert!(table::contains(&game.users, caller), ENotUser); 
    assert!(guess >= 1 && guess <= 100, EInvalid); 
    // check the balance
    let user = table::borrow_mut(&mut game.users, caller);
    assert!(user.balance >= game.cost_per_round, ECurrencyNotEnough); // currency not enough
    user.balance = user.balance - game.cost_per_round; // deduct the cost
    // input the balance into pool
    // let input_balance = coin::into_balance(coin);
    // balance::join(&mut game.game_pool, input_balance);
    // game.pool = game.pool + game.cost_per_round;
    // compare guess with secret number
        let secret_number = option::borrow(&game.secret_number);
        if (guess < *secret_number) {
        emit(GuessEvent::TooSmall); // too small
        } else if (guess > *secret_number) {
        emit(GuessEvent::TooBig); // too big
    } else {
        // guess correct
        emit(GuessEvent::Correct);
        // game over
        game.over = true;
        game.winner = caller;
        // get reward
        // let reward_balance = balance::split(&mut game.game_pool, user.balance); 
        // let reward = coin::from_balance(reward_balance, ctx);
        // NOTHING, OR EVERYTHING!!!
        let reward_balance = balance::split(&mut game.game_pool, 0);
        let reward = coin::from_balance(reward_balance, ctx);
        transfer::public_transfer(reward, caller);
        // give a NFT to winner
        move_nft::mint(b"TruE", b"Bless Alysia! from ctianming≥v≤", b"https://avatars.githubusercontent.com/u/107739505?v=4", caller, ctx);
    }
}
```

我们进行一系列检查，确保游戏仍在进行。随后扣去游玩者的费用，并进行检查，如果恰好命中，就给予该游玩者奖励。

##### 管理员功能
```rust
//withdraw Coin
    public entry fun withdraw(_: &AdminCap, game: &mut Game, amount: u64, ctx: &mut TxContext) {
        let output_balance = balance::split(&mut game.game_pool, amount);
        let output = coin::from_balance(output_balance, ctx);
        transfer::public_transfer(output, sender(ctx));
        game.pool = game.pool - amount;
    }

    //restart
    public entry fun restart(_: &AdminCap, game: &mut Game) {
        game.secret_number = option::none();
        game.attempts = 0;
        game.over = false;
        game.winner = address::from_u256(0);
    }

```

我们设计了withdraw函数和restart函数，使得管理员可以提走奖励池的资金和重启游戏。关于提走奖励池资金，这点很不公平，而且这个功能将导致根本不会有人来玩这个游戏了，但本节任务要求我们有withdraw函数。

##### 一些其他功能
```rust
//get faucet_coin
    public entry fun get_faucet_coin(
        treasury_cap:&mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        ctx: &mut TxContext) {
        faucet_coin::mint(treasury_cap,amount,tx_context::sender(ctx),ctx); 
    }
```
我们额外设计了一个get_faucet_coin接口，使得游玩者可以便捷地获取游戏币，非常滴人性化。

### 总结

- 核心功能：

    1. 存款：用户将资金存入游戏。
    2. 猜数字：用户尝试猜测随机生成的秘密数字。
    3. 奖励：猜对数字后，用户获得奖励金和 NFT。
- 关键点：

    1. 使用 balance::join 和 balance::split 操作资金池。
    2. 使用事件通知用户猜测结果。
    3. 通过 move_nft::mint 发放奖励 NFT。