module game::game {
    use sui::event;
    use std::string; 
    use sui::clock::{Self, Clock};

    const EInvaildNumber: u64 = 0;

    struct GameEvent has drop, copy {
        input_number: u64,
        game_number: u64,
        output: string::String,
    }

    public fun start(number: u64, clock: &Clock){
        assert!(number < 6, EInvaildNumber);
        let game_number = random(clock);
        if (game_number == number) {
            event::emit(GameEvent {
                input_number: number,
                game_number: game_number,
                output: string::utf8(b"Win")
            })
        } else {
            if (game_number == 0) {
                event::emit(GameEvent {
                    input_number: number,
                    game_number: game_number,
                    output: string::utf8(b"Win")
                })
            } else {
                event::emit(GameEvent {
                    input_number: number,
                    game_number: game_number,
                    output: string::utf8(b"lose...")
                })
            }
        }
    }

    public fun random(clock: &Clock): u64{
        let random_value = ((clock::timestamp_ms(clock) % 6) as u64);
        random_value
    }
}