/// Module: vv1133_game
module vv1133_game::vv1133_game {
    use std::string;
    use sui::clock::{Self, Clock};
    use sui::coin::{Self, TreasuryCap, Coin};
    use sui::balance::{Supply};
    use sui::event;
    use sui::tx_context::{Self, TxContext};
    use vv1133_faucet::vv1133_faucet::{Self, VV1133_FAUCET};

    const Small: u64 = 0;
    const Big: u64 = 1;

    const ErrInvalidGuess: u64 = 1;

    public struct GameOutcome has drop, copy {
        player_guess: u64,
        machine_result: u64,
        bets_amount: u64,
        outcome: string::String
    }

    public fun play(treasury_cap: &mut TreasuryCap<VV1133_FAUCET>, bets_coin: Coin<VV1133_FAUCET>,
                    guess: u64, clock: &Clock, ctx: &mut TxContext) {
        assert!(guess == Small || guess == Big, ErrInvalidGuess);
        let bets_amount = bets_coin.value();
        let result = random_result(clock);
        let outcome = if (guess == result) { true } else { false };
        let outcome_str = if (outcome) {
            string::utf8(b"vv1133_game WIN")
        } else {
            string::utf8(b"vv1133_game LOSE")
        };

        let game_outcome = GameOutcome {
            player_guess : guess,
            machine_result : result,
            bets_amount : bets_amount,
            outcome : outcome_str,
        };
        
        if (outcome) {
            vv1133_faucet::mint(treasury_cap, bets_amount * 2, tx_context::sender(ctx), ctx);
        };
        coin::burn(treasury_cap, bets_coin);

        event::emit(game_outcome);
    }

    fun random_result(clock: &Clock): u64 {
        clock::timestamp_ms(clock) % 2
    }
}
