module funnyyanne_game::funnyyanne_game {

    use sui::balance;
    use sui::balance::{Balance, zero};
    use sui::coin::{Coin, into_balance, from_balance};
    use sui::object;
    use sui::coin;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::{TxContext, sender};
    use faucet_coin::funnyyanne_faucet_coin::FUNNYYANNE_FAUCET_COIN;

    const ENotEnough  :u64 = 0;
    const EExceedLimit : u64 = 1;

    public struct Game has key {
        id: UID,
        val: Balance<FUNNYYANNE_FAUCET_COIN>
    }
    public struct AdminCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext){
        let game = Game{
            id: object::new(ctx),
            val: zero(),
        };

        share_object(game);
        let admin = AdminCap{
            id: object::new(ctx),
        };
        
        transfer(admin,sender(ctx));
    }

    public fun deposit(game: &mut Game,in: Coin<FUNNYYANNE_FAUCET_COIN>, _ctx: &mut TxContext){
        let in_balance = into_balance(in);
        balance::join(&mut game.val, in_balance);
    }

    public fun withdraw(_: &AdminCap,game: &mut Game, out_amt: u64, ctx: &mut TxContext){
        let out_balance = balance::split(&mut game.val, out_amt);
        let out_coin = from_balance(out_balance,ctx);
        public_transfer(out_coin, sender(ctx));
    }

#[allow(lint(self_transfer))]
    public fun play (game: &mut Game, flip_value: bool, in: Coin<FUNNYYANNE_FAUCET_COIN>, rand: &Random,ctx: &mut TxContext){
        let coin_value = coin::value(&in);
        let play_address = sender(ctx);
        let game_val = balance::value(&game.val);

        if (game_val < coin_value) {
            abort ENotEnough;
        };

        // proctect the game from being bankrupted
        if(game_val < coin_value*10) {
            abort EExceedLimit;
        };

        let mut gen = random::new_generator(rand, ctx);
        let mut flag = random::generate_bool(&mut gen);

        if (flip_value == flag) {
            let win_balance = balance::split(&mut game.val, coin_value);
            let win_coin = from_balance(win_balance, ctx);
            public_transfer(win_coin, play_address);
            public_transfer(in, play_address);
        }else {
            let in_balance = into_balance(in);
            balance::join(&mut game.val, in_balance);
        }
    }
}