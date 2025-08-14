module game::game {
  use std::string;
  use sui::event;
  use sui::clock::{Self, Clock};

  public struct GameResultEvent has drop, copy {
    user_guess: u64,
    random_number: u64,
    result: string::String,
  }

  public struct RandomResultEvent has drop, copy {
    random_result: u64,
  }

  fun get_random(clock: &Clock): u64 {
    let time = clock::timestamp_ms(clock);
    let random_number = time % 10;
    random_number
  }

  public entry fun play(guess: u64, clock: &Clock) {
    assert!(guess < 10, 0);

    let random_number = get_random(clock);
    
    let result = if (random_number == guess) {
        string::utf8(b"you win")
    } else {
        string::utf8(b"you loss")
    };

    event::emit(GameResultEvent { user_guess: guess, random_number, result });
  }
}
