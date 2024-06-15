/// Module: gametest
module gametest::gametest {
    use std::string; 
    use sui::event;
    use sui::clock::{Self, Clock};

    const EInvaildNumber: u64 = 1;

    struct GameEvent has drop, copy {
        input_number: u64,
        game_number: u64,
        output: string::String,
    }

    fun random(clock: &Clock): u64{
        let random_value = ((clock::timestamp_ms(clock) % 100) as u64);
        random_value
    }

    public fun game_start(number: u64, clock: &Clock){
        assert!(number < 100, EInvaildNumber);
        let game_number = random(clock);

        if (game_number == number) {
            event::emit(GameEvent {
                input_number: number,
                game_number: game_number,
                output: string::utf8(b"big win!!!")
            })
        } else if (game_number > 50) {
            event::emit(GameEvent {
                input_number: number,
                game_number: game_number,
                output: string::utf8(b"win")
            })
        } else {
            event::emit(GameEvent {
                input_number: number,
                game_number: game_number,
                output: string::utf8(b"try again")
            })
        }
    }
}
