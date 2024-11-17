
module hello_game::guess_hand {
  use std::ascii::{ String, string };
  use std::string;
  use sui::address;
  use sui::balance;
  use sui::balance::Balance;
  use sui::clock;
  use sui::clock::Clock;
  use sui::coin;
  use sui::coin::Coin;
  use sui::event::emit;
  use sui::math;
  use sui::object;
  use sui::random::Random;
  use sui::transfer;
  use sui::random;
  use sui::url;

  const ENOBALANCE: u64 = 0;
  const ENOTCORRECTHAND: u64 = 1;
  const ENOTCORRECTCHOOSE: u64 = 2;
  const ENOGUESS_HANDCOIN: u64 = 3;

  const ROCK: vector<u8> = b"rock";
  const SCISSOR: vector<u8> = b"scissor";
  const PAPER: vector<u8> = b"paper";
  const LEFT: vector<u8> = b"left";
  const RIGHT: vector<u8> = b"right";

  const MIST_PER_GUESS_HAND:u64 = 1_000_000_000;

  public struct Game has key,store {
    id: UID,
    balance: Balance<GUESS_HAND>,
  }

  public struct GameCap has key {
    id: UID,
    creator: address,
  }

  public struct Game_Finished has copy, drop {
    winner: String,
    address: address,
  }


  public struct GUESS_HAND has drop {}
  fun init(otw: GUESS_HAND, ctx: &mut TxContext) {

    let game_cap = GameCap {
      id: object::new(ctx),
      creator: ctx.sender(),
    };

    let (mut treasury_cap, metadata) = coin::create_currency (
      otw,
      9,
      b"windynanzi",
      b"Windy",
      b"game coin",
      option::some(url::new_unsafe(string(b"https://cdn.icon-icons.com/icons2/1865/PNG/96/dogbaby_119594.png"))),
      ctx
    );

    transfer::public_freeze_object(metadata);
    let coin = coin::mint(&mut treasury_cap, 100 * MIST_PER_GUESS_HAND, ctx);
    let balance = coin::into_balance(coin);

    let game = Game {
      id: object::new(ctx),
      balance,
    };

    transfer::freeze_object(game_cap);
    transfer::public_transfer(treasury_cap, ctx.sender());
    transfer::share_object(game);
  }

  fun check(hand: vector<u8>): bool {
    hand == ROCK || hand == SCISSOR || hand == PAPER
  }

  fun hand_to_number(hand: vector<u8>): u64 {
    if (hand == ROCK)
      0
    else if (hand == SCISSOR)
      1
    else
      2
  }

  fun number_to_hand(number: u64): vector<u8> {
    if (number == 0)
      ROCK
    else if (number == 1)
      SCISSOR
    else
      PAPER
  }



  fun roll(r: &Random, ctx: &mut TxContext): u64 {
    random::generate_u64_in_range(&mut random::new_generator(r, ctx), 0, 2)
  }

  fun roll_clock(c: &Clock, ctx: &mut TxContext): u64 {
    clock::timestamp_ms(c) % 2
  }

  fun choose_to_number(hand: vector<u8>): u64 {
    if (hand == LEFT)
      0
    else
      1
  }

  // 用户获胜的条件
  fun user_win(user_hand:u64, robot_hand:u64): bool {
    user_hand == 0  && robot_hand == 1
      || user_hand == 1 && robot_hand == 2
      || user_hand == 2 && robot_hand == 0
  }




  public entry fun choose_hand(
    game_cap: &GameCap,
    game:&mut Game,
    hand: vector<u8>,
    clock: &Clock,
    ctx: &mut TxContext,
  ) {
    assert!(check(hand), ENOTCORRECTHAND);
    assert!(game.balance.value() > 0 , ENOGUESS_HANDCOIN);

    let user_hand = hand_to_number(hand);
    let robot_hand = roll_clock(clock, ctx);

    let recipient = if(user_win(user_hand, robot_hand)) ctx.sender() else game_cap.creator;
    let winner = if(user_win(user_hand, robot_hand)) string(b"user") else string(b"robot");

    let new_balance = game.balance.split(MIST_PER_GUESS_HAND);
    let coin = coin::from_balance(new_balance, ctx);



    emit(Game_Finished {
      winner,
      address: recipient,
    });

    transfer::public_transfer(coin, recipient);
  }

}
// publish hash 3nBEeXxeq9fM69kZ9NscbATUXU1sPUnbbCwux7kD5yPZ
// PackageId 0x3be1388d977a2eaca3f9987086048d1533953263b1bff49de6598f25b21f7b19
// GameCap 0x04c778eacbe69a1975bbef3544720dd3907bb9461aa7d9901fb16dd77726576d
// Game 0x624850e7bf86943164a391391ab47018c99c1b94739e63c523cb1a71f0914f18
// player address(ablion02) 0xddb33d56ab9aebc1cef10fbfb8ad6e29e2d3a2a33fc69ab658579b0699b28434


// 切换到玩家
// sui client switch --address ablion02


// play
// sui client call --package 0x3be1388d977a2eaca3f9987086048d1533953263b1bff49de6598f25b21f7b19 --module guess_hand --function choose_hand --args 0x04c778eacbe69a1975bbef3544720dd3907bb9461aa7d9901fb16dd77726576d 0x624850e7bf86943164a391391ab47018c99c1b94739e63c523cb1a71f0914f18 rock 0x6
// hash_1 Ck2EEHtiDr71USRn3kJAynF1HSwRnRxYW1zJ5N7vHNMW
// hash_2 4EJbqMjoqrLeCuFwJfvn9T2hLyGD3RYpjgnJWWyhrkmA
// hash_3 4JywJNuNY9mZh5BYur2fnYPhfJWei15c65j3dyVf3D6c