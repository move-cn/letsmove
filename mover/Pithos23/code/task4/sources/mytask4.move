#[allow(lint(self_transfer))]
module task4::RockPaperScissors {

    use std::debug;
    use std::hash::sha3_256;
    use std::string;

    use mycoin::Pithos23Faucet::PITHOS23FAUCET;
    use sui::balance::{Self, Balance, zero};
    use sui::clock::{Self, Clock};
    use sui::coin::{Self, Coin};
    use sui::event;
    use sui::object;
    use sui::object::UID;
    use sui::transfer;
    use sui::tx_context::{Self, sender};

    // use std::string::{Self};
    // 假设PITHOS23币在0x1地址下，根据实际情况调整
    // 剪刀，石头和布分别用1，2，3表示
    const SCISSORS: u64 = 1;
    const ROCK: u64 = 2;
    const PAPER: u64 = 3;

    const EInvaildNumber: u64 = 1;
    const EPCInvaildNumber: u64 = 4;
    const EBanlanceNotEnough: u64 = 2;
    const ENotAuth: u64 = 3;
    const NAME: vector<u8> = b"Pithos23";
    const PITHOS_DECIMAL: u64 = 1000_000;


    public

    struct AdminCap has key {
        id: UID,
    }

    public

    struct Pool has key {
        id: UID,
        balance: Balance<PITHOS23FAUCET>,
        owner: address
    }

    // 记录每次游戏的结果
    public

    struct GameResult has copy, drop {
        player: address,
        computer: u64,
        player_choice: u64,
        reward: string::String,
    }


    fun init(ctx: &mut TxContext) {
        let adminCap = AdminCap {
            id: object::new(ctx)
        };
        let pool = Pool {
            id: object::new(ctx),
            balance: zero<PITHOS23FAUCET>(),
            owner: tx_context::sender(ctx)
        };
        transfer::transfer(adminCap, tx_context::sender(ctx));
        transfer::share_object(pool);
    }


    // 充值
    public entry fun depoist(pool: &mut Pool, depositCoin: Coin<PITHOS23FAUCET>, _: &mut TxContext) {
        let pay_balance = coin::into_balance(depositCoin);
        balance::join<PITHOS23FAUCET>(&mut pool.balance, pay_balance);
    }

    // 提现
    public entry fun withdraw(_: &AdminCap, pool: &mut Pool, ctx: &mut TxContext) {
        // let owner_address = object::id_address(adminCap);
        assert!(tx_context::sender(ctx) == pool.owner, ENotAuth);
        let spit_balance = balance::split(&mut pool.balance, 50 * PITHOS_DECIMAL);
        let pool_coin = coin::from_balance<PITHOS23FAUCET>(spit_balance, ctx);
        // object::delete(id);
        transfer::public_transfer(pool_coin, tx_context::sender(ctx));
    }

    // 游戏合约入口
    public entry fun play_game(choice: u64, pool: &mut Pool, clock: &Clock, ctx: &mut TxContext) {
        assert!(choice != SCISSORS && choice == ROCK && choice != PAPER, EInvaildNumber);
        // 假设电脑出的是石头，即为2 todo
        // let computer = ROCK;
        let computer = random(clock);
        assert!(computer == SCISSORS || computer == ROCK || computer == PAPER, EPCInvaildNumber);

        // 分析比赛结果
        let result = analyze_result(choice, computer);
        // 发奖励
        let result_msg = distribute_reward(result, pool, ctx);
        let result = GameResult {
            player: sender(ctx),
            computer: computer,
            player_choice: choice,
            reward: result_msg,
        };
        event::emit(result);
    }

    // 结果分析函数
    fun analyze_result(choice: u64, computer: u64): bool {
        if (choice == computer) return false;  // 平局
        if ((choice == SCISSORS && computer == PAPER) || (choice == ROCK && computer == SCISSORS)
            || (choice == PAPER && computer == ROCK)) return true;  // 胜利
        false // 失败
    }

    // 奖励派发函数
    fun distribute_reward(result: bool, pool: &mut Pool, ctx: &mut TxContext): string::String {
        let result_msg = string::utf8(b"Oh man! You lose,try it again.");
        if (result) {
            // 假设每次奖励为1个PITHOS23币，需要在PITHOS23币合约的上提供对应的mint_token函数 TODO
            let amount = pool.balance.
            value();
            assert!(amount == 0, EBanlanceNotEnough);

            // let mut win_coin = coin::take(&mut pool.balance, PITHOS_DECIMAL, ctx);
            let win_balance = balance::split(&mut pool.balance, PITHOS_DECIMAL);
            let win_coin = coin::from_balance(win_balance, ctx);
            // 发送奖励啦
            transfer::public_transfer(win_coin, sender(ctx));
            let result_msg2 = string::utf8(b"Hey bro, you win and you will get 1 Pithos23Faucet.");
            result_msg2
        }else {
            result_msg
        }
    }

    fun random(clock: &Clock): u64 {
        let val = sha3_256(NAME).
        pop_back() as u64;
        let random_value = ((clock::timestamp_ms(clock) * val % 3 + 1) as u64);
        debug::print(&random_value);
        random_value
    }
}

