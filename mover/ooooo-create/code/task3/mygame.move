module mygame::mygame {
// 
    use std::string;
    use sui::event;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::tx_context::{Self,TxContext};
    use hello_coins::faucetcoin::{Self, FAUCETCOIN};


    const JISHU: u64 = 1;
    const OUSHU: u64 = 0;

    public struct Gamed has copy, drop {
        guess: u64;
        show: u64;
        amount: u64;
        result: string::String;
    }

    public fun play(
        treasury_cap: &mut TreasuryCap<FAUCETCOIN>,
        coin: Coin<FAUCETCOIN>,
        guess: u64,
        ctx: &mut TxContext;
    ){
        assert!(guess==JISHU || guess==OUSHU,0);
        let amount = coin.value();
        let tx_digest = tx_context::digest(ctx);
        let tx_digest_u64= bcs::peel_u64(&mut bcs::new(*tx_digest));
        let random_num = tx_digest_u64 % 2;
        if (guess == random_num) {
            result = string::utf8(b"ooooo-create Win!");
            faucetcoin::mint(treasury_cap,amount*2,tx_context::sender(ctx))
        }else{
            result = string::utf8(b"ooooo-create Lose!");
        };
        let game_event = Gamed{
            guess: guess,
            show: random_num,
            amount: amount,
            result: result,
        }
        // coin::burn(treasury_cap, coin);
        event::emit(game_event);
    }
}