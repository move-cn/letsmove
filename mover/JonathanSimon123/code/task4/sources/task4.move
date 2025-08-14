module task4::DiceGame {
    use sui::balance::{Self, Balance};
    use sui::event;
    use sui::coin::{Self, Coin};
    use sui::tx_context::sender;
    use sui::tx_context::TxContext;
    use task2::FCOIN::FCOIN;

    const MAX_DICE_NUMBER: u64 = 6;
    const EInsufficientBalance: u64 = 0;


    public struct GameRecord has drop, copy {
        user_input: u64,
        real_number: u64,
        win: bool,
        github_id: vector<u8>,
    }

    public struct RewardPool has key {
        id: UID,
        total_stake: Balance<FCOIN>,
    }

    public entry fun init_pool(coin: Coin<FCOIN>, ctx: &mut TxContext) {
        let uid = object::new(ctx);
        let initial_coin =  coin::into_balance(coin);
        let pool = RewardPool { id: uid, total_stake: initial_coin };
        transfer::share_object(pool);
    }

    public entry fun play(user_input: u64, github_id: vector<u8>,pool: &mut RewardPool, ctx: &mut TxContext) {
        let time_now = tx_context::epoch_timestamp_ms(ctx);
        let real_number = (time_now % MAX_DICE_NUMBER) + 1;

        let win = real_number == user_input;
        let record = GameRecord {
            user_input,
            real_number,
            win,
            github_id,
        };
        event::emit(record);

        if (win) {
            let reward = 1; // 这里定义一个固定的奖励金额
            let reward_balance = balance::split(&mut pool.total_stake, reward);
            let reward_coin = coin::from_balance(reward_balance, ctx);
            // 将奖励发放给用户
             transfer::public_transfer(reward_coin, sender(ctx));
        }
    }
}
