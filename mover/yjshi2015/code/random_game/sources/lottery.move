module random_game::lottery {

    /*
     * 奖池有初始资金，每次猜数时要支付任意数量的资金，猜对了拿走奖池的所有资金，猜错了支付的资金就被纳入奖池。
     * 例如：
     *      初始化奖池，1 SUI
     *      Alice 支付 2 SUI，猜错后，奖池变成 3 SUI
     *      Bob 支付 2 SUI，猜错后，奖池变成 5 SUI
     *      Eve 支付 2 SUI，猜对后，获得 5 + 2 = 7 SUI，游戏结束。
    */
    use sui::balance::Balance;
    use sui::sui::SUI;
    use sui::coin::{ Coin };
    use sui::balance;
    use sui::random::{ Self, Random };
    use sui::bcs::{ Self, BCS };
    use std::string::String;
    use sui::event;
    use std::hash;


    public struct LotteryGame has key {
        id: UID,
        // 加密后的谜底，hash(1～10之间的随机数)，它可以是任意内容的 hash
        secret: vector<u8>,
        // 明文谜底，仅用于测试
        plain_text: u8,
        // 奖池
        award_pool: Balance<SUI>,
    }

    public struct LOTTERY has drop {}

    public struct AdminCap has key, store {
        id: UID,
    }

    public struct GuessEvent has copy, drop {
        game_id: ID,
        game_result: String,
    }

    // step 1：初始化函数，生成 cap
    fun init(otw: LOTTERY, ctx: &mut TxContext) {
        let cap = AdminCap {
            id: object::new(ctx),
        };

        transfer::transfer(cap, ctx.sender());
    }

    // step 2: 只有 cap 可以初始化一个游戏，并利用 random 和 hash 来设置谜底
    public fun initializer(cap: &AdminCap, coin: Coin<SUI>, rand: &Random, ctx: &mut TxContext) {
        let (plain, secret) = generate_secret(rand, ctx);
        let game = LotteryGame {
            id: object::new(ctx),
            secret,
            plain_text: plain,
            award_pool: coin.into_balance(),
        };

        transfer::share_object(game);
    }

    // step 3: 参与者传入资金和答案，如果答案匹配则拿走所有资金，否则传入的资金进入奖池中
    public entry fun guess_game(game: &mut LotteryGame, coin: Coin<SUI>, answer: u8, ctx: &mut TxContext) {
        assert!(coin.value() > 0, 0);
        let game_id = borrow(game);
        let secret = borrow_secret(game);
        let pool = borrow_award_mut(game);
        balance::join(pool, coin.into_balance());

        let answer_hash = hash::sha3_256(bcs::to_bytes(&answer));
        if(answer_hash != secret) {
            event::emit(GuessEvent{
                game_id,
                game_result: b"Fail".to_string(),
            });
        } else {
            let award = pool.value();
            let award_balance = pool.split(award);
            transfer::public_transfer(award_balance.into_coin(ctx), ctx.sender());

            event::emit(GuessEvent{
                game_id,
                game_result: b"Success".to_string(),
            });
        }
    }

    // 生成谜底
    fun generate_secret(rand: &Random, ctx: &mut TxContext): (u8, vector<u8>) {
        let mut gen = random::new_generator(rand, ctx);
        let secret_u8 = random::generate_u8_in_range(&mut gen, 1, 10);
        (secret_u8, hash::sha3_256(bcs::to_bytes(&secret_u8)))
    }

    // ---------------- read data -------------------------
    fun borrow(game: &LotteryGame): ID {
        object::id(game)
    }

    fun borrow_secret(game: &LotteryGame): vector<u8> {
        let tmp = &game.secret;
        *tmp
    }

    fun borrow_award_mut(game: &mut LotteryGame): &mut Balance<SUI> {
        &mut game.award_pool
    }
}

