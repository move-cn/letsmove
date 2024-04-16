module task4::kang_tossing_coin {

    use std::debug;
    use std::string;
    use sui::event;
    use sui::clock::{Self, Clock};

    const Head: u64 = 0;
    const Tail: u64 = 1;

    const EInvalidGuess: u64 = 1;

    public struct EGameOutcome has drop, copy {
        guess: u64,
        result: u64,
        outcome: string::String,
    }

    public fun play(guess: u64, clock: &Clock){
        assert!(guess == Head || guess == Tail, EInvalidGuess);
        let result = random(clock);
        let outcome = if (guess == result) {
            string::utf8(b"WIN!!!")
        } else {
            string::utf8(b"LOSE...")
        };
        event::emit(EGameOutcome { guess, result, outcome });
    }

    fun random(clock: &Clock): u64{
        let random_value = clock::timestamp_ms(clock) % 2;
        debug::print(&random_value);
        random_value
    }

}
