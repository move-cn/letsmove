module task4::game {
  use std::string;
  use sui::event;
  use sui::random::{Self, Random};

  public struct GameResultEvent has drop, copy {
    user_guess: u8,
    random_number: u8,
    result: string::String,
  }

  entry fun play(guess: u8, r: &Random, ctx: &mut TxContext) {
    assert!(guess < 10, 0);
    let mut generator = random::new_generator(r, ctx);
    let random_number = random::generate_u8_in_range(&mut generator, 1, 10);

    let result = if (random_number == guess) {
        string::utf8(b"you win")
    } else {
        string::utf8(b"you loss")
    };

    event::emit(GameResultEvent { user_guess: guess, random_number, result });
  }
}