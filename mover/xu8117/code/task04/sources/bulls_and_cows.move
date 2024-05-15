module task04::bulls_and_cows {
    use std::string::{Self, String};

    use sui::balance;
    use sui::balance::Balance;
    use sui::clock::Clock;
    use sui::coin;
    use sui::coin::Coin;
    use sui::event;
    use sui::object;
    use sui::transfer::{public_transfer, share_object};
    use sui::tx_context::{sender, TxContext};
    use mycoin::xu8117faucetcoin::XU8117FAUCETCOIN;

    const InvalidNumber: u64 = 1;

    public struct GamingResultEvent has copy, drop {
        is_win: bool,
        your_number: u32,
        computer_number: u32,
        result: String,
    }

    public struct Bank has key {
        id: UID,
        xu8117faucetcoin: Balance<XU8117FAUCETCOIN>
    }

    fun init(ctx: &mut TxContext) {
        let bank = Bank {
            id: object::new(ctx),
            xu8117faucetcoin: balance::zero<XU8117FAUCETCOIN>()
        };

        share_object(bank);
    }

    public entry fun deposit(bank: &mut Bank, xu8117faucetcoin: Coin<XU8117FAUCETCOIN>, _: &mut TxContext) {
        let xu8117faucetcoin_balance = coin::into_balance(xu8117faucetcoin);
        balance::join(&mut bank.xu8117faucetcoin, xu8117faucetcoin_balance);
    }

    public entry fun withdraw(bank: &mut Bank, amount: u64, ctx: &mut TxContext) {
        let xu8117faucetcoin_balance = balance::split(&mut bank.xu8117faucetcoin, amount);
        let xu8117faucetcoin = coin::from_balance(xu8117faucetcoin_balance, ctx);
        public_transfer(xu8117faucetcoin, sender(ctx));
    }

    fun get_random_number(clock: &Clock): u32 {
        ((sui::clock::timestamp_ms(clock) % 2) as u32)
    }

    #[test]
    public fun test() {
        let number: u32 = 5;
        assert!(number > 1, InvalidNumber);
        assert!(number < 10, InvalidNumber);
        assert!(number > 1 && number < 10, InvalidNumber);
    }

    public fun play(bank: &mut Bank, guess_number: u32, clock: &Clock, ctx: &mut TxContext) {
        assert!(guess_number >= 0 && guess_number <= 1, InvalidNumber);

        let target_digit = get_random_number(clock);
        let (result, is_win) = if (guess_number == target_digit) {
            (string::utf8(b"congratulation, you are win."), true)
        } else {
            (string::utf8(b"Unfortunately, your guess was not correct."), false)
        };

        if (is_win) {
            let amount: u64 = 1000000;
            withdraw(bank, amount, ctx);
        };

        event::emit(GamingResultEvent {
            result,
            is_win,
            your_number: guess_number,
            computer_number: target_digit,
        });
    }
}