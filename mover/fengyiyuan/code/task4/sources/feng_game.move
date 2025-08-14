
/// Module: task4
module task4::feng_dice_game {

    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;

    const EInvalidNumber: u64 = 1;

    public struct FGResultEvent has copy, drop {
        win_flag: bool,
        your_guess: String,
        lottery_num: u8,
        remark: String,
    }

    fun start_lottery(clock: &Clock) : u8 {
        ((clock::timestamp_ms(clock) % 6) as u8)
    }

    fun map_guess_to_string(guess: u8) : String {
        if (guess == 0) {
            string::utf8(b"SMALL")
        } else {
            string::utf8(b"BIG")
        }
    }

    public fun play(guess: u8, clock: &Clock) {
        assert!(guess < 2, EInvalidNumber);

        let lotteryCode = start_lottery(clock);
        let (remark, win_flag) = 
            if ((guess == 0 && lotteryCode <= 2) || (guess == 1 && lotteryCode > 2)) {
                (string::utf8(b"You Win"), true)
            } else {
                (string::utf8(b"Sorry, Yor Lose"), false)
            };

        event::emit(FGResultEvent {
            remark,
            win_flag,
            your_guess: map_guess_to_string(guess),
            lottery_num: lotteryCode + 1,
        });
    }

}

