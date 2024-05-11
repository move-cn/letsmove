module game::guizhenyu_basketball_shooting_game{
    use std::string::{Self, String};
    use sui::tx_context::{sender, TxContext};
    use sui::coin::{Self, TreasuryCap, Coin};
    use sui::balance::{Self, Balance};
    use sui::event;
    use sui::clock::{Self, Clock};
    use sui::event::emit;
    use sui::transfer::transfer;

    // 投篮的分数范围
    const ShootingPointRange: u8 = 3;

    const OnePointAmount: u64 = 1000000;
    const TwoPointAmount: u64 = 2000000;
    const ThreePointAmount: u64 = 3000000;


    public struct BasketBallShootingGame<phantom T> has key, store {
        id: UID,
        target_point: u64,
        current_point: u64,
        balance: Balance<T>,

    }

    public struct PlayResultEvent has copy, drop {
        message: String,
        current_point: u64,
        is_win: bool,
    }


    fun int(ctx: &mut TxContext){

    }


    entry fun create_game<T>(ctx: &mut TxContext){
        let game = BasketBallShootingGame<T>{
            id: object::new(ctx),
            target_point: 10,
            current_point: 0,
            balance: balance::zero(),

        };
        transfer::share_object(game);

    }



    entry fun play<T>(clock: &Clock, game: &mut BasketBallShootingGame<T>,
    treasury_cap: &mut TreasuryCap<T>, ctx: &mut TxContext){
        let timestamp = clock::timestamp_ms(clock);
        let shooting_point = (timestamp % (ShootingPointRange as u64) as u64);

        game.current_point = game.current_point + shooting_point;

        let (message, is_win) = if (game.current_point >= game.target_point) {
            (b"Congratulations, you've reached the point!", true)
        } else {
            (b"Keep going, you are on your way!", false)
        };

        event::emit(PlayResultEvent{
            message: string::utf8(message),
            current_point: game.current_point,
            is_win,
        });
        let mut mint_amount :u64 = 0;
        if (shooting_point == 1){
            mint_amount = OnePointAmount;
        };

        if (shooting_point == 2){
            mint_amount = TwoPointAmount;
        };
        if (shooting_point == 3){
            mint_amount = ThreePointAmount;
        };

        if(mint_amount > 0){
            let coin = coin::mint(treasury_cap, (mint_amount as u64), ctx);
            balance::join(&mut game.balance, coin::into_balance(coin));
        };


        if(is_win){
            // transfer all the balance to the player
            let all_coins = balance::withdraw_all(&mut game.balance);

            let coin = coin::from_balance(all_coins, ctx);
            transfer::public_transfer(coin,sender(ctx));
        }

    }
}