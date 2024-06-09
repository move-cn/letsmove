module task4::joy1102_game {
    use std::string;
    use sui::clock::{Self, Clock};
    use sui::coin::{TreasuryCap};
    use sui::balance::{Supply};
    use sui::event;
    use sui::tx_context::{Self, TxContext};
    use task2::joy1102_faucet_coin::{Self, JOY1102_FAUCET_COIN};

    const Small: u64 = 0;
    const Big: u64 = 1;

    const ErrInvalidGuess: u64 = 1;

    public struct GameOutcome has drop, copy {
        player_guess: u64,
        machine_result: u64,
        outcome: string::String
    }

    public fun play(treasury_cap: &mut TreasuryCap<JOY1102_FAUCET_COIN>, guess: u64, clock: &Clock, ctx: &mut TxContext) {
        assert!(guess == Small || guess == Big, ErrInvalidGuess);
        let result = random_result(clock);
        let outcome = if (guess == result) { true } else { false };
        let outcome_str = if (outcome) {
            string::utf8(b"you win the game")
        } else {
            string::utf8(b"game over")
        };

        let game_outcome = GameOutcome {
            player_guess : guess,
            machine_result : result,
            outcome : outcome_str,
        };
        
        if (outcome) {
            joy1102_faucet_coin::mint(treasury_cap, 1, tx_context::sender(ctx), ctx);
        };

        event::emit(game_outcome);
    }

    fun random_result(clock: &Clock): u64 {
        clock::timestamp_ms(clock) % 2
    }
}