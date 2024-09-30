module coingame::game {
   use std::string; 
   use sui::event;
   use std::debug;
   use sui::clock::{Self, Clock};
   
   const EInvaildNumber: u64 = 1;

   struct GameOutPut has drop, copy {
      you_number: u64,
      game_number: u64,
      output: string::String,
   }

   public fun play(number: u64, clock: &Clock){
         // input 0 1 2
        assert!(number < 3, EInvaildNumber);
        let game_number = get_random(clock);

        let game_result = if (game_number == 0) {
            0u64
        } else if (game_number < 4) {
            1u64
        } else {
            2u64
        };
      
        let out_put = if (game_number == 0 && number == 0) {
            string::utf8(b"BINGOOOO! Big Win")
        } else if (number == game_result) {
            string::utf8(b"you win")
        } else {
            string::utf8(b"you lose")
        };
        let result = GameOutPut {
            you_number: number,
            game_number: game_number,
            output: out_put 
        };

        event::emit(result);
    }

    public fun get_random(clock: &Clock):u64{
        let random_value = ((clock::timestamp_ms(clock) % 7) as u64);
        debug::print(&random_value);
        random_value
    }
  
}