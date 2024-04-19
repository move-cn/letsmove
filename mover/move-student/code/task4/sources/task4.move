module task4::guess_dice_game {
    use std::string;
    use sui::event;
    use sui::clock::{Self,Clock};

    const EInvalidValue: u64 = 0;
    const MAXVALUE: u64 = 6;

    // record
    public struct RecordDiceModel has drop, copy {
        user_number: u64,
        random_number: u64,
        result: bool,
        action: string::String,
        github: string::String,
    }

    // random
    fun get_random(clock: &Clock): u64{
        let random_number = ((clock::timestamp_ms(clock) % MAXVALUE) as u64);
        random_number
    }

    // commit run
    public entry fun run(guess: u64, clock: &Clock) {
        assert!(guess < MAXVALUE, EInvalidValue);
        let random = get_random(clock);
        let result = (guess == random);
        let message = if (result) {
            string::utf8(b"movestudent win")
        } else {
            string::utf8(b"movestudent failed")
        };

        event::emit(RecordDiceModel{user_number: guess, random_number: random, result, action: message, github: string::utf8(b"movestudent")});
    }
}


