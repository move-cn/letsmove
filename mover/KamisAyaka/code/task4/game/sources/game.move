/*
/// Module: game
module game::game;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module game::game{
    use kamisayaka_coin::kamisayaka_coin::KAMISAYAKA_COIN;
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::random::{Self, Random};
    use std::string::String;
    use sui::transfer::{share_object,public_transfer,transfer};

    public struct Game has key{
        id:UID,
        balance:Balance<KAMISAYAKA_COIN>
    }

    public struct AdminCap has key{
        id:UID,
        name:String,
    }

    fun init(ctx:&mut TxContext){
        let game = Game{
            id:object::new(ctx),
            balance:balance::zero()
        };

        share_object(game);
        let admin = AdminCap{
            id:object::new(ctx),
            name:b"firefly".to_string()
        };
        transfer(admin,ctx.sender());
    }

    entry fun play(
        game:&mut Game,
        rand: &Random,
        true_or_false:bool,
        coin:&mut Coin<KAMISAYAKA_COIN>,
        amount:u64,
        ctx:&mut TxContext
    ){
        assert!(game.balance.value()>= amount);
        assert!(coin::value(coin) >= amount);
        assert!(amount * 10 <= game.balance.value());
        let mut ran = random::new_generator(rand, ctx);
        let flag = random::generate_bool(&mut ran);

        if (flag == true_or_false) {
            let reward = coin::take(&mut game.balance, amount, ctx);
            coin::join(coin, reward);
        } else {
            Self::deposit(game, coin, amount);
        }
    }

    public entry fun deposit(
        game: &mut Game,
        in_coin:&mut Coin<KAMISAYAKA_COIN>,
        amount:u64,
    ){
        assert!(coin::value(in_coin) >= amount);
        let deposit_balance = balance::split(coin::balance_mut(in_coin),amount);
        balance::join(&mut game.balance,deposit_balance);
    }

    public entry fun withdraw(
        _:&AdminCap,
        game: &mut Game,
        out:u64,
        ctx:&mut TxContext
    ){
        assert!(game.balance.value()>= out);
        let out_coin = coin::take(&mut game.balance,out,ctx);
        public_transfer(out_coin,ctx.sender());
    }
}