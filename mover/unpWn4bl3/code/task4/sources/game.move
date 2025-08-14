module task4::game{
    // use sui::tx_context::{TxContext};
    use std::string;
    // use sui::random::{Self};
    use sui::event;
    use sui::clock::{Self,Clock};

    const InvalidGuess:u64 =0;

    struct GameResultEvent has drop, copy{
        user_guess: string::String,
        random_number: u64,
        result: string::String,
    }

    // fun get_random(ctx:&mut TxContext):u64 {
    //     let generator = random::new_generator(random::Random,ctx);
    //     random::generate_u64(&mut generator)
    // }

    fun get_random(clock:&Clock):u64{
        let time = clock::timestamp_ms(clock);
        let random_number = time % 10;
        random_number
    }

    // public entry fun play(guess:u64,ctx:&mut TxContext){
    public entry fun play(guess:u64, clock:&Clock){
        assert!(guess < 2,InvalidGuess);
        let user_guess = if (guess==0){
            string::utf8(b"even")
        } else{
            string::utf8(b"odd")
        };

        // let random_number = get_random(ctx);
        let random_number = get_random(clock);
        let result = if (random_number % 2 == guess){
            string::utf8(b"You win")
        } else{
            string::utf8(b"You lose")
        };

        event::emit(GameResultEvent{
            user_guess,
            random_number,
            result,
        });
    }
}