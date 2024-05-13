module task04::bulls_and_cows {
    use std::string::{Self, String};

    use sui::clock::Clock;
    use sui::coin::TreasuryCap;
    use sui::event;
    use sui::tx_context::{Self, TxContext};
    use mycoin::xu8117faucetcoin::{Self, XU8117FAUCETCOIN};

    const InvalidNumber: u64 = 1;

    public struct GamingResultEvent has copy, drop {
        is_win: bool,
        your_number: u32,
        computer_number: u32,
        result: String,
    }

    fun get_random_number(clock: &Clock): u32 {
        let last_digit = ((sui::clock::timestamp_ms(clock) % 10) as u8);
        ((last_digit + 1) as u32)
    }

    public fun play(treasury_cap: &mut TreasuryCap<XU8117FAUCETCOIN>, number: u32, clock: &Clock, ctx: &mut TxContext) {
        assert!(number < 1 || number > 10, InvalidNumber);

        let target_digit = get_random_number(clock);
        let (result, is_win) = if (number == target_digit) {
            (string::utf8(b"congratulation, you are win"), true)
        } else {
            (string::utf8(b"Unfortunately, your guess was not correct."), false)
        };

        if (is_win) {
            let guesser_address = tx_context::sender(ctx);
            xu8117faucetcoin::mint(treasury_cap, 10, guesser_address, ctx);
        };

        event::emit(GamingResultEvent {
            result,
            is_win,
            your_number: number,
            computer_number: target_digit,
        });
    }
}