module my_game::my_game;
use my_coin::ming_xx_faucet_coin::MING_XX_FAUCET_COIN;
use sui::balance::{Self, Balance};
use sui::coin::{Self, Coin};
use sui::random::{Self, Random};
use sui::transfer::{share_object, public_transfer, transfer};

const EExceedBalance: u64 = 0x0;

public struct Ming_XX_Game has key {
    id: UID,
    val: Balance<MING_XX_FAUCET_COIN>,
}

public struct AdminCap has key {
    id: UID,
}

fun init(ctx: &mut TxContext) {
    let game = Ming_XX_Game {
        id: object::new(ctx),
        val: balance::zero(),
    };
    share_object(game);

    let admin = AdminCap {
        id: object::new(ctx),
    };

    transfer(admin, ctx.sender());
}

public entry fun DepositCoin(game: &mut Ming_XX_Game, coin: Coin<MING_XX_FAUCET_COIN>,_ctx:&mut TxContext) {
    game.val.join(coin::into_balance(coin));
}

public entry fun WithdrawCoin(_: &AdminCap, game: &mut Ming_XX_Game, value: u64, ctx: &mut TxContext) {
    let out_balance = game.val.split(value);
    let out_coin = coin::from_balance(out_balance, ctx);
    public_transfer(out_coin, ctx.sender());
}

entry fun play(
    game: &mut Ming_XX_Game,
    rnd: &Random,
    guess: bool,
    in_coin: Coin<MING_XX_FAUCET_COIN>,
    ctx: &mut TxContext
) {
    let mut gen = random::new_generator(rnd, ctx);
    let flip_value = random::generate_bool(&mut gen);
    let val_value = in_coin.value();
    let game_val = game.val.value();
    assert!(game_val >= val_value * 10, EExceedBalance);
    if (guess == flip_value) {
        let out_balance = game.val.split(val_value);
        let out_coin = coin::from_balance(out_balance, ctx);
        public_transfer(out_coin, ctx.sender());
        public_transfer(in_coin, ctx.sender());
    }else {
        DepositCoin(game,in_coin,ctx);
    }
}


