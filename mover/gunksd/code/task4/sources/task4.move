/// Module: game
module task4::gunksdgame {
    use std::string; 
    use sui::event;
    use std::debug;
    use sui::clock::{Self, Clock};

    const EInvaildNumber: u64 = 0xff;

    public struct GameEvent has drop, copy {
        input_number: u64,
        game_number: u64,
        output: string::String,
    }

    public fun game_start(number: u64, clock: &Clock){
        assert!(number < 3, EInvaildNumber);
        let game_number = random(clock);

        let out_put = if (game_number == number && game_number == 0u64) {
            string::utf8(b"WTF? ")
        } else if (game_number == number) {
            string::utf8(b"Good! You win!")
        } else {
            string::utf8(b" you lose...")
        };
        let game_event = GameEvent {
            input_number: number,
            game_number: game_number,
            output: out_put 
        };

        event::emit(game_event);
    }

    public fun random(clock: &Clock): u64{
        let random_value = ((clock::timestamp_ms(clock) % 3) as u64);
        debug::print(&random_value);
        random_value
    }
}