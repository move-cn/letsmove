/*
/// Module: game_520
module game_520::game_520;
*/
module game_520::rock_paper_scissors {
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::random::{Self, Random};
    use faucet_coin::faucet_coin::FAUCET_COIN;

    const EUserInsufficientBalance: u64 = 1000;
    const EGameInsufficientBalance: u64 = 1001;


    public struct Game has key {
        id: UID,
        balance: Balance<FAUCET_COIN>,
        game_name:vector<u8>
    }

    public struct Admin has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext){
        // create game and share it
        let game = Game{
            id: object::new(ctx),
            balance: balance::zero(),
            game_name:b"y_v's rock_paper_scissors GAME"
        };
        transfer::share_object(game);

        let admin = Admin {id: object::new(ctx)};
        transfer::transfer(admin, ctx.sender());
    }

    public entry fun deposit(game: &mut Game, coin: &mut Coin<FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        assert!(coin.value() >= amount, EUserInsufficientBalance);
        let split_balance = coin::balance_mut(coin).split(amount);
        game.balance.join(split_balance);
    }

    public entry fun withdraw(game: &mut Game, _: &Admin, amount: u64, ctx: &mut TxContext) {
        assert!(game.balance.value() >= amount, EGameInsufficientBalance);
        let cash = coin::take(&mut game.balance, amount, ctx);
        transfer::public_transfer(cash, ctx.sender());
    }

    public entry fun Play(game: &mut Game, rnd: &Random, guess: u8, coin: &mut Coin<FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        assert!(game.balance.value() >= amount, EGameInsufficientBalance);
        assert!(coin.value() >= amount, EUserInsufficientBalance);

        let mut rand = random::new_generator(rnd, ctx);    
        let flag = random::generate_u8(&mut rand) % 3;

        if (
            (guess == 0 && flag == 1)
            || (guess == 1 && flag == 2)
            || (guess == 2 && flag == 0)
        ) {
            //win,you will get reward
            let reward = coin::take(&mut game.balance, amount, ctx);
            coin.join(reward);
        } else if (guess == flag) {
            //draw,nothing happen
        } else {
            //lose,lose your coin
            Self::deposit(game, coin, amount,ctx)
        };
    }

}