/// Module: task4
module task4::Guess_Number_Game {
    use std::string::{String, utf8};

    use sui::clock::{Clock, timestamp_ms};
    use sui::coin::TreasuryCap;
    use sui::event::emit;
    use sui::math::pow;
    use sui::tx_context::{sender, TxContext};
    use task2::Kecson_Faucet_Coin;
    use task2::Kecson_Faucet_Coin::KECSON_FAUCET_COIN;

    const EInvalidValue: u64 = 1;
    const MAX_VALUE: u64 = 10;

    // fun init(ctx: &mut TxContext) {
    //     let obj = object::new(ctx);
    // }

    struct PlayGameEvent has copy, drop {
        publisher: String,
        player: address,
        actual_number: u64,
        expect_number: u64,
        result: bool,
        message: String,
    }

    fun get_random(clock: &Clock): u64 {
        let time = timestamp_ms(clock);
        let random_number = time % MAX_VALUE;
        random_number
    }

    public entry fun play_game(
        expect_number: u64,
        faucet_treasury_cap: &mut TreasuryCap<KECSON_FAUCET_COIN>,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        assert!(expect_number < MAX_VALUE, EInvalidValue);
        let actual_number = get_random(clock);
        let result = expect_number == actual_number;
        let message = if (result) {
            utf8(b"Congratulations 🎉, you guessed it.")
        } else {
            utf8(b"Unfortunately 😔, there was no right guess.")
        };

        let player = sender(ctx);

        //mint Faucet Coin as reward
        if (result) {
            Kecson_Faucet_Coin::mint(
                faucet_treasury_cap,
                pow(10, 9),
                player,
                ctx
            );
        };

        emit(
            PlayGameEvent {
                player,
                result,
                actual_number,
                expect_number,
                message,
                publisher: utf8(b"Kecson")
            }
        );
    }
}
