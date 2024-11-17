/*
    123比大小：
    玩家先押注，往资金池存入一笔代币，需要验证玩家代币数量是否足够
    玩游戏输入1 2 3之一比大小
    胜：从资金池获取双倍押注代币，需要验证资金池余额是否足够
    平、负：不能获取代币
    资金池：所有玩家共享一个资金池，所有玩家存入的代币都在同一个资金池中
*/
module game::game {
    // 引入依赖
    use std::string::{String, utf8};
    use sui::coin::{Self, Coin};
    use sui::balance;
    use sui::balance::Balance;
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::table::drop;
    use share_coin::share_coin::{SHARE_COIN,mint};

    // 错误码--玩家输入数字是否符合要求
    const EInput: u64 = 1;
    // 错误码--玩家下注，玩家代币余额不足
    const ECoinEnough: u64 = 2;
    // 错误码--玩家获取代币，资金池代币余额不足
    const EPoolEnough: u64 = 3;

    // 资金池结构体
    public struct CoinPool has key {
        id: UID, // 资金池id
        name: String,
        balance: Balance<SHARE_COIN> // 资金池代币余额
    }

    // 胜负结果结构体
    public struct GamingResult has copy,drop {
        player: address, // 玩家
        player_number: u64, // 玩家数
        computer_number: u64, // 电脑数
        result: String,// 结果
        amount: u64, // 下注代币数量
    }

    // 存 结构体
    public struct DepositCoin has copy,drop {
        user: address, // 玩家
        coin: u64 // 代币数量
    }

    // 赢 结构体
    public struct WithdrawCoin has copy,drop {
        user: address, // 玩家
        coin: u64 // 代币数量
    }

    // 管理员 - 用于初始化游戏资金池和提取资金
    public struct AdminCap has key {
        id: UID
    }

    // 一次性见证结构体
    // public struct GAME has drop {}

    // 初始化
    fun init(ctx: &mut TxContext) {
        let coin_pool = CoinPool {
            id: object::new(ctx),
            name: utf8(b"123比大小"),
            balance: balance::zero(),
        };
        transfer::share_object(coin_pool);

        let admin_cap = AdminCap { id: object::new(ctx) };
        transfer::transfer(admin_cap, ctx.sender());
    }

    // 获取随机数方法
    fun get_random_num(clock: &Clock): u64 {
        ((clock::timestamp_ms(clock) % 3) as u64)
    }

    // 存 方法，向资金池存入一定量的代币，不能是全部转入
    public entry fun deposit(pool: &mut CoinPool, coin: Coin<SHARE_COIN>, amount:u64, ctx: &mut TxContext) {
        // 玩家要有足够代币下注
        let coin_value = coin.value();
        assert!(coin_value > amount, ECoinEnough);
        // 玩家代币
        let mut balance_coin = coin::into_balance(coin);
        // 分出下注代币到资金池
        pool.balance.join(balance_coin.split(amount));
        // 剩余代币返回玩家
        let refund_coin = coin::from_balance(balance_coin, ctx);
        transfer::public_transfer(refund_coin, ctx.sender());

        event::emit(DepositCoin {
            user: ctx.sender(),
            coin: amount,
        });
    }

    // 取 方法
    public entry fun withdrow(_:&AdminCap, pool: &mut CoinPool, amount: u64, ctx: &mut TxContext) {
        let coin = coin::take(&mut pool.balance, amount, ctx);
        let withdraw_coin = WithdrawCoin {
            user: ctx.sender(),
            coin: amount
        };
        transfer::public_transfer(coin, ctx.sender());
        event::emit(withdraw_coin);
    }

    // 玩游戏 参数：资金池、玩家数、代币、下注代币数量、时间、上下文
    public entry fun play(pool: &mut CoinPool, player_number: u64, amount:u64, clock: &Clock, ctx: &mut TxContext) {
        // 校验
        // 输入1 2 3之一
        assert!(player_number<=3, EInput);
        // 资金池代币余额可以支付玩家奖励
        assert!(pool.balance.value() > amount*2, EPoolEnough);

        // 获取随机数
        let random_num = get_random_num(clock);
        // 比较大小
        let mut result: String = b"".to_string();
        if (random_num > player_number) {
            result = b"负".to_string();
        }else if (random_num == player_number) {
            result = b"平".to_string();
        }else if (random_num < player_number) {
            result = b"胜".to_string();
        };
        // 处理奖励
        if(result == utf8(b"胜")) {
            // 资金池代币take
            let reward = coin::take(&mut pool.balance, amount * 2, ctx);
            transfer::public_transfer(reward, ctx.sender());
        };
        event::emit(GamingResult {
            player: ctx.sender(),
            player_number,
            computer_number: random_num,
            result,
            amount,
        });
    }
}

// 存
// package id:0xad370dc6dc2eade0473612af4f9990527b29bcf54f790b902c34568133767102
// pool id:0x675d61fdaf032e1951e24f860a481279a6bc16d08315aaa704e94bc3ccb11e93, coin id:0x7e2ad366a788d327f258fb6b22b66fad38f6d1d04ae5a96512579c53e41f6594
// sui client call --package 0xad370dc6dc2eade0473612af4f9990527b29bcf54f790b902c34568133767102 --module game --function deposit --args 0x675d61fdaf032e1951e24f860a481279a6bc16d08315aaa704e94bc3ccb11e93 0x7e2ad366a788d327f258fb6b22b66fad38f6d1d04ae5a96512579c53e41f6594 1

// 玩游戏
// sui client call --package 0xad370dc6dc2eade0473612af4f9990527b29bcf54f790b902c34568133767102 --module game --function play --args 0x675d61fdaf032e1951e24f860a481279a6bc16d08315aaa704e94bc3ccb11e93 1 1 0x0000000000000000000000000000000000000000000000000000000000000006

// 取
// sui client call --package 0xad370dc6dc2eade0473612af4f9990527b29bcf54f790b902c34568133767102 --module game --function withdrow --args 0x7167a72c5fd45f83a1423fbbdf150e15b8452767f89556d65a32000220672936 0x675d61fdaf032e1951e24f860a481279a6bc16d08315aaa704e94bc3ccb11e93 2