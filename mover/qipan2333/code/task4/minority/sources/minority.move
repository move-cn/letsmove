
module minority::minority {
    use std::string;
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::event;
    
    const PLAYERS_NUM: u64 = 3;

    // ------- ERRORS -------------------------
    const EAreadyParticipated: u64 = 0;
    const EGameFulled: u64 = 1;
    const EIncorrectCreator: u64 = 2;
    const EPlayerNotEnough: u64 = 3;
    
    public struct Game<phantom T> has key, store {
        id: UID,
        creator: address,
        players: vector<address>,
        yes_players: vector<address>,
        no_players: vector<address>,
        fund: Balance<T>,
        question: string::String,
    }

    public struct Player has store {
        name: string::String,
        email: string::String,
    }

    public struct GameCrteated has copy, drop {
         id: ID,
         creator: address,
    }

    public entry  fun create_game<T>(question:vector<u8>, ctx: &mut TxContext) {
        let fund = coin::into_balance(coin::zero<T>(ctx));
        let sender = tx_context::sender(ctx);
        let id = object::new(ctx);
        let game = Game<T> {
            id: id,
            creator: sender,
            players: vector::empty(),
            yes_players: vector::empty(),
            no_players: vector::empty(),
            question: string::utf8(question),
            fund: fund,
        };

        event::emit(GameCrteated {
            id: object::id(&game),
            creator: sender,
        });

        transfer::share_object(game);
    }

    public entry fun join_game<T>(game:&mut Game<T>, wager: Coin<T>, answer: bool, ctx: &mut TxContext) {
        let player = tx_context::sender(ctx);
        assert!(!(vector::contains(&game.no_players, &player) || vector::contains(&game.yes_players, &player)), EAreadyParticipated);
        assert!(game.no_players.length() + game.yes_players.length() < PLAYERS_NUM, EGameFulled);
        if (answer) {
            vector::push_back(&mut game.yes_players, player);
        } else {
            vector::push_back(&mut game.no_players, player);
        };
        coin::put(&mut game.fund, wager);
    }

    public entry fun settle_game<T>(game:&mut Game<T>, ctx: &mut TxContext) {
        let creator = tx_context::sender(ctx);
        assert!(creator == game.creator, EIncorrectCreator);
        assert!(game.no_players.length() + game.yes_players.length() == PLAYERS_NUM, EPlayerNotEnough);
        let mut winners = game.no_players;
        if (game.no_players.length() < game.yes_players.length()) {
            winners = game.no_players;
        } else {
            winners = game.yes_players;
        };
        let winner_get = game.fund.value() / (winners.length() as u64);
        let mut index = 0;
        while (index < winners.length()) {
            let winner = vector::borrow(&winners, index);
            let win_balance = balance::split(&mut game.fund, winner_get);
            let win_coin = coin::from_balance(win_balance, ctx);
            transfer::public_transfer(win_coin, *winner);
            index = index + 1;
        }
    }
}

