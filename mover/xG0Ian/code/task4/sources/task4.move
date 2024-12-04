/// Module: task4
module task4::task4 {
    use sui::event;
    use 0x2::coin::Coin;
    use 0x2::random::Random;
    use sui::balance::{Self, Balance};
    use std::debug;
    use 0x2::sui::SUI;

    const ENotOwner: u64 = 0;

    public struct Game has key {
        id: UID,
        num: u8,
        owner: address,
        payment: Balance<SUI>
    }

    public struct Win has copy, drop {
        id: ID,
        owner: address,
        fighter: address,
        owner_num: u8,
        fighter_num: u8,
        winner: address,
    }
    

    entry public fun new_game(paid: Coin<SUI>, r: &Random, ctx: &mut TxContext) {
        let mut generator = r.new_generator(ctx);
        let mut coin = balance::zero<SUI>();
        debug::print(&paid);
        debug::print(&coin);
        coin.join(paid.into_balance());
        debug::print(&coin);
        let game = Game{
            id: object::new(ctx),
            num: generator.generate_u8_in_range(0, 10),
            owner: tx_context::sender(ctx),
            payment: coin
        };
        debug::print(&game);
        transfer::share_object(game);
    }

    entry public fun del_game(game: Game, ctx: &mut TxContext) {
        assert!(game.owner == tx_context::sender(ctx), ENotOwner);
        let Game {
            id, num: _, owner: _, payment
        } = game;
        id.delete();
        transfer::public_transfer(payment.into_coin(ctx), tx_context::sender(ctx));
    }

    entry public fun fight(paid: Coin<SUI>, r: &Random, game: Game, ctx: &mut TxContext) {
        let mut generator = r.new_generator(ctx);
        let Game {
            id, num: owner_num, owner, mut payment
        } = game;
        payment.join(paid.into_balance());
        let num = generator.generate_u8_in_range(0, 10);
        let winner;
        if (num > owner_num) {
            winner = tx_context::sender(ctx);
        }else {
            winner = owner;
        };
        transfer::public_transfer(payment.into_coin(ctx), winner);
        event::emit(Win {
            id: id.to_inner(),
            owner: owner,
            fighter: tx_context::sender(ctx),
            owner_num,
            fighter_num: num,
            winner
        });
        id.delete();
    }

}

