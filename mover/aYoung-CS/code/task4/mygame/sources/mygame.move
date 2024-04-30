module mygame::mygame {

    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use mygame::game_data::{Self as gd, GameData};
    use faucet_coin::AYOUNG_FAUCET_COIN::AYOUNG_FAUCET_COIN;
    use sui::dynamic_object_field::{Self as dof};
    use sui::bcs::{Self as bcs};
    use sui::event::emit;
    use sui::math::diff;


    const PLAYER_WON_STATE: u8 = 1;
    const HOUSE_WON_STATE: u8 = 2;

    const EStakeTooLow: u64 = 0;
    const EStakeTooHigh: u64 = 1;
    const EInvalidGuess: u64 = 3;
    const EInsufficientGameBalance: u64 = 4;
    const EGameDoesNotExist: u64 = 5;

    /// Emitted when a new game has started.
    public struct NewGame has copy, drop {
        game_id: ID,
        player: address,
        guess: u64,
        user_stake: u64,
    }

    /// Emitted when a game has finished.
    public struct Outcome has copy, drop {
        game_id: ID,
        ans: u64,
        status: u8
    }

    public struct Game has key, store {
        id: UID,
        total_stake: Balance<AYOUNG_FAUCET_COIN>,
        guess: u64,
        player: address,
    }


    public fun start_game(guess: u64, coin: Coin<AYOUNG_FAUCET_COIN>, game_data: &mut GameData, ctx: &mut TxContext): ID{
        let (id, new_game) = internal_start_game(guess, coin, game_data, ctx);
        dof::add(gd::borrow_mut(game_data), id, new_game);
        id
    }

    public fun finish_game(game_id: ID, game_data: &mut GameData, ctx: &mut TxContext){
        assert!(game_exists(game_data, game_id), EGameDoesNotExist);
        
        let Game {
            id,
            mut total_stake,
            guess,
            player,
        } = dof::remove<ID, Game>(gd::borrow_mut(game_data), game_id);

        object::delete(id);
        let ans = get_random(ctx);
        let player_won = if ( diff(guess as u64, ans as u64)>50u64 ){
            true
        } else{
            false
        };

        let status = if (player_won) {
            let stake_amount = balance::value(&total_stake);
            let fee_amount = stake_amount/5;
            let fees = balance::split(&mut total_stake, fee_amount);
            balance::join(gd::borrow_fees_mut(game_data), fees);

            transfer::public_transfer(coin::from_balance(total_stake, ctx), player);
            PLAYER_WON_STATE
        } else {
            balance::join(gd::borrow_balance_mut(game_data), total_stake);
            HOUSE_WON_STATE
        };

        emit(Outcome{
            game_id,
            ans, 
            status
        });

    }

    fun internal_start_game(guess: u64, coin: Coin<AYOUNG_FAUCET_COIN>, game_data: &mut GameData, ctx: &mut TxContext): (ID, Game){
        assert!(guess >=0u64 && guess <= 100u64, EInvalidGuess);
        let user_stake = coin::value(&coin);
        // Ensure that the stake is not higher than the max stake.
        assert!(user_stake <= gd::max_stake(game_data), EStakeTooHigh);
        // Ensure that the stake is not lower than the min stake.
        assert!(user_stake >= gd::min_stake(game_data), EStakeTooLow);
        // Ensure that the house has enough balance to play for this game.
        assert!(gd::balance(game_data) >= user_stake, EInsufficientGameBalance);

        let mut total_stake = balance::split(gd::borrow_balance_mut(game_data), user_stake);
        coin::put(&mut total_stake, coin);
        let id = object::new(ctx);
        let game_id = object::uid_to_inner(&id);

        let new_game = Game {
            id,
            total_stake,
            guess,
            player: tx_context::sender(ctx),
        };

        emit(NewGame {
            game_id,
            player: tx_context::sender(ctx),
            guess,
            user_stake,
        });

        (game_id, new_game)
    }

    public fun game_exists(game_data: &GameData, game_id: ID): bool {
        dof::exists_(gd::borrow(game_data), game_id)
    }

    fun get_random(ctx: &TxContext): u64{
        let tx_digest = tx_context::digest(ctx);
        let tx_digest_u64= bcs::peel_u64(&mut bcs::new(*tx_digest));
        let random_number = ((tx_digest_u64 % 100) as u64);
        random_number
    }

}