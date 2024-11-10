module guess_game::guess_game;
use al17er_coin::al17er_coin::{AL17ER_COIN};
use sui::balance::{Balance,zero};
use sui::balance;
use sui::coin::{into_balance,from_balance};
use sui::coin;
// use sui::{from_balance,into_balance};
use sui::object;
use sui::random;
use sui::random::Random;
use sui::transfer::{share_object,transfer,public_transfer};
use sui::tx_context::sender;


public struct BankAccount has key{
    id:UID,
    balance: Balance<AL17ER_COIN>,
}

fun init(ctx: &mut TxContext){
    let bankaccoount =  BankAccount{
        id: object::new(ctx),
        balance:zero(),
    };

    share_object(bankaccoount);
}

fun despoit(account: &mut BankAccount,dcoins: coin::Coin<AL17ER_COIN>,ctx: &mut TxContext){
    let into_balance = into_balance(dcoins);
    balance::join(&mut account.balance,into_balance);
}

fun withdraw(account:&mut BankAccount,amount:u64,to:address,ctx:&mut TxContext){
    let coin_balance=balance::split(&mut account.balance,amount);
    let coin = from_balance(coin_balance,ctx);
    public_transfer(coin,to);
}

public entry fun despoit_entry(account: &mut BankAccount,dcoins: coin::Coin<AL17ER_COIN>,ctx: &mut TxContext){
    let into_balance = into_balance(dcoins);
    balance::join(&mut account.balance,into_balance);
}

public entry fun start(bankaccount: &mut BankAccount,guess:bool,guess_coin: coin::Coin<AL17ER_COIN>,rand: &Random,ctx:&mut TxContext){
    let coin_balance=coin::value(&guess_coin);
    let bank_balance=balance::value(&bankaccount.balance);

    if (bank_balance < coin_balance){
        abort 0;
    };

    let mut gen = random::new_generator(rand,ctx);
    let flag = random::generate_bool(&mut gen);

    let player_address = sender(ctx);
    if (guess == flag){
        withdraw(bankaccount,coin_balance,player_address,ctx);
        public_transfer(guess_coin,player_address);
    }else{
        despoit(bankaccount,guess_coin,ctx);
    }
}
