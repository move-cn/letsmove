module mygame::mygame {
use sui::tx_context::{Self,TxContext,sender};
use sui::url::{Self,Url};
use std::option::{Self};
use std::string::{Self,String};
use sui::random::{Self,Random};
use sui::event;
use mycoin::zzf222_faucet_coin::{Self,ZZF222_FAUCET_COIN};
use sui::coin::{Self,Coin,TreasuryCap};
use sui::balance::{Self, Balance};

const EInvalid:u64=0;
const EInputNotEnough:u64 = 1;
const EPoolNotEnough:u64 = 2;

public struct Event has copy,drop{
    choice:u8,
    random:u8,
    win:bool,
    github_id:string::String,
    record:string::String}

public struct Game has key {
        id: UID,
        pool: Balance<ZZF222_FAUCET_COIN>,  
        ticket: u64,
        reward: u64,          
    }

public struct AdminCap has key{id:UID}

fun init(ctx:&mut TxContext){
    let game=Game{
        id:object::new(ctx),
        pool:balance::zero<ZZF222_FAUCET_COIN>(),
        ticket: 1_000,
        reward: 2_000,};
    transfer::share_object(game);
    transfer::transfer(AdminCap{id:object::new(ctx)},sender(ctx));
}

//get faucet_coin
public entry fun get_zzf222_faucet_coin(
    treasury_cap:&mut TreasuryCap<ZZF222_FAUCET_COIN>,
    amount:u64,ctx: &mut TxContext) {
        zzf222_faucet_coin::mint(treasury_cap,amount,tx_context::sender(ctx),ctx); 
    }

//Please enter your guess for an integer between 1 and 5
public entry fun guess( 
    input:Coin<ZZF222_FAUCET_COIN>,
    game: &mut Game,
    choice:u8,
    r:&Random,
    ctx:&mut TxContext){
//Check if the input value is an integer between 1 and 5
assert!(choice==1 || choice==2 || choice==3 || choice==4 || choice==5,EInvalid);
assert!(balance::value(&game.pool) >= game.reward - game.ticket, EPoolNotEnough);
let input_value = coin::value(&input);
assert!(input_value >= game.ticket, EInputNotEnough);
let mut input_balance = coin::into_balance(input);
if (input_value > game.ticket) {
    balance::join(&mut game.pool,balance::split(&mut input_balance, game.ticket));
    let change = coin::from_balance(input_balance, ctx);
    transfer::public_transfer(change, sender(ctx));
} else {balance::join(&mut game.pool, input_balance);};
//generate a random number
let mut generator=random::new_generator(r,ctx);
let random_value=random::generate_u8_in_range(&mut generator,1,5);
//You win or you lose
if(choice==random_value){ 
    let reward_balance = balance::split(&mut game.pool, game.reward);
    let reward = coin::from_balance(reward_balance, ctx);
    transfer::public_transfer(reward, sender(ctx));
event::emit(
    Event{choice,random:random_value,win:true,github_id:b"zzf222".to_string(),record:b"You Win!".to_string()});
}
else{
event::emit(
    Event{choice,random:random_value,win:false,github_id:b"zzf222".to_string(),record:b"You Lose!".to_string()});
};
}

//deposit Coin
public entry fun deposit(game: &mut Game, input: Coin<ZZF222_FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        let input_value = coin::value(&input);
        assert!(input_value >= amount, EInputNotEnough);
        let mut input_balance = coin::into_balance(input);
        if (input_value > amount) {
            balance::join(
                &mut game.pool,
                balance::split(&mut input_balance, amount)
            );
            let change = coin::from_balance(input_balance, ctx);
            transfer::public_transfer(change, sender(ctx));
        } else {
            balance::join(&mut game.pool, input_balance);
        }
    }

//withdraw Coin
public entry fun withdraw(_: &AdminCap, game: &mut Game, amount: u64, ctx: &mut TxContext) {
        let output_balance = balance::split(&mut game.pool, amount);
        let output = coin::from_balance(output_balance, ctx);
        transfer::public_transfer(output, sender(ctx));
    }

}

