module js_luck_number_game::js_luck_number_game {
    use js_faucet_coin::js_faucet_coin::JS_FAUCET_COIN;
    use sui::balance::{Self, Balance};
    use sui::coin;
    use sui::vec_map::{Self, VecMap};
    use sui::clock::{Self, Clock};
    use sui::random::{Self, Random};

    const EInvalidAmount: u64 = 1;
    const EAlreadyHasLuckNumber: u64 = 2;
    const EGameNotEnd: u64 = 3; // 游戏尚未结束
    const ENotWinner: u64 = 4; // 非中奖者

    const PRICE: u64 = 10_00; // ticket售价为10 JS_FAUCET_COIN(精度为2)
    const END_TIME: u64 = 5 * 60 * 1000; // 每轮游戏持续5分钟，终止后可以产生幸运数字
    const EXPIRE_TIME: u64 = 10 * 60 * 1000; // 如果已经产生幸运数字，且10分钟后中奖者未领取，则任何人均可领取奖励

    public struct LuckNumberGame has key {
        id: UID,
        // 游戏每隔5分钟一轮
        last_timestamp: u64,
        // 游戏玩家可以购买ticket，支付费用存入该池子
        vault: Balance<JS_FAUCET_COIN>,
        // 每轮游戏的获胜者将获得本轮游戏充值的所有奖金
        // 如果超过10分钟中奖者没有领取奖励，则任何人均可以领取
        winner_lucky_number: u64,
        // 记录玩家购买ticket编号与地址的映射
        owner_2_number: VecMap<address, u64>,
        // 参与人数
        participants: u64,
    }

    fun init(ctx: &mut TxContext) {
        let game = LuckNumberGame {
            id: object::new(ctx),
            last_timestamp: 0,
            vault: balance::zero(),
            winner_lucky_number: 0,
            owner_2_number: vec_map::empty(),
            participants: 0,
        };

        transfer::share_object(game)
    }

    // 类似deposit
    public entry fun buy_ticket(game: &mut LuckNumberGame, amount: &mut coin::Coin<JS_FAUCET_COIN>,  clock: &Clock, ctx: &mut TxContext) {
        // 每轮游戏当有第一个玩家参与时，设置last_timestamp
        if (game.last_timestamp == 0) {
            game.last_timestamp = clock::timestamp_ms(clock);
        };

        assert!(amount.value() > PRICE, EInvalidAmount);
        let paid = amount.split(PRICE, ctx);

        game.vault.join(coin::into_balance(paid));

        let recipient = ctx.sender();
        game.participants = game.participants + 1;
        game.owner_2_number.insert(recipient, game.participants);

    }

    // 每轮游戏结束后，首次调用该接口，将随机产生一个幸运数字，幸运数字对应的地址，将可以领取该奖励，如果超时10分钟，则任何人均可以领取
    entry fun get_lucky_number(game: &mut LuckNumberGame, rand: &Random, clock: &Clock, ctx: &mut TxContext) {
        // 游戏结束后方可产生幸运数字
        let current_timestamp = clock::timestamp_ms(clock);
        assert!(current_timestamp - game.last_timestamp > END_TIME, EGameNotEnd);

        // 已产生幸运数字
        assert!(game.winner_lucky_number == 0, EAlreadyHasLuckNumber);

        // 随机产生幸运数字
        let mut generator = random::new_generator(rand, ctx);

        game.winner_lucky_number = random::generate_u64_in_range(&mut generator, 1, game.participants);

        // 产生幸运数字后，重新计时，10分钟后可以任何人都领取奖励
        game.last_timestamp = clock::timestamp_ms(clock);
    }


    // 获取奖励
    public entry fun get_reward(game: &mut LuckNumberGame, clock: &Clock, ctx: &mut TxContext) {
        let current_timestamp = clock::timestamp_ms(clock);

        // 若未超时，只能中奖者领取
        if (current_timestamp - game.last_timestamp < EXPIRE_TIME) {
            assert!(game.winner_lucky_number == game.owner_2_number.get(&ctx.sender()), ENotWinner);
        };

        // 若已超时，任何人都能领取
        let amount = game.vault.value();
        let withdrawBalance = balance::split(&mut game.vault, amount);
        let reward_coin = coin::from_balance<JS_FAUCET_COIN>(withdrawBalance, ctx);
        transfer::public_transfer(reward_coin, ctx.sender());

        // 一旦奖励被领取，将重置游戏
        reset_game(game);
    }

    fun reset_game(game: &mut LuckNumberGame) {
        game.last_timestamp = 0;
        game.winner_lucky_number = 0;
        game.owner_2_number = vec_map::empty();
        game.participants = 0;
    }
}
