module game::game {
use sui::object::{Self, UID};
use sui::tx_context::{Self, TxContext};
use sui::transfer;
use sui::coin::{Self, Coin};
use sui::sui::SUI;
use sui::balance::{Self, Balance};
use std::string::{Self, String};
use sui::table::{Self, Table};
use std::vector;
use sui::clock::{Self, Clock};
use sui::math;

const ENOTBALANCE: u64 = 0;
const ENOTCORRECTHANDS: u64 = 1;
const ENOTCORRECTCHOOSE: u64 = 2;

const ROCK: vector<u8> = b"rock"; 
const PAPER: vector<u8> = b"paper"; 
const SCISSOR: vector<u8> = b"scissor"; 
const LEFT: vector<u8> = b"left"; 
const RIGHT: vector<u8> = b"right"; 

struct GameCap has key {
    id: UID, 
    creator: address, 
}

struct Game has key {
    id: UID, 
    balance: Balance<SUI>, 
    hands: Table<String, vector<String>>, 
}


fun init(ctx: &mut TxContext) {
    transfer::freeze_object(GameCap {
        id: object::new(ctx),
        creator: tx_context::sender(ctx),
    });
}

fun check(hand: vector<u8>): bool {
    hand == ROCK || hand == PAPER || hand == SCISSOR
}

// 将手势转换为数字
fun hand_to_number(hand: vector<u8>): u64 {
    if (hand == ROCK)
        0
    else if (hand == PAPER)
        1
    else
        2
}

// 将数字转换为手势
fun number_to_hand(number: u64): vector<u8> {
    if (number == 0)
        ROCK
    else if (number == 1)
        PAPER
    else
        SCISSOR
}

// 创建游戏
entry fun create_game(left_hand: vector<u8>, right_hand: vector<u8>, coin: Coin<SUI>, clock: &Clock, ctx: &mut TxContext) {
    assert!(coin::value(&coin) > 0, ENOTBALANCE);
    assert!(check(left_hand) && check(right_hand), ENOTCORRECTHANDS);

    // 生成kborrt的手势
    let kborrt_left_hand = number_to_hand(clock::timestamp_ms(clock) % 3);
    let kborrt_right_hand = number_to_hand((hand_to_number(left_hand) + hand_to_number(right_hand) + hand_to_number(kborrt_left_hand)) % 3);

    // 创建存储手势的表格
    let hands = table::new<String, vector<String>>(ctx);
    let user_hands = vector[string::utf8(left_hand), string::utf8(right_hand)];
    let kborrt_hands = vector[string::utf8(kborrt_left_hand), string::utf8(kborrt_right_hand)];
    table::add(&mut hands, string::utf8(b"user"), user_hands);
    table::add(&mut hands, string::utf8(b"kborrt"), kborrt_hands);

    let game = Game {
        id: object::new(ctx),
        balance: coin::into_balance(coin),
        hands,
    };
    transfer::transfer(game, tx_context::sender(ctx));
}

// 将手势选择转换为数字
fun choose_to_number(hand: vector<u8>): u64 {
    if (hand == LEFT)
        0
    else
        1
}

// 判断玩家是否获胜
fun user_win(user_hand: String, kborrt_hand: String): bool {
    let rock = string::utf8(ROCK);
    let paper = string::utf8(PAPER);
    let scissor = string::utf8(SCISSOR);
    user_hand == rock && kborrt_hand == scissor || user_hand == scissor && kborrt_hand == paper || user_hand == paper && kborrt_hand == rock
}

// 玩家选择手势
entry fun choose_hand(game_cap: &GameCap, game: Game, hand: vector<u8>, clock: &Clock, ctx: &mut TxContext) {
    assert!(hand == LEFT || hand == RIGHT, ENOTCORRECTCHOOSE);
    let Game {
        id,
        balance,
        hands,
    } = game;
    object::delete(id);
    let user_idx = choose_to_number(hand);
    let kborrt_idx = clock::timestamp_ms(clock) % 2;
    // 获取玩家和kborrt的手势
    let user_hand = vector::borrow(table::borrow(&hands, string::utf8(b"user")), user_idx);
    let kborrt_hand = vector::borrow(table::borrow(&hands, string::utf8(b"kborrt")), kborrt_idx);

    // 判断玩家是否获胜，将赌注转移给获胜者
    let recipient = if (user_win(*user_hand, *kborrt_hand)) tx_context::sender(ctx) else game_cap.creator;
    let amount = math::min(balance::value(&balance), 1000000000);
    transfer::public_transfer(coin::take(&mut balance, amount, ctx), recipient);
    table::drop(hands);
    if (balance::value(&balance) > 0) {
        amount = balance::value(&balance);
       transfer::public_transfer(coin::take(&mut balance, amount, ctx), tx_context::sender(ctx));
        };
        balance::destroy_zero(balance);
    }
}