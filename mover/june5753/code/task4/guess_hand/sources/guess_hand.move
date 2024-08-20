module task4::guess_hand {
    use std::ascii::{ String, string };
    use std::string;
    use sui::address;
    use sui::balance;
    use sui::balance::Balance;
    use sui::clock;
    use sui::clock::Clock;
    use sui::coin;
    use sui::coin::Coin;
    use sui::event::emit;
    use sui::math;
    use sui::object;
    use sui::random::Random;
    use sui::transfer;
    use sui::random;
    use sui::url;

    const ENOBALANCE: u64 = 0;
    const ENOTCORRECTHAND: u64 = 1;
    const ENOTCORRECTCHOOSE: u64 = 2;
    const ENOGUESS_HANDCOIN: u64 = 3;

    // 手势
    const ROCK: vector<u8> = b"rock";
    const SCISSOR: vector<u8> = b"scissor";
    const PAPER: vector<u8> = b"paper";

    const LEFT: vector<u8> = b"left";
    const RIGHT: vector<u8> = b"right";

    const MIST_PER_GUESS_HAND: u64 = 1_000_000_000;

    // 包含了游戏 ID 和用于游戏的代币余额
    public struct Game has key, store {
        id: UID,
        balance: Balance<GUESS_HAND>,
    }

    // 用于控制对游戏的访问，包含游戏 ID 和创建者地址
    public struct GameCap has key {
        id: UID,
        creator: address,
    }

    // 记录游戏结束时的赢家和地址
    public struct Game_Finished has copy, drop {
        winner: String,
        address: address,
    }


    public struct GUESS_HAND has drop {}

    fun init(otw: GUESS_HAND, ctx: &mut TxContext) {
        let game_cap = GameCap {
            id: object::new(ctx),
            creator: ctx.sender(),
        };

        let (mut treasury_cap, metadata) = coin::create_currency(
            otw,
            9,
            b"june5753",
            b"Bruce",
            b"Game coin",
            option::some(url::new_unsafe(string(b"https://avatars.githubusercontent.com/u/12596742?v=4"))),
            ctx
        );

        transfer::public_freeze_object(metadata);
        let coin = coin::mint(&mut treasury_cap, 100 * MIST_PER_GUESS_HAND, ctx);
        let balance = coin::into_balance(coin);

        let game = Game {
            id: object::new(ctx),
            balance,
        };

        transfer::freeze_object(game_cap);
        transfer::public_transfer(treasury_cap, ctx.sender());
        transfer::share_object(game);
    }

    fun check(hand: vector<u8>): bool {
        hand == ROCK || hand == SCISSOR || hand == PAPER
    }

    fun hand_to_number(hand: vector<u8>): u64 {
        if (hand == ROCK)
            0
        else if (hand == SCISSOR)
            1
        else
            2
    }

    fun number_to_hand(number: u64): vector<u8> {
        if (number == 0)
            ROCK
        else if (number == 1)
            SCISSOR
        else
            PAPER
    }

    fun roll(r: &Random, ctx: &mut TxContext): u64 {
        random::generate_u64_in_range(&mut random::new_generator(r, ctx), 0, 2)
    }

    // 用于生成随机数
    fun roll_clock(c: &Clock, ctx: &mut TxContext): u64 {
        clock::timestamp_ms(c) % 2
    }

    fun choose_to_number(hand: vector<u8>): u64 {
        if (hand == LEFT)
            0
        else
            1
    }

    // 用户获胜的条件
    fun user_win(user_hand: u64, robot_hand: u64): bool {
        user_hand == 0 && robot_hand == 1
            || user_hand == 1 && robot_hand == 2
            || user_hand == 2 && robot_hand == 0
    }

    public entry fun choose_hand(
        game_cap: &GameCap,
        game: &mut Game,
        hand: vector<u8>,
        clock: &Clock,
        ctx: &mut TxContext,
    ) {
        assert!(check(hand), ENOTCORRECTHAND);
        assert!(game.balance.value() > 0, ENOGUESS_HANDCOIN);

        let user_hand = hand_to_number(hand);
        let robot_hand = roll_clock(clock, ctx);

        let recipient = if (user_win(user_hand, robot_hand)) ctx.sender() else game_cap.creator;
        let winner = if (user_win(user_hand, robot_hand)) string(b"user") else string(b"robot");

        let new_balance = game.balance.split(MIST_PER_GUESS_HAND);
        let coin = coin::from_balance(new_balance, ctx);


        emit(Game_Finished {
            winner,
            address: recipient,
        });

        transfer::public_transfer(coin, recipient);
    }
}

// publish hash CbwmYEeVotCzNjqdhEZr7zLXSyMwpQfoDFzeri9kaadQ
// PackageId 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927

// GameCap 0xb17468edac6e88a071a7b42a3104562399011508c80940d42a671463f2d87799
// Game 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4

// sui client call --package 0xfd35101cf63fc015c6a6c8a90d718e88c01e6276e631b55cfbf6b37ba565a927 --module guess_hand --function choose_hand --args 0xb17468edac6e88a071a7b42a3104562399011508c80940d42a671463f2d87799 0x2106141ece4d9c9bf068e286f344b725c6f89526e04804f587f87966d77350d4 rock 0x6

// 切换到玩家
// sui client switch --address xxx

// 参考资料: https://learnblockchain.cn/article/7805

