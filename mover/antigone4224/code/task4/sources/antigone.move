
module antigone::antigone 
 {
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;

    const EInvalidNumber: u64 = 1;

   public struct GamingResultEvent has copy, drop {
        is_win: bool,
        your_choice: String,
        antigone_choice: String,
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

        let antigone_choice = get_random_choice(clock);
        let (result, is_win) = if (
            (choice == 0 && antigone_choice == 0)
            || (choice == 1 && antigone_choice == 1)
            || (choice == 2 && antigone_choice == 2)
        ) {
            (string::utf8(b"Congratulations ,we have great rapport!"), true)
        }  else {
            (string::utf8(b"I'm sorry, we still need to work on our rapport."), false)
        };

        event::emit(GamingResultEvent {
            result,
            is_win,
            your_choice: map_choice_to_string(choice),
            antigone_choice: map_choice_to_string(antigone_choice),
        });
    }
}


