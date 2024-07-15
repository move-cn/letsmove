module w626w::rock_paper_scissors {
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;

    const EInvalidNumber: u64 = 1;

    public struct GamingResultEvent has copy, drop {
        is_win: bool,
        your_choice: String,
        computer_choice: String,
        result: String,
    }

    fun get_random_choice(clock: &Clock) : u8 {
        ((clock::timestamp_ms(clock) % 3) as u8)
    }

    fun map_choice_to_string(choice: u8) : String {
        if (choice == 0) {
            string::utf8(b"w626w rock")
        } else if (choice == 1) {
            string::utf8(b"w626w paper")
        } else if (choice == 2) {
            string::utf8(b"w626w scissors")
        } else {
            string::utf8(b"Invalid")
        }
    }

    public entry fun play(choice: u8, clock: &Clock) {
        assert!(choice < 3, EInvalidNumber);

        let computer_choice = get_random_choice(clock);
        let (result, is_win) = if (
            (choice == 0 && computer_choice == 1)
            || (choice == 1 && computer_choice == 2)
            || (choice == 2 && computer_choice == 0)
        ) {
            (string::utf8(b"w626w is Win"), true)
        } else if (choice == computer_choice) {
            (string::utf8(b"w626w is Draw"), false)
        } else {
            (string::utf8(b"w626w is Lose"), false)
        };

        event::emit(GamingResultEvent {
            result,
            is_win,
            your_choice: map_choice_to_string(choice),
            computer_choice: map_choice_to_string(computer_choice),
        });
    }
}
//sui client call --function play --module rock_paper_scissors --package 0xf2309c548c0dd2ca81ccde692b61c54ad91329bf472729cec09955e8d1730963 --args 1 0x6
