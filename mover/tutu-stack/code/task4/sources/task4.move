/// Module: task4
module task4::rock_paper_scissors {
  use std::string::{Self, String};
  use sui::clock::{Self, Clock};
  use sui::event;
  use sui::balance;
  use sui::balance::Balance;
  use sui::coin;
  use sui::coin::{Coin, from_balance, into_balance};
  use sui::tx_context;
  use sui::tx_context::sender;
  use sui::transfer::{share_object, transfer, public_transfer};
  use task2::tutustack_faucet_coin::TUTUSTACK_FAUCET_COIN;

  const EInvalidNumber: u64 = 1;
  const PLAYER_WON_STATE: u8 = 1;

  public struct GamingResultEvent has copy, drop {
    is_win: bool,
    your_choice: String,
    computer_choice: String,
    result: String,
  }

  public struct RewardPool has key {
    id: UID,
    balance: Balance<TUTUSTACK_FAUCET_COIN>,
  }

  fun get_random_choice(clock: &Clock): u8 {
    ( ( clock::timestamp_ms(clock) % 3 ) as u8 )
  }

  fun map_choice_to_string(choice: u8): String {
    if (choice == 0) {
      string::utf8(b"rock")
    } else if (choice == 1) {
      string::utf8(b"paper")
    } else if (choice == 2) {
      string::utf8(b"scissors")
    } else {
      string::utf8(b"Invalid")
    }
  }

  public fun play(choice: u8, clock: &Clock, pool: &mut RewardPool, ctx: &mut TxContext,) {
    assert!(choice < 3, EInvalidNumber);

    let computer_choice = get_random_choice(clock);
    let (result, is_win) = if (
      (choice == 0 && computer_choice == 1) 
      || (choice == 1 && computer_choice == 2)
      || (choice == 2 && computer_choice == 0)
    ) {
      (string::utf8(b"win"), true)
    } else if (choice == computer_choice) {
      (string::utf8(b"Draw"), false)
    } else {
      (string::utf8(b"Lose"), false)
    };

    if (is_win) {
      let fee_amount = 1;
      let fees = balance::split(&mut pool.balance, fee_amount);
      transfer::public_transfer(coin::from_balance(fees, ctx), tx_context::sender(ctx));
      PLAYER_WON_STATE;
    };

    event::emit(GamingResultEvent {
      result,
      is_win,
      your_choice: map_choice_to_string(choice),
      computer_choice: map_choice_to_string(computer_choice),
    });
  }

  public entry fun init_pool( coin: Coin<TUTUSTACK_FAUCET_COIN>, ctx: &mut TxContext) {
    let pool = RewardPool {
      id: object::new(ctx),
      balance: coin::into_balance(coin)
    };

    // 初始化pool并分享
    transfer::share_object(pool);
  }
}
