module range::game {
    use sui::event;
    use std::string::{Self, String};
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin,TreasuryCap};
    use range::random;
    use sch678_faucet_coin::sch678_faucet_coin::{Self, SCH678_FAUCET_COIN};

    const ERROR_INPUT_NUM :u64 = 1;
    const EPoolNotEnough: u64 = 2;
    const EChipsTooBig: u64 = 3;
    const EInputNotEnough: u64 = 4;

    public struct AdminCap has key {
        id: UID
    }

    public struct GamePoll has key {
        id: UID,
        pool: Balance<SCH678_FAUCET_COIN>,
    }

    public struct Result has copy, drop {
        rangeYouChosed: String,
        randomNum: u64,
        msg: String,
        is_winner: bool
    }

    fun init(ctx: &mut TxContext) {
        let gamePoll = GamePoll {
            id: object::new(ctx),
            pool: balance::zero<SCH678_FAUCET_COIN>(),
        };
        transfer::share_object(gamePoll);
        let admin_cap = AdminCap {
            id: object::new(ctx)
        };
        transfer::transfer(admin_cap, tx_context::sender(ctx))
    }

    public entry fun deposit(gamePoll: &mut GamePoll, input: Coin<SCH678_FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        let input_value = coin::value(&input);
        assert!(input_value >= amount, EInputNotEnough);

        let mut input_balance = coin::into_balance(input);
        if (input_value > amount) {
            balance::join(
                &mut gamePoll.pool,
                balance::split(&mut input_balance, amount)
            );
            let change = coin::from_balance(input_balance, ctx);
            transfer::public_transfer(change, tx_context::sender(ctx));
        } else {
            balance::join(&mut gamePoll.pool, input_balance);
        }
    }

    public entry fun withdraw(_: &AdminCap, gamePoll: &mut GamePoll, amount: u64, ctx: &mut TxContext) {
        let output_balance = balance::split(&mut gamePoll.pool, amount);
        let output = coin::from_balance(output_balance, ctx);
        transfer::public_transfer(output, tx_context::sender(ctx));
    }

    /// selectedRange: 0 (over 50)
    /// selectedRange: 1 (under 50)
    /// selectedRange: 2 (between 25 and 75)
    /// selectedRange: 3 (between 0 and 25, or between 75 and 100)
    public entry fun start_game(selectedRange: u8, gamePoll: &mut GamePoll, chips: Coin<SCH678_FAUCET_COIN>, ctx: &mut TxContext){
        assert!((selectedRange == 0 
                || selectedRange == 1 
                || selectedRange == 2 
                || selectedRange == 3), ERROR_INPUT_NUM);

        let chips_value = coin::value(&chips);
        assert!(chips_value > 100, EChipsTooBig);
        let reward = chips_value * 2;
        assert!(reward < balance::value(&gamePoll.pool), EPoolNotEnough);
        let chips_balance = coin::into_balance(chips);
        balance::join(&mut gamePoll.pool, chips_balance);

        let randomNum = random::rand_u64_range(0, 100, ctx);

        let (resp, yourRange, is_winner) = if (selectedRange == 0) {
                if (randomNum >= 50) {
                    (string::utf8(b"50 ~ 100"), string::utf8(b"You Win"), true)
                } else {
                    (string::utf8(b"50 ~ 100"), string::utf8(b"Better luck next time!"), false)
                }
            }else if (selectedRange == 1) {
                if (randomNum <= 50) {
                    (string::utf8(b"0 ~ 50"), string::utf8(b"You Win"), true)
                } else {
                    (string::utf8(b"0 ~ 50"), string::utf8(b"Better luck next time!"), false)
                }
            }else if (selectedRange == 2) {
                if (randomNum >= 25 && randomNum <= 75) {
                    (string::utf8(b"25 ~ 75"), string::utf8(b"You Win"), true)
                } else {
                    (string::utf8(b"25 ~ 75"), string::utf8(b"Better luck next time!"), false)
                }
            }else if (selectedRange == 3) {
                if ((randomNum >= 0 && randomNum <= 25) 
                        || (randomNum >= 75 && randomNum <= 100)) {
                    (string::utf8(b"0 ~ 25 or 75 ~ 100"), string::utf8(b"You Win"), true)
                } else {
                    (string::utf8(b"0 ~ 25 or 75 ~ 100"), string::utf8(b"Better luck next time!"), false)
                }
            } else {
                (string::utf8(b"Invalid input number"), string::utf8(b"Invalid input number"), false)
            };

        if (is_winner) {
            let reward_balance = balance::split(&mut gamePoll.pool, reward);
            let reward = coin::from_balance(reward_balance, ctx);
            transfer::public_transfer(reward, tx_context::sender(ctx));
        };
 
        event::emit(
            Result{
                rangeYouChosed: yourRange,
                randomNum: randomNum,
                msg: resp,
                is_winner: is_winner
            }
        );
    }

    public entry fun get_faucet_coin(treasury_cap: &mut TreasuryCap<SCH678_FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        sch678_faucet_coin::mint_and_transfer(treasury_cap, amount, tx_context::sender(ctx), ctx);
    }

}

// GamePoll: 0x7357b2d0a3985a6a5b0a860c36b13dbdac628bb09465a9c5cf7354e7eae2040f