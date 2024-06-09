module lihuazhang_game::game {
    use sui::balance::{Balance};
    use sui::coin::{Self, Coin};
    use lihuazhang_coin::lihuazhang_faucet_coin::{LIHUAZHANG_FAUCET_COIN};
    use lihuazhang_game::house_data::{HouseData};
    use sui::event::emit;
    use sui::dynamic_object_field::{Self as dof};
    use sui::clock::{Self, Clock};

    public struct Game has key, store {
        id: UID,
        total_bets: Balance<LIHUAZHANG_FAUCET_COIN>,
        guess: u64,
        player: address,
    }

    public struct NewGame has copy, drop {
        game_id: ID,
        player: address,
        guess: u64,
        user_bets: u64, // 2x user_stake should always equal the total_stake
    }

    public struct Outcome has copy, drop {
        game_id: ID,
        status: u8
    }
    const PLAYER_WON_STATE: u8 = 1;
    const HOUSE_WON_STATE: u8 = 2;
    const EInsufficientHouseBalance: u64 = 3;
    const EGameDoesNotExist: u64 = 5;

    public fun start_game(clock: &Clock, bets_coin: Coin<LIHUAZHANG_FAUCET_COIN>, house_data: &mut HouseData, ctx: &mut TxContext): ID {

        let user_bets = bets_coin.value();
        assert!(house_data.balance() >= user_bets, EInsufficientHouseBalance);

        // house bet
        let mut total_bets = house_data.borrow_balance_mut().split(user_bets);
        coin::put(&mut total_bets, bets_coin);

        let id = object::new(ctx);
        let game_id = id.to_inner();

        let current_timestamp = clock::timestamp_ms(clock);
        let guess = current_timestamp % 10;

        let new_game = Game {
            id,
            total_bets,
            guess,
            player: ctx.sender(),
        };

        emit(NewGame {
            game_id,
            player: ctx.sender(),
            guess,
            user_bets,
        });
        dof::add(house_data.borrow_mut(), game_id, new_game);
        game_id
    }

    public fun play_game(game_id: ID, guess_of_player: u64, house_data: &mut HouseData, ctx: &mut TxContext) {
        
        assert!(game_exists(house_data, game_id), EGameDoesNotExist);

        let Game {
            id,
            total_bets,
            guess,
            player,
        } = dof::remove<ID, Game>(house_data.borrow_mut(), game_id);

        object::delete(id);

        let player_won = (guess == guess_of_player);

        let status = if (player_won) {
            transfer::public_transfer(total_bets.into_coin(ctx), player);
            PLAYER_WON_STATE
        } else {
            house_data.borrow_balance_mut().join(total_bets);
            HOUSE_WON_STATE
        };
        emit(Outcome {
            game_id,
            status
        });
    }

    public fun game_exists(house_data: &HouseData, game_id: ID): bool {
        dof::exists_(house_data.borrow(), game_id)
    }

}