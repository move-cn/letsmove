module game::gameMoudle {
    use sui::object::{UID};
    use sui::coin;
    use sui::coin::{Coin, TreasuryCap};
    use sui::tx_context::TxContext;
    use sui::balance::{Balance};
    use std::string::String;
    use move_coin::faucet_coin::FAUCET_COIN;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{ share_object, public_transfer};

    public struct GamePool has key, store {
        id: UID,
        balance: Balance<FAUCET_COIN>,
        github_id: String, // 存储 GitHub ID
    }

    public fun new_game_pool(_treasury_cap: &TreasuryCap<FAUCET_COIN>, ctx: &mut TxContext){
        let pool = GamePool {
            id: sui::object::new(ctx),
            balance: sui::balance::zero<FAUCET_COIN>(),
            github_id: std::string::utf8(b"lifejwang11"),
        };
        share_object(pool);
    }

    public entry fun deposit(pool: &mut GamePool, coin: Coin<FAUCET_COIN>) {
        let add_balance = coin::into_balance(coin);
        pool.balance.join(add_balance);
    }

    public entry fun withdraw(pool: &mut GamePool, amount: u64, ctx: &mut TxContext){
        let remove_balance = pool.balance.split(amount);
        let remove_coin = coin::from_balance(remove_balance, ctx);
        public_transfer(remove_coin, ctx.sender());
    }

    public entry fun play_game(pool: &mut GamePool,r: &Random,guess: u8,bet: Coin<FAUCET_COIN>, ctx: &mut TxContext) {
        let play_num = bet.value();
        let pool_num = pool.balance.value();
        assert!(play_num <= pool_num,100);
        // 创建一个随机对象并使用它生成随机值
        let mut generator = random::new_generator(r, ctx);
        let random_value = generator.generate_u8_in_range(1, 2); // 生成0或1
        
        if (random_value == guess) {
            // 玩家赢了，获得双倍奖励
            let winning_coin = pool.balance.split(play_num);
            let win_coin = coin::from_balance(winning_coin, ctx);
            public_transfer(win_coin, ctx.sender());
            public_transfer(bet, ctx.sender());
        } else {
            // 玩家输了，下注金额添加到奖池
            deposit(pool, bet);
        }
    }
}
