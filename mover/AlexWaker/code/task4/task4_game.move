
// 目前该游戏仅支持两人对赌，且必须一个人猜正，一个人猜反
module task4_game::alexwaker_coin_game {

    use sui::balance;
    use sui::balance::{Balance, zero};
    use sui::coin::{Coin, into_balance, from_balance};
    //use sui::object;
    //use sui::coin;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, public_transfer};
    use sui::tx_context::{sender};
    use my_faucet_coin::alexwaker_faucet_coin::{ALEXWAKER_FAUCET_COIN};

    /// 记录玩家的下注数据
    public struct Bet has store, drop {
        //id: UID,
        player: address,    // 玩家地址
        guess: bool,        // true: 正, false: 反
        //val: Balance<ALEXWAKER_FAUCET_COIN>, // 玩家下注数量
    }

    /// 游戏的主状态
    public struct Game has key, store {
        id: UID,
        admin: address,                                // 管理员地址
        // treasury_cap: TreasuryCap<ALEXWAKER_FAUCET_COIN>, // 游戏币资金池
        bets: vector<Bet>,                            // 当前所有下注
        //bet_amount: u64,                              // 每次下注的固定金额
        val: Balance<ALEXWAKER_FAUCET_COIN>,          // 游戏总资金池 balance类型
    }
    fun init(ctx: &mut TxContext){
        let admin = ctx.sender();
        let game = Game {
            id: object::new(ctx),
            admin: admin,
            // treasury_cap: TreasuryCap::new(),
            // treasury_cap: TreasuryCap<ALEXWAKER_FAUCET_COIN>, // 指定泛型参数
            bets: vector::empty(),
            //bet_amount: 100000,
            val: zero(),
        };
        share_object(game);
    }
    /// 玩家质押
    public fun deposit(game: &mut Game, player: address, guess: bool, coin: Coin<ALEXWAKER_FAUCET_COIN>, ctx: &mut TxContext) {
        //assert!(coin.value() < game.bet_amount);
        let mut all_balance = into_balance(coin);
        //let in_balance = balance::split(&mut all_balance, game.bet_amount);
        balance::join(&mut game.val, all_balance);
        // game.treasury_cap.transfer(coin, ctx); // 使用 transfer 方法代替 deposit
        game.bets.push_back(Bet { player, guess });
    }
    // 即使同一个地址多次申请相同的 Faucet 代币，每次申请都会生成一个新的 Coin 对象
    /// 开始游戏，分配奖励
    public fun play(game: &mut Game, rand: &Random, ctx: &mut TxContext) {  //ctx是上下文，包含了调用者地址等等一系列信息，这是系统提供的
        assert!(ctx.sender() == game.admin); //只有调用者才能调用
        
        let mut gen = random::new_generator(rand, ctx);
        let _random_number = random::generate_u64(&mut gen);

        // 生成随机数并计算结果
            // 生成随机数并计算结果
        // let mut gen = random::new_generator(rand, ctx);
        let _result = random::generate_bool(&mut gen);
        //let random_number = random::generate_u64(ctx); // 使用 generate_u64 替代 rand
        //let result = random_number % 2 == 1; // 奇数为 true (正)，偶数为 false (反) // 奇数为 true (正)，偶数为 false (反)

        // 找到猜对的玩家
        let mut winner_address = @0xda46e2c5f929d6e0e748262137be920601ed7002971388e1de20e02af482e6fa;
        let mut len = vector::length(&game.bets);
        while (len > 0) {
            let bet = &game.bets[len - 1];
            if (bet.guess == _result) {
                winner_address = bet.player;
            };
            len = len - 1;
        }; // 循环查找当前获胜者
        

        // 分配奖励
        let coin_value = game.val.value();
        let win_balance = balance::split(&mut game.val, coin_value);
        let win_coin = from_balance(win_balance, ctx);
        public_transfer(win_coin, winner_address);
        //public_transfer(in, play_address);
        //let _win_balance = from_balance(game.val, ctx); // 赢得所有奖池
        //public_transfer(_win_balance, winner_address);
        // let total_prize = game.treasury_cap.balance();
        // if !winners.is_empty() {
        //     let prize_per_winner = total_prize / winners.length();
        //     for winner in &winners {
        //         let prize_coin = game.treasury_cap.withdraw(prize_per_winner, ctx);
        //         prize_coin.transfer(*winner, ctx);
        //     }
        // }

        // 清空下注记录
        // 没有清空记录，因此这个游戏是一次性的
        vector::pop_back(&mut game.bets);
        vector::pop_back(&mut game.bets);
    }

    /// 管理员提取资金
    public fun withdraw(game: &mut Game, amount: u64, ctx: &mut TxContext) {
        assert!(ctx.sender() == game.admin);
        assert!(game.val.value() >= amount);
        let admin_balance = balance::split(&mut game.val, amount); //分出一定数量的代币转给管理员 
        let admin_coin = from_balance(admin_balance, ctx);
        public_transfer(admin_coin, ctx.sender());
    }
}

// testnet
// random objectid 0x8
// admin address: 0x0fa9d9616f097057358f714f1a80078a1360fd1a954cc86426c62ea2a751eafc
// package id: 0x414fb59c145073d9bc6abd8f950a9cc98617d090379f8a87244e22c69b4a4d56
// game id: 0xc57e19f1a87743960d491540a774c6ab6dc5f7bf16fab0ad050ccdabdc6aeda9
// get faucet: sui client call --package 0x0414a27f58e752e8659c5e86d3b563f39b9e9cd40e15df8eb2e4c8512b86f3ec --module alexwaker_faucet_coin --function mint_in_my_module --args 0x72444a11f047f344a12770c1b65cf6ff7592b79a9d45e6b077b1180a6f118575 100000000 0x0fa9d9616f097057358f714f1a80078a1360fd1a954cc86426c62ea2a751eafc
// player1 address: 0x0fa9d9616f097057358f714f1a80078a1360fd1a954cc86426c62ea2a751eafc
// player1 alexwaker faucet id: 0x516476e617c1ae719204dd113fb640a4ab67ffaadbd347ffe06462d15eac9060 amount 100000000
// player2 address: 0x8ec99ae020e195d772b65296ad99d6d2f6743a091ee9acbbb56361e189e6b282
// player2 alexwaker faucet id: 0xa6b2cd86142002b7af5b7ab72c4d20b2259bf23ff9a81802873be27c4e5df9a9 amount 100000000
// deposit: sui client call --package <packageid> --module alexwaker_coin_game --function deposit --args <gameid> <player address> true/false <coinid>
// withdraw: sui client call --package <packageid> --module alexwaker_coin_game --function withdraw --args <gameid> amount(u64)
// play: sui client call --package <packageid> --module alexwaker_coin_game --function play --args <gameid> 0x8
// withdraw hash: GrCM2Hk5snnUuiGwHqp8APNvamB5sX9UKPKoey9jtjtB

// mainnet
// random objectid 0x8
// admin address: 0x0fa9d9616f097057358f714f1a80078a1360fd1a954cc86426c62ea2a751eafc
// package id: 0xd58b8295f6bcebbcb3b565cd2506fe547d663e71460fc35c8f77518b03d18172
// game id: 0xae7e2e98a3b2dc70adbf4e2c94bf92038ffc65f81846e75ac2adc5d93df54c13
// get faucet: sui client call --package 0x2adc11d7339def7528121fb6302719cc37e588e4ea2672851efa8180c29037e5 --module alexwaker_faucet_coin --function mint_in_my_module --args 0xe0c3f2fe67dfb2e47be028a8b3f4e9999c5aaac30adbc2523048d93f3f322622 100000000 0x0fa9d9616f097057358f714f1a80078a1360fd1a954cc86426c62ea2a751eafc
// player1 address: 0x0fa9d9616f097057358f714f1a80078a1360fd1a954cc86426c62ea2a751eafc
// player1 alexwaker faucet id: 0xcd0bac5add8f180a73820766cc2d2555f99ff730bef409975a2ad273981aecc1 amount 100000000
// player2 address: 0x8ec99ae020e195d772b65296ad99d6d2f6743a091ee9acbbb56361e189e6b282
// player2 alexwaker faucet id: 0xa13ff725c5684e3ac0cba12bb3e5f35f7d8144fb59d595a8663c0d6b3e896eaa amount 100000000
// palyer1 deposit hash: 3GaUrZiFRhb4pfp4W1HiaSKntPxvCdJk4w27SLfy6aEA
// palyer2 deposit hash: DqgzugvZvKzCtDgSNwQUFMR3Y4Bvv6uP5SUX3AkEXrNv
// withdraw hash: 5Kkc4ckL244b1UiqrpNgp36EfCpgkeoA62rtx148eVrC
// play hash: Efd8wLmV3QNkF74Cao7jtDu1UXk8r9vTwgzSt6hnKhxn

