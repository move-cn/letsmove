module flip_coin::flip_coin;

use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::Coin;
use sui::random;
use sui::random::Random;
use sui::transfer::public_transfer;
use operaxxxfaucet::operaxxxfaucet::OPERAXXXFAUCET;

const E_TOKENS_TOO_BIG:u64 = 1;
const E_TOKENS_MUST_GREATER_THAN_ZERO:u64 = 2;

public struct Game has key {
    id:UID,
    amount: Balance<OPERAXXXFAUCET>
}

public struct AdminCap has key, store {
    id:UID
}

fun init (ctx: &mut TxContext) {
    // init game
    let game = Game{
        id: object::new(ctx),
        amount: balance::zero(),
    };

    let treasuryCap = AdminCap {
        id: object::new(ctx),
    };

    // share game
    transfer::share_object(game);
    transfer::transfer(treasuryCap, ctx.sender());
}

entry fun play(game: &mut Game,
              random: &Random,
              playerPrecision: bool,
              tokens: Coin<OPERAXXXFAUCET>,
              ctx: &mut TxContext ) {
    // verify tokens
    assert!(tokens.value() * 10 > tokens.value(), E_TOKENS_TOO_BIG);
    assert!(tokens.value() * 10 <= 0u64, E_TOKENS_MUST_GREATER_THAN_ZERO);

    let mut randomGenerator = random::new_generator(random, ctx);
    let curr_result = random::generate_bool(&mut randomGenerator);
    if (curr_result == playerPrecision) {
        // if win
        let out_balance = game.amount.split(tokens.value());
        let out_coin = coin::from_balance(out_balance, ctx);
        public_transfer(tokens, ctx.sender());
        public_transfer(out_coin, ctx.sender());
    } else {
        // if loose
        let in_balance = coin::into_balance(tokens);
        game.amount.join(in_balance);
    };
}

public entry fun addTokens(game: &mut Game, tokens: Coin<OPERAXXXFAUCET>, _: &mut TxContext) {
    let in_balance = coin::into_balance(tokens);
    game.amount.join(in_balance);
}

public entry fun withdraw(_:&AdminCap, game: &mut Game, amount: u64, ctx: &mut TxContext) {
    let out_balance = game.amount.split(amount);
    let out_coin = coin::from_balance(out_balance, ctx);
    public_transfer(out_coin, ctx.sender());
}