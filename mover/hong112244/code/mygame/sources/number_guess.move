module mygame::guess {
   use std::string; 
   use sui::event;
   use std::debug;
   use sui::tx_context::{Self, TxContext};
   use sui::clock::{Self, Clock};
   use mygame::score_ft::{Self,Counter};
   
   const EInvaildNumber: u64 = 1;

    struct GameOutPut has drop, copy {
        guess_number: u64,
        game_number: u64,
        score: u64,
        player: address,
        output: string::String,
    }

   fun init(_ctx: &mut TxContext) {
        // let obj = Obj {
        //     id: object::new(ctx)
        // };
        // transfer::transfer(obj, tx_context::sender(ctx))
    }

   public entry fun play(number: u64, user_counter: &mut Counter, clock: &Clock, ctx: &TxContext){
         // input 0 1 2
        assert!(number < 10, EInvaildNumber);
        let game_number = get_random(clock);
        let score = score_ft::count(user_counter);
        let game_result = string::utf8(b"player lose");

        if (game_number == number){
            score_ft::increment(user_counter);
            score = score+1;
            game_result = string::utf8(b"player win");
        };

        // game_result = if (game_number == game_number) {
        //     string::utf8(b"player win")
        // } else {
        //     string::utf8(b"player lose")
        // };
      
        let result = GameOutPut {
            guess_number: number,
            game_number: game_number,
            output: game_result,
            score,
            player: tx_context::sender(ctx)
        };

        event::emit(result);
    }

    public fun get_random(clock: &Clock):u64{
        let random_value = ((clock::timestamp_ms(clock) % 10) as u64);
        debug::print(&random_value);
        random_value
    }
  
}