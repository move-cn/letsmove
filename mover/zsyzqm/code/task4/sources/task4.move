module task4::zsyzqm_game {
    use std::string::{Self, String};
    use sui::tx_context::{ sender};
    use sui::coin::{Self, TreasuryCap, Coin};
    use sui::balance::{Self, Balance};
    use sui::event;
    use sui::clock::{Self, Clock};

    const MaxNumber: u8 = 5;  // maximum number to guess

    // balance pool to store the bonus
    public struct BONUS_POOL<phantom T> has key, store {
        id: UID,
        balance: Balance<T>,
    }

    public struct GamingResultEvent has copy, drop {
        is_win: bool,
        your_choice: u8,
        zsyzqm_choice: u8,
        result: String,
    }

    fun init(ctx: &mut TxContext) {
    }

    entry fun create_pool_inner<T> (ctx: &mut TxContext){
        let pool = BONUS_POOL<T> {
            id: object::new(ctx),
            balance: balance::zero(),
        };
        transfer::share_object(pool)
    }
    
    fun get_random_number(clock: &Clock) : u8 {
        ((clock::timestamp_ms(clock) % (MaxNumber as u64 + 1)) as u8)
    }

    entry fun play<T>(choice: u8, clock: &Clock, pool: &mut BONUS_POOL<T>, treasury_cap: &mut TreasuryCap<T>, ctx: &mut TxContext) {
        let zsyzqm_choice = get_random_number(clock);
        
        let (result, is_win) = if (zsyzqm_choice == choice) {
            (b"Congratulations on guessing the right number, you are going to get all the gold coins in the prize pool! Please check your wallet😄", true)
        } else {
            (b"Unfortunately, you're wrong. You'll have to pay a coin into the pool💔", false)
        };

        event::emit(GamingResultEvent {
            result: string::utf8(result),
            is_win,
            your_choice: choice,
            zsyzqm_choice: zsyzqm_choice,
        });

        if (is_win) {
            let all_bouns = balance::withdraw_all(&mut pool.balance);
            let coin = coin::from_balance(all_bouns, ctx);

            transfer::public_transfer(coin, sender(ctx));
        } else {
            let coin = coin::mint(treasury_cap, 1, ctx);
            balance::join(&mut pool.balance, coin::into_balance(coin));
        }
    }
}