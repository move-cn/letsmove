module task4::accumulate_to_target_game {
    use std::string::{Self, String};
    use sui::tx_context::{sender};
    use sui::coin::{Self, TreasuryCap, Coin};
    use sui::balance::{Self, Balance};
    use sui::event;
    use sui::clock::{Self, Clock};

    const SymbolRange: u8 = 10;

    public struct AccumulateGame<phantom T> has key, store {
        id: UID,
        target_value: u64,
        current_value: u64,
        balance: Balance<T>,
    }

    public struct PlayResultEvent has copy, drop {
        message: String,
        current_value: u64,
        is_win: bool,
    }

    fun init(ctx: &mut TxContext) {
    }

    entry fun creat_game<T>(ctx: &mut TxContext) {
        // 初始化游戏，当前值为零，余额为空。
        let game = AccumulateGame<T> {
            id: object::new(ctx),
            target_value: 100,
            current_value: 0,
            balance: balance::zero(),
        };
        transfer::share_object(game)
    }
    
    entry fun play<T>(clock: &Clock, game: &mut AccumulateGame<T>, treasury_cap: &mut TreasuryCap<T>, ctx: &mut TxContext) {

        let timestamp = clock::timestamp_ms(clock);
        let add_value = ((timestamp % (SymbolRange as u64 + 1)) as u64);

        game.current_value = game.current_value + add_value;

        let (message, is_win) = if (game.current_value >= game.target_value) {
            (b"Congratulations, you've reached the target!", true)
        } else {
            (b"Keep going, you are on your way!", false)
        };

        event::emit(PlayResultEvent {
            message: string::utf8(message),
            current_value: game.current_value,
            is_win,
        });

        if (is_win) {
            // 如果赢了，把游戏的余额全部转给玩家。
            let all_coins = balance::withdraw_all(&mut game.balance);
            let coin = coin::from_balance(all_coins, ctx);
            transfer::public_transfer(coin, sender(ctx));
        } else {
            // 如果没有赢，铸造一个硬币并加到游戏的余额中。
            let coin = coin::mint(treasury_cap, 1, ctx);
            balance::join(&mut game.balance, coin::into_balance(coin));
        }
    }
}
