/// Module: nfticketdraw
module nfticketdraw::nfticketdraw {
    use sui::balance::{Self, Balance};
    use sui::clock::Clock;
    use sui::coin::{Self, Coin};
    use sui::event::emit;
    use sui::random::{Random, new_generator};
    use faucet_coin::faucet_coin::FAUCET_COIN;

    const EGameInProgress: u64 = 0;
    const EGameAlreadyCompleted: u64 = 1;
    const EInvalidAmount: u64 = 2;
    const EGameMismatch: u64 = 3;
    const ENotWinner: u64 = 4;
    const ENoParticipants: u64 = 5;

    public struct Game has key {
        id: UID,
        cost_in_coin: u64,
        participants: u32,
        end_time: u64,
        winner: Option<u32>,
        balance: Balance<FAUCET_COIN>,
    }

    public struct Ticket has key {
        id: UID,
        game_id: ID,
        participant_index: u32,
    }

    // Events
    public struct GameCreated  has copy, drop {
        game_id: ID,
        end_time: u64,
        cost_in_coin: u64,
    }

    public struct TicketPurchased has copy, drop {
        game_id: ID,
        participant_index: u32,
        ticket_id: ID,
    }

    public struct WinnerDetermined has copy, drop {
        game_id: ID,
        winner_index: u32,
    }

    public struct RewardRedeemed has copy, drop {
        game_id: ID,
        participant_index: u32,
        amount: u64,
    }


    public fun create(end_time: u64, cost_in_coin: u64, ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            cost_in_coin,
            participants: 0,
            end_time,
            winner: option::none(),
            balance: balance::zero(),
        };

        emit<GameCreated>(GameCreated {
            game_id: object::id(&game),
            end_time,
            cost_in_coin,
        });

        transfer::share_object(game);
    }

    entry fun determine_winner(game: &mut Game, r: &Random, clock: &Clock, ctx: &mut TxContext) {
        assert!(game.end_time <= clock.timestamp_ms(), EGameInProgress);
        assert!(game.winner.is_none(), EGameAlreadyCompleted);
        assert!(game.participants > 0, ENoParticipants);
        let mut generator = r.new_generator(ctx);
        let winner = generator.generate_u32_in_range(1, game.participants);
        game.winner = option::some(winner);

        emit<WinnerDetermined>(WinnerDetermined {
            game_id: object::id(game),
            winner_index: winner,
        });
    }

    public fun buy_ticket(game: &mut Game, coin: Coin<FAUCET_COIN>, clock: &Clock, ctx: &mut TxContext): Ticket {
        assert!(game.end_time > clock.timestamp_ms(), EGameAlreadyCompleted);
        assert!(coin.value() == game.cost_in_coin, EInvalidAmount);

        game.participants = game.participants + 1;
        coin::put(&mut game.balance, coin);

        let ticket = Ticket {
            id: object::new(ctx),
            game_id: object::id(game),
            participant_index: game.participants,
        };

        emit<TicketPurchased>(TicketPurchased {
            game_id: object::id(game),
            participant_index: ticket.participant_index,
            ticket_id: object::id(&ticket),
        });
        ticket
    }

    public fun redeem(ticket: Ticket, game: Game, ctx: &mut TxContext): Coin<FAUCET_COIN> {
        assert!(object::id(&game) == ticket.game_id, EGameMismatch);
        assert!(game.winner.contains(&ticket.participant_index), ENotWinner);
        // 保存信息，以便在事件中使用
        let game_id = object::id(&game);
        let participant_index = ticket.participant_index;
        let reward_amount = game.balance.value();
        destroy_ticket(ticket);

        let Game { id, cost_in_coin: _, participants: _, end_time: _, winner: _, balance } = game;
        object::delete(id);
        let reward = balance.into_coin(ctx);

        emit<RewardRedeemed>(RewardRedeemed {
            game_id,
            participant_index,
            amount: reward_amount,
        });

        reward
    }

    public fun destroy_ticket(ticket: Ticket) {
        let Ticket { id, game_id: _, participant_index: _ } = ticket;
        object::delete(id);
    }

    #[test_only]
    public fun cost_in_coin(game: &Game): u64 {
        game.cost_in_coin
    }

    #[test_only]
    public fun end_time(game: &Game): u64 {
        game.end_time
    }

    #[test_only]
    public fun participants(game: &Game): u32 {
        game.participants
    }

    #[test_only]
    public fun winner(game: &Game): Option<u32> {
        game.winner
    }

    #[test_only]
    public fun balance(game: &Game): u64 {
        game.balance.value()
    }
}

