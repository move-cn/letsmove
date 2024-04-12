module game::game {
    use std::string; 
    use sui::event;
    use sui::clock::{Self, Clock};

    const EInvaildNumber: u64 = 0;

    struct GameEvent has drop, copy {
        input_number: u64,
        game_number: u64,
        output: string::String,
    }

    public fun start(number: u64, clock: &Clock){
        assert!(number < 3, EInvaildNumber);
        let game_number = random(clock);
        if (game_number == number) {
            event::emit(GameEvent {
                input_number: number,
                game_number: game_number,
                output: string::utf8(b"Win")
            })
        } else {
            if (game_number == 1) {
                event::emit(GameEvent {
                    input_number: number,
                    game_number: game_number,
                    output: string::utf8(b"Win but lose...")
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
        let random_value = ((clock::timestamp_ms(clock) % 3) as u64);
        random_value
    }
}