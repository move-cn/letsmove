/*
/// Module: game
module game::game;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module game::game {

    use faucet_coin::faucet_coin::{Self, FAUCET_COIN};
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::random::{Self, Random, RandomInner};

    const ErrUserInsufficientBalance: u64 = 1000;
    const ErrGameInsufficientBalance: u64 = 1001;


    public struct Game has key {
        id: UID,
        balance: Balance<FAUCET_COIN>,
    }

    public struct Admin has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            balance: balance::zero(),
        };
        transfer::share_object(game);
        let admin = Admin {id: object::new(ctx)};
        transfer::transfer(admin, ctx.sender());
    }

    public entry fun Deposit(game: &mut Game, coin: &mut Coin<FAUCET_COIN>, amount: u64) {
        assert! (
            coin::value(coin) >= amount,
            ErrUserInsufficientBalance
        );
        let split_balance = balance::split(coin::balance_mut(coin), amount);
        balance::join(&mut game.balance, split_balance);
    }

    public entry fun Withdraw(game: &mut Game, _ : &Admin, amount: u64, ctx: &mut TxContext) {
        assert! (
            game.balance.value() >= amount,
            ErrGameInsufficientBalance
        );
        let cash = coin::take(&mut game.balance, amount, ctx);
        transfer::public_transfer(cash, ctx.sender());
    }

    public entry fun Play(game: &mut Game, rnd: &Random, guess: bool, coin: &mut Coin<FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        // Check that the game has enough balance to pay out the winnings
        assert !(
            game.balance.value() >= amount * 2,
            ErrGameInsufficientBalance
        );
        // Check that the user has enough balance to play the game
        assert !(
            coin::value(coin) >= amount,
            ErrUserInsufficientBalance
        );
        let mut gen = random::new_generator(rnd, ctx);
        let flag = random::generate_bool(&mut gen);
        if (flag == guess) {
            let reward = coin::take(&mut game.balance, amount, ctx);
            coin::join(coin, reward);
        } else {
            Self::Deposit(game, coin, amount);
        }
    }
}
