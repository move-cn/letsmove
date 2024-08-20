/*
    123比大小：玩家先押注，往资金池存入一笔代币，玩游戏输入1 2 3之一比大小
    胜：从资金池获取双倍押注代币；平、负：不能获取代币
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
    use share_coin::share_coin::{SHARE_COIN};

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
        get_coin: u64, // 赢取代币数量
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

    // 存 方法，相当于把所有代币存入资金池
    public entry fun deposit(pool: &mut CoinPool, coin: Coin<SHARE_COIN>, ctx: &mut TxContext) {
        let value = coin.value();
        pool.balance.join(coin::into_balance(coin));
        event::emit(DepositCoin {
            user: ctx.sender(),
            coin: value,
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
    public entry fun play(pool: &mut CoinPool, player_number: u64, coin: Coin<SHARE_COIN>, amount:u64, clock: &Clock, ctx: &mut TxContext) {
        let coin_value = coin.value();
        // 校验
        // 输入1 2 3之一
        assert!(player_number<=3, EInput);
        // 玩家代币数量满足下注
        assert!(coin_value < amount, ECoinEnough);
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
        // 获取代币总额
        let mut balance_coin = coin::into_balance(coin);
        // 代币总额大于下注金额，返回剩余的代币
        if(coin_value > amount) {
            // 如果下注代币价值大于下注金额，则将剩余代币价值退还给玩家
            pool.balance.join(balance_coin.split(amount));
            let refund_coin = coin::from_balance(balance_coin, ctx);
            transfer::public_transfer(refund_coin, ctx.sender());
        }else {
            pool.balance.join(balance_coin);
        };

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
            get_coin: amount*2,
        });
    }
}

// 存
// export MINTRECORD="0xca28c8d82f4e401aa47de7ea57ccea32d82287248658024b5f565f66ec018f8b"
// export NFT="0xfb7a0ce92433679e464f915381a63030d36ac5909e260e2a21cfaab681b97123"
// sui client call --package $PACKAGE --module $MODULE --function burn --args $MINTRECORD $NFT