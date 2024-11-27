module linkgame::linkgame;
use sui::balance::Balance;
use faucet_coin::eig::{EIG};
use sui::coin;
use sui::random::Random;
use sui::transfer::{share_object, public_transfer,transfer};

public struct AdminCap has key{
    id:UID,
}

public struct LinkGame  has key,store{
    id: UID,
    // 存钱必须用这个结构体，
    amount: Balance<EIG>,
}

fun init(ctx :&mut TxContext){
    let game = LinkGame {
        id: object::new(ctx),
        amount: sui::balance::zero(),
    };
    share_object(game);
    let admin = AdminCap{id:object::new(ctx)};
    transfer(admin,ctx.sender());
}
// 0是反面1是正面
entry fun play(game: &mut LinkGame, rand:&Random, guess_val:u8, user_bet_coin: coin::Coin<EIG>, ctx: &mut TxContext){
    let game_balance = game.amount.value();
    let user_bet_amount = user_bet_coin.value();

    // 奖池大于用户奖池
    assert!(game_balance >= user_bet_amount * 10,0x1);

    // up 正面 !up 反面
    let mut generator = sui::random::new_generator(rand,ctx);
    let gen_val = sui::random::generate_bool(&mut generator);
    let mut  is_up = false;
    if (guess_val ==1){
        is_up = true
    };
    if (is_up ==gen_val){
        let out_balance = game.amount.split(user_bet_amount);
        let out_coin = coin::from_balance(out_balance,ctx);
        public_transfer(out_coin,ctx.sender());
        public_transfer(user_bet_coin,ctx.sender());
    }else{
        let in_amt_balance = coin::into_balance(user_bet_coin);
        game.amount.join(in_amt_balance);
    }
}

public entry fun deposit(game:&mut LinkGame, amount: coin::Coin<EIG>, _:&mut TxContext){
    let in_amt = coin::into_balance(amount);
    game.amount.join(in_amt);
}

public entry fun withdraw(_:&AdminCap, game:&mut LinkGame, amount: u64, ctx:&mut TxContext){
    let out_coin = game.amount.split(amount);
    let withdraw_coins = coin::from_balance(out_coin,ctx);
    public_transfer(withdraw_coins,ctx.sender())
}