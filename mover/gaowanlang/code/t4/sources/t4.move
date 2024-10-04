/// Module: t4 随机数游戏
module t4::game {
    use std::string::{String, utf8};
    use sui::balance::{Self, Balance};

    use sui::clock::{Clock, timestamp_ms};
    use sui::coin;
    use sui::coin::{Coin};
    use sui::event;
    use sui::object::{new as obj_new };
    use sui::transfer::{public_transfer, share_object, transfer};
    use sui::tx_context::sender;

    //无效的数字
    const EInvalidNumber: u64 = 1;
    //输入金额不足
    const ENotEnoughInput: u64 = 2;
    //资金池余额不足
    const ENotEnoughPool: u64 = 3;


    //游戏结果事件
    public struct GameResultEvent has copy, drop {
        is_win: bool,
        you_choice: String,
        computer_choice: String,
        result: String,
    }

    //游戏
    public struct Game<phantom T> has key {
        id: UID,
        //资金池
        pool: Balance<T>,
        //门票,单次play需要消耗的金额
        ticket: u64,
        //奖金
        reward: u64,
    }

    //管理员权限凭证 能力
    public struct AdminCap has key { id: UID }


    //使用全局时钟 来获取随机数
    fun get_random_choice(clock: &Clock): u8 {
        ((timestamp_ms(clock) % 3) as u8)
    }

    fun map_choice_to_string(choice: u8): String {
        if (choice == 0) {
            utf8(b"rock")
        } else if (choice == 1) {
            utf8(b"paper")
        } else if (choice == 2) {
            utf8(b"scissors")
        } else {
            utf8(b"Invalid")
        }
    }

    //创建游戏
    //调用的时候,Type0传入 [PackageId::module_id::对象]
    //例如0xebe9e54c5199b46c8aefc685bd94ff0c174ce7d1c448819f08ba061cdb80d7b2::faucet_coin::FAUCET_COIN
    public entry fun create_game<T>(ctx: &mut TxContext) {
        let game = Game {
            id: obj_new(ctx),
            pool: balance::zero<T>(),
            ticket: 100,
            reward: 200,
        };
        share_object(game);
        let admin_cap = AdminCap { id: obj_new(ctx) };
        //将管理员能力转移给函数调用者
        transfer(admin_cap, sender(ctx));
    }

    //这个函数没有限制谁能玩,只要你有Game<T>中对应的Coin,你就能玩
    //clock传入0x6 源码 clock.move，其中关于 Clock 有一段注释。解释了 Clock 是一个单例共享对象，
    // 为 Move 的调用提供时间。该对象的地址为 0x6，只能由入口函数独取（通过不可变引用访问）
    //(注意,持有的input会变动,会有多个,类似于UTXO)
    public entry fun play<T>(choice: u8, game: &mut Game<T>, input: Coin<T>, clock: &Clock, ctx: &mut TxContext) {
        //判断资金池余额是否足够支付奖金
        assert!(balance::value(&game.pool) >= game.reward - game.ticket, ENotEnoughPool);

        assert!(choice < 3, EInvalidNumber);

        //扣除门票
        {
            let input_value = coin::value(&input);
            //判断余额是否足够支付门票
            assert!(input_value >= game.ticket, ENotEnoughInput);
            //将余额从coin中解构
            let mut init_balance = coin::into_balance(input);
            if (input_value > game.ticket) {
                //将门票钱存入游戏的余额中
                balance::join(
                    &mut game.pool,
                    //拆出单据游戏需要使用的门票额度
                    balance::split(&mut init_balance, game.ticket)
                );
                //将剩下的余额打包回coin
                let change = coin::from_balance(init_balance, ctx);
                //将剩余的余额转给调用者
                public_transfer(change, sender(ctx));
            }else {
                //将余额存入游戏的余额中
                balance::join(&mut game.pool, init_balance);
            };
        };

        //计算结果
        {
            let computer_choice = get_random_choice(clock);//获取电脑的选择
            let (result, is_win) = if (
                (choice == 0 && computer_choice == 1)
                    || (choice == 1 && computer_choice == 2)
                    || (choice == 2 && computer_choice == 0)
            ) {
                (utf8(b"Win"), true)
            } else if (choice == computer_choice) {
                (utf8(b"Draw"), false)
            } else {
                (utf8(b"Lose"), false)
            };

            //赢了,结算奖金
            if (is_win) {
                let reward_balance = balance::split(&mut game.pool, game.reward);
                //将金额打包成coin
                let reward_coin = coin::from_balance(reward_balance, ctx);
                //将coin转给调用者
                public_transfer(reward_coin, sender(ctx));
            };

            event::emit<GameResultEvent>(GameResultEvent {
                is_win,
                you_choice: map_choice_to_string(choice),
                computer_choice: map_choice_to_string(computer_choice),
                result,
            });
        };
    }

    //存
    //game传入调用create_game后返回的game对象的ObjectId,不要弄错了,create_game创建了两个对象
    //input传入
    //在浏览器中找到TYPE是0x2::coin::Coin<Package_ID::faucet_coin::FAUCET_COIN>的值
    //(注意,持有的input会变动,会有多个,类似于UTXO)
    public entry fun deposit<T>(game: &mut Game<T>, input: Coin<T>, amount: u64, ctx: &mut TxContext) {
        //你持有的这个币的币 必须要比你充的金额大或者相等
        let input_value = coin::value(&input);
        assert!(input_value >= amount, ENotEnoughInput);

        //将余额从coin中拆出来
        let mut into_balance = coin::into_balance(input);
        if (input_value > amount) {
            balance::join(
                &mut game.pool,
                balance::split(&mut into_balance, amount)
            );
            //将余额 包装成币,方便转移
            let change = coin::from_balance(into_balance, ctx);
            public_transfer(change, sender(ctx));
        }else {
            //不用找零,直接存到池子中
            balance::join(&mut game.pool, into_balance);
        }
    }

    //取
    public entry fun withdraw<T>(_: &AdminCap, game: &mut Game<T>, amount: u64, ctx: &mut TxContext) {
        let output_balance = balance::split(&mut game.pool, amount);
        let output = coin::from_balance(output_balance, ctx);
        public_transfer(output, sender(ctx));
    }

    //设置单次游戏门票 金额
    public entry fun set_ticket<T>(_: &AdminCap, game: &mut Game<T>, ticket: u64, _: &mut TxContext) {
        game.ticket = ticket;
    }

    //设置单次游戏奖金 金额
    public entry fun set_reward<T>(_: &AdminCap, game: &mut Game<T>, reward: u64, _: &mut TxContext) {
        game.reward = reward;
    }
}
