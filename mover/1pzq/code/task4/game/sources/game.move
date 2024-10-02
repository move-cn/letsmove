module game::game_pzq {
    use std::string;
    use sui::clock::{Self, Clock};
    use sui::coin::{TreasuryCap};
    use sui::event;
    use game::coinfacet::{Self, COINFACET};

    const Small: u64 = 0;
    const Big: u64 = 1;

    const ErrInvalidGuess: u64 = 1;

    public struct GameOut has drop, copy {
        player_guess: u64,
        machine_result: u64,
        outcome: string::String
    }


    fun random_result(clock: &Clock): u64 {
        clock::timestamp_ms(clock) % 2
    }

    public fun playGame(treasury_cap: &mut TreasuryCap<COINFACET>, guessNum: u64, clock: &Clock, ctx: &mut TxContext) {
        assert!(guessNum == Small || guessNum == Big, ErrInvalidGuess);
        let result = random_result(clock);
        let outcome = if (guessNum == result) { true } else { false };
        let finalResult = if (outcome) {
            string::utf8(b"you win this game")
        } else {
            string::utf8(b"You lost this game")
        };

        let game_outcome = GameOut {
            player_guess : guessNum,
            machine_result : result,
            outcome : finalResult,
        };
        
        if (outcome) {
            coinfacet::mint(treasury_cap,ctx);
        };

        event::emit(game_outcome);
    }
}
/*
packageId
*/