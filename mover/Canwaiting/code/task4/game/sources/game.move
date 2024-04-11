module game::game{
    use std::string;
    use sui::event;
    use std::debug;
    use sui::clock::{Self, Clock};

    const EInvalidInput: u64 = 100;
    struct GameOutcome has drop, copy {
        player_number: u64,
        machine_number: u64,
        outcome: string::String,
    }

    public fun play(player_input: u64, clock: &Clock) {
        // 确保玩家输入在有效范围内
        assert!(player_input < 10, EInvalidInput);
        let machine_input = generate_random(10, clock);
        
        let outcome_str = if (player_input == machine_input) {
            string::utf8(b"恭喜你猜中了！")
        } else {
            string::utf8(b"很遗憾，没有猜中")
        };

        let outcome = GameOutcome {
            player_number: player_input,
            machine_number: machine_input,
            outcome: outcome_str,
        };

        event::emit(outcome);
    }


    public fun generate_random(max: u64, clock: &Clock): u64 {
        let timestamp = clock::timestamp_ms(clock);
        let random_value = timestamp % max;
        debug::print(&random_value);
        random_value
    }
}
