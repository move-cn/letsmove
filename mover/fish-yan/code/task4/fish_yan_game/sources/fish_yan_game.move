/*
/// Module: fish_yan_game
module fish_yan_game::fish_yan_game;
*/
module fish_yan_game::fish_yan_game {

    use fish_yan_faucet::fish_yan_faucet::FISH_YAN_FAUCET;
    use sui::balance;
    use sui::balance::{Balance, zero};
    use sui::coin;
    use sui::coin::{into_balance, from_balance};
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;

    // ticket price
    const TICKET_PRICE: u64 = 1_000_000_000;

    public struct FishYanGame has key {
        id: UID,
        pool: Balance<FISH_YAN_FAUCET>,
    }


    public struct AdminCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let game = FishYanGame {
            id: object::new(ctx),
            pool: zero(),
        };

        share_object(game);

        let admin = AdminCap {
            id: object::new(ctx),
        };

        transfer(admin, sender(ctx));
    }

    public entry fun play(
        game: &mut FishYanGame,
        in: coin::Coin<FISH_YAN_FAUCET>,
        rand: &Random,
        ctx: &mut TxContext
    ) {
        let in_val = coin::value(&in);

        assert!(in_val == TICKET_PRICE, 0);

        deposit(game, in, ctx);
        // generate random
        let mut gen = random::new_generator(rand, ctx);

        let number = random::generate_u8_in_range(&mut gen, 0, 5);
        let mut _amount: u64 = 0;
        if (number < 3) {
            _amount = 0;
        }else {
            _amount = 2000_000_000;
        };
        withdraw(game, _amount, sender(ctx), ctx)
    }

    public entry fun deposit(game: &mut FishYanGame, in: coin::Coin<FISH_YAN_FAUCET>, ctx: &mut TxContext) {
        let in_balance = into_balance(in);
        balance::join(&mut game.pool, in_balance);
    }

    public entry fun withdraw(game: &mut FishYanGame, amount: u64, to: address, ctx: &mut TxContext) {
        let out_balance = balance::split(&mut game.pool, amount);
        let out_coin = from_balance(out_balance, ctx);
        public_transfer(out_coin, to);
    }
    
}
