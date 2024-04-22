
/// Module: task4
module task4::coin_flip {
    use std::string; 
    use sui::event;
    use sui::clock::{Self, Clock};

    const EInvaildNumber: u64 = 0xff;

    public struct GameEvent has drop, copy {
        input_number: u64,
        game_number: u64,
        output: string::String,
    }

    public fun guess(number: u64, clock: &Clock){
        assert!(number < 2, EInvaildNumber);
        let game_number = random(clock);

        let out_put = if (game_number == number) {
            string::utf8(b"You win!")
        } else {
            string::utf8(b"You lose...")
        };
        let game_event = GameEvent {
            input_number: number,
            game_number: game_number,
            output: out_put 
        };

        event::emit(game_event);
    }

    fun random(clock: &Clock): u64{
        let random_value = ((clock::timestamp_ms(clock) % 2) as u64);
        random_value
    }
}

