module move_game::guess_game;

use move_coin::faucet_coin::{Self, FAUCET_COIN};
use move_nft::move_nft;
use sui::address;
use sui::balance::{Self, Balance};
use sui::bcs;
use sui::coin::{Self, Coin, TreasuryCap};
use sui::event::emit;
use sui::table::{Self, Table};
use sui::tx_context::sender;

const EInvalid: u64 = 0;
const EInputNotEnough: u64 = 1;
const ECurrencyNotEnough: u64 = 2;
const EHaveWon: u64 = 4;
const ENotUser: u64 = 5;

/// 定义游戏
public struct Game has key, store {
    id: UID,
    secret_number: Option<u32>,
    attempts: u32,
    over: bool,
    winner: address,
    cost_per_round: u64,
    pool: u64,
    game_pool: Balance<FAUCET_COIN>,
    users: Table<address, USER>,
}

/// 定义游戏事件
public enum GuessEvent has copy, drop, store {
    TooSmall,
    TooBig,
    Correct,
}

public struct USER has store {
    balance: u64,
}

public struct AdminCap has key { id: UID }

/// 初始化游戏
fun init(ctx: &mut TxContext) {
    let game = Game {
        id: object::new(ctx),
        secret_number: option::none(),
        attempts: 0,
        over: false,
        winner: address::from_u256(0),
        cost_per_round: 10, //define the cost per round is 10 faucet_coin
        pool: 0,
        game_pool: balance::zero<FAUCET_COIN>(),
        users: table::new<address, USER>(ctx),
    };
    transfer::share_object(game);
    transfer::transfer(AdminCap { id: object::new(ctx) }, sender(ctx));
}

//get random number
// public entry fun get_random_number(_: &AdminCap, game: &mut Game, r: &Random, ctx: &mut TxContext) {
//     let mut generator=random::new_generator(r,ctx);
//     let random_value=random::generate_u8_in_range(&mut generator,1,101);
//     game.secret_number = random_value as u32;
// }
public entry fun get_random_number(
    _: &AdminCap,
    game: &mut Game,
    magic_number: u64,
    ctx: &mut TxContext,
) {
    let sender_address = tx_context::sender(ctx);
    let timestamp = tx_context::epoch_timestamp_ms(ctx);
    let address_bytes = address::to_bytes(sender_address);
    let timestamp_bytes = bcs::to_bytes(&timestamp);
    let magic_number_bytes = bcs::to_bytes(&magic_number);
    let mut hash_input = address_bytes;
    vector::append(&mut hash_input, timestamp_bytes);
    vector::append(&mut hash_input, magic_number_bytes);
    let hash_output = sui::hash::blake2b256(&hash_input);
    // 取哈希值的第一个字节并转换为随机数 [1, 100]
    let random_byte = *vector::borrow(&hash_output, 0); // 解引用 &u8
    let random_value = (random_byte as u32) % 100 + 1;
    game.secret_number = option::some(random_value);
}

//get faucet_coin
public entry fun get_faucet_coin(
    treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    faucet_coin::mint(treasury_cap, amount, tx_context::sender(ctx), ctx);
}

//deposit Coin
public entry fun deposit(
    game: &mut Game,
    input: Coin<FAUCET_COIN>,
    amount: u64,
    ctx: &mut TxContext,
) {
    let caller = tx_context::sender(ctx);
    // get the input value and assert
    let input_value = coin::value(&input);
    assert!(input_value >= amount, EInputNotEnough);
    // transection the input value to Balance
    let mut input_balance = coin::into_balance(input);
    // if input valye much tran amount, change the excess
    if (input_value > amount) {
        balance::join(
            &mut game.game_pool,
            balance::split(&mut input_balance, amount),
        );
        let change = coin::from_balance(input_balance, ctx);
        transfer::public_transfer(change, caller);
    } else {
        balance::join(&mut game.game_pool, input_balance);
    };
    // check if user in table `users`
    if (!table::contains(&game.users, caller)) {
        // insert new user, and set its balance
        table::add(&mut game.users, caller, USER { balance: amount });
    } else {
        // user is valid，update its balance
        let user = table::borrow_mut(&mut game.users, caller);
        user.balance = user.balance + amount;
    }
}

//withdraw Coin
public entry fun withdraw(_: &AdminCap, game: &mut Game, amount: u64, ctx: &mut TxContext) {
    let output_balance = balance::split(&mut game.game_pool, amount);
    let output = coin::from_balance(output_balance, ctx);
    transfer::public_transfer(output, sender(ctx));
    game.pool = game.pool - amount;
}

//restart
public entry fun restart(_: &AdminCap, game: &mut Game) {
    game.secret_number = option::none();
    game.attempts = 0;
    game.over = false;
    game.winner = address::from_u256(0);
}

/// user guess
public entry fun make_guess(
    game: &mut Game,
    coin: Coin<FAUCET_COIN>,
    guess: u32,
    ctx: &mut TxContext,
) {
    game.attempts = game.attempts + 1;
    let caller = tx_context::sender(ctx);
    // base check
    assert!(game.secret_number != option::none(), EInvalid);
    assert!(game.over != true, EHaveWon);
    assert!(game.winner == address::from_u256(0), EHaveWon);
    assert!(table::contains(&game.users, caller), ENotUser);
    assert!(guess >= 1 && guess <= 100, EInvalid);
    // check the balance
    let user = table::borrow_mut(&mut game.users, caller);
    assert!(user.balance >= game.cost_per_round, ECurrencyNotEnough); // currency not enough
    user.balance = user.balance - game.cost_per_round; // deduct the cost
    // input the balance into pool
    let input_balance = coin::into_balance(coin);
    balance::join(&mut game.game_pool, input_balance);
    game.pool = game.pool + game.cost_per_round;
    // compare guess with secret number
    let secret_number = option::borrow(&game.secret_number);
    if (guess < *secret_number) {
        emit(GuessEvent::TooSmall); // too small
    } else if (guess > *secret_number) {
        emit(GuessEvent::TooBig); // too big
    } else {
        // guess correct
        emit(GuessEvent::Correct);
        // game over
        game.over = true;
        game.winner = caller;
        // get reward
        // let reward_balance = balance::split(&mut game.game_pool, user.balance);
        // let reward = coin::from_balance(reward_balance, ctx);
        // NOTHING, OR EVERYTHING!!!
        let reward_balance = balance::split(&mut game.game_pool, 0);
        let reward = coin::from_balance(reward_balance, ctx);
        transfer::public_transfer(reward, caller);
        // give a NFT to winner
        move_nft::mint(
            b"TruE",
            b"Bless Alysia! from ctianming≥v≤",
            b"https://avatars.githubusercontent.com/u/107739505?v=4",
            caller,
            ctx,
        );
    }
}
