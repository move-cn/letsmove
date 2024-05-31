module game::game {

  use sui::coin::{Self, TreasuryCap,Coin};
  use std::string::{Self, String};
  use sui::clock::{Self, Clock};
  use faucet_coin::MY_F_COIN::{Self, MY_F_COIN};
  use std::debug::print;
  use sui::object::{Self, UID};

      public entry fun get_random_choice(clock: &Clock) : u8 {    
        let g = clock::timestamp_ms(clock);
        print(&g);   

       
        ((clock::timestamp_ms(clock) % 3) as u8)
    }

    public entry fun game(user_guess_num: u8, clock: &Clock, treasury_cap: &mut TreasuryCap<MY_F_COIN>, to: address) {
      let guess_num = get_random_choice(clock);
      if (guess_num == user_guess_num) {
        MY_F_COIN::mint(treasury_cap, 100, to ,ctx);
      }
    }

}
