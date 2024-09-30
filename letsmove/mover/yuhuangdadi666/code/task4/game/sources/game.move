module game::game {

    use std::debug;
    use std::string;
    use sui::clock;
    use sui::clock::Clock;
    use sui::event;

    const ROCK: u64 = 0;
    const SCISSORS: u64 = 1;
    const PAPER: u64 = 2;
    const E_INVALID_GESTURE: u64 = 0;

    public struct GameOutcome has drop, copy {
        player_gesture: u64,
        machine_gesture: u64,
        outcome: string::String
    }

    public fun play(player_gesture: u64, clock: &Clock) {
        // Ensure player input is within valid range
        assert!(is_valid_gesture(player_gesture), E_INVALID_GESTURE);

        let machine_gesture = generate_random_gesture(clock);
        let outcome_message = determine_outcome(player_gesture, machine_gesture);

        let outcome = GameOutcome {
            player_gesture,
            machine_gesture,
            outcome: outcome_message,
        };

        event::emit(outcome);
    }

    fun is_valid_gesture(gesture: u64): bool {
        gesture == ROCK || gesture == SCISSORS || gesture == PAPER
    }

    fun generate_random_gesture(clock: &Clock): u64 {
        let timestamp = clock::timestamp_ms(clock);
        let random_value = timestamp % 3;
        debug::print(&random_value);
        random_value
    }

    fun determine_outcome(player_gesture: u64, machine_gesture: u64): string::String {
        if (player_gesture == machine_gesture) {
            string::utf8(b"Oh, it's a tie. (0: Rock, 1: Scissors, 2: Paper)")
        } else if (is_player_winner(player_gesture, machine_gesture)) {
            string::utf8(b"Congratulations, you won! (0: Rock, 1: Scissors, 2: Paper)")
        } else {
            string::utf8(b"Sorry, you lost. (0: Rock, 1: Scissors, 2: Paper)")
        }
    }

    fun is_player_winner(player_gesture: u64, machine_gesture: u64): bool {
        (player_gesture + 1) % 3 == machine_gesture
    }
}
