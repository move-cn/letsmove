module game::rock_paper_scissors {
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;

    const EInvalidNumber: u64 = 1;

    public struct GamingResultEvent has copy, drop {
        is_win: bool,
        your_choice: String,
        xunfragrant_choice: String,
        result: String,
    }

    fun get_random_choice(clock: &Clock) : u8 {
        ((clock::timestamp_ms(clock) % 3) as u8)
    }

    fun map_choice_to_string(choice: u8) : String {
        if (choice == 0) {
            string::utf8(b"rock")
        } else if (choice == 1) {
            string::utf8(b"paper")
        } else if (choice == 2) {
            string::utf8(b"scissors")
        } else {
            string::utf8(b"Invalid")
        }
    }

    public fun play(choice: u8, clock: &Clock) {
        assert!(choice < 3, EInvalidNumber);

        let xunfragrant_choice = get_random_choice(clock);
        let (result, is_win) = if (
            (choice == 0 && xunfragrant_choice == 1)
            || (choice == 1 && xunfragrant_choice == 2)
            || (choice == 2 && xunfragrant_choice == 0)
        ) {
            (string::utf8(b"Win"), true)
        } else if (choice == xunfragrant_choice) {
            (string::utf8(b"Draw"), false)
        } else {
            (string::utf8(b"Lose"), false)
        };

        event::emit(GamingResultEvent {
            result,
            is_win,
            your_choice: map_choice_to_string(choice),
            xunfragrant_choice: map_choice_to_string(xunfragrant_choice),
        });
    }
}
