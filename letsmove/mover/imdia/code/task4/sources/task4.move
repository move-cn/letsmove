/// Module: task4
module task4::game {
  use std::string::{Self, String};
  use sui::clock::{Self, Clock};
  use sui::coin::{Self, Coin, from_balance, into_balance};
  use sui::balance::{Self, Balance};
  use sui::tx_context::{Self, TxContext, sender};
  use sui::event;
  use sui::transfer::{share_object, transfer, public_transfer};
  use task2::faucet_coin::FAUCET_COIN;
  
  const InvalidNumber: u64 = 1;
  
  public struct GResultEvent has copy, drop {
    result: String,
    is_win: bool,
    your_choice: u8,
    computer_choice: u8,
  }

  public struct RewardPool has key {
    id: UID,
    balance: Balance<FAUCET_COIN>,
  }

  fun random_choice(clock: &Clock): u8 {
    ( (clock::timestamp_ms(clock) % 3) as u8 )
  }

  public fun play(choice: u8, clock: &Clock, pool: &mut RewardPool, ctx: &mut TxContext){
    assert!(choice < 3, InvalidNumber);

    let computer_choice = random_choice(clock);
    let (result, is_win) = if (computer_choice > choice) {
      (string::utf8(b"Lose"), false)
    } else if (computer_choice == choice) {
      (string::utf8(b"Draw"), false)
    } else {
      (string::utf8(b"Win"), true)
    };

    if (is_win) {
      let fee_amount = 1;
      let fees = balance::split(&mut pool.balance, fee_amount);
      public_transfer(coin::from_balance(fees, ctx), sender(ctx));
    };

    event::emit(GResultEvent {
      result,
      is_win,
      your_choice: choice,
      computer_choice,
    });
  }

  public entry fun init_pool(coin: Coin<FAUCET_COIN>, ctx: &mut TxContext) {
    let pool = RewardPool {
      id: object::new(ctx),
      balance: coin::into_balance(coin),
    };

    share_object(pool);
  }
}
