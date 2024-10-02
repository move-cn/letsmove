
/// Module: task4
module task4::kael777_game {
 use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::bcs;

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

    public entry fun pick_random_by_tx_hash(ctx:&TxContext) : u8{
        let tx_digest = tx_context::digest(ctx);
        let tx_digest_u64 = bcs::peel_u64(&mut bcs::new(*tx_digest));
        let random_index = tx_digest_u64 % 3;
        random_index as u8
    }

    fun map_choice_to_string(choice: u8) : String {
        if (choice == 0) {
            string::utf8(b"kael777_rock")
        } else if (choice == 1) {
            string::utf8(b"kael777_paper")
        } else if (choice == 2) {
            string::utf8(b"kael777_scissors")
        } else {
            string::utf8(b"Invalid")
        }
    }

    public entry fun play(choice: u8, clock: &Clock) {
        assert!(choice < 3, EInvalidNumber);

        let computer_choice = get_random_choice(clock);
        let (result, is_win) = if (
            (choice == 0 && computer_choice == 2)
            || (choice == 1 && computer_choice == 0)
            || (choice == 2 && computer_choice == 1)
        ) {
            (string::utf8(b"you Win kael777"), true)
        } else if (choice == computer_choice) {
            (string::utf8(b"you Draw kael777"), false)
        } else {
            (string::utf8(b"you Lose kael777"), false)
        };

        event::emit(GamingResultEvent {
            result,
            is_win,
            your_choice: map_choice_to_string(choice),
            computer_choice: map_choice_to_string(computer_choice),
        });
    }

}

// test net
// 0x6 is clock object
//sui client call --function play --module kael777_game --package 0x5915087002bc3f6b92f56493750ef9a04d0c43a55b32f8564fdfd815546e4988 --args 1 0x6

// main net
//sui client call --function play --module kael777_game --package 0xe2c9bbf4bd8da9f66a95cca911084a4d3b29157f9c131810b789d55447027570 --args 2 0x6
