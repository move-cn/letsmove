module task4::guess_the_number {
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;

    const EInvalidGuess: u64 = 1;
    const EInvalidRange: u64 = 2;
    const MaxNumber: u8 = 5;  // maximum number to guess

    public struct GuessResultEvent has copy, drop {
        is_correct: bool,
        guess: u8,
        syyani_give_correct_number: u8,
        message: String,
    }

    // Function to get a random number within a given range
    fun get_random_number(clock: &Clock) : u8 {
        ((clock::timestamp_ms(clock) % (MaxNumber as u64 + 1)) as u8)
    }

    public fun play(guess: u8, clock: &Clock) {
        assert!(guess <= MaxNumber, EInvalidGuess);

        let syyani_give_correct_number = get_random_number(clock);
        let (message, is_correct) = if (guess == syyani_give_correct_number) {
            (string::utf8(b"Correct! You guessed the right number syyani give to you!"), true)
        } else {
            (string::utf8(b"Incorrect. Try again."), false)
        };

        event::emit(GuessResultEvent {
            message,
            is_correct,
            guess,
            syyani_give_correct_number,
        });
    }
}
