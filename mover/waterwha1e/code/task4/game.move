module game::game {
    use std::string; 
    use sui::event;
    use std::debug;
    use sui::clock::{Self, Clock};

    const EInvaildNumber: u64 = 0xff;

    struct GameEvent has drop, copy {
        input_number: u64,
        game_number: u64,
        output: string::String,
    }

    public fun game_start(number: u64, clock: &Clock){
        assert!(number < 10, EInvaildNumber);
        let game_number = random(clock);

        if (game_number === number) {
            event::emit(GameEvent {
                input_number: number,
                game_number: game_number,
                output: string::utf8(b"Win")
            })
        } else {
            event::emit(GameEvent {
                input_number: number,
                game_number: game_number,
                output: string::utf8(b"Lose")
            })
        }
    }

    public fun random(clock: &Clock): u64{
        let random_value = ((clock::timestamp_ms(clock) % 10) as u64);
        debug::print(&random_value);
        random_value
    }
}