#[allow(duplicate_alias, unused_use)]
/// Module: blue_game
module blue_game::blue_game {
    use std::ascii::string;
    use std::debug;
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::tx_context::{TxContext, sender};
    use faucetcoin::faucet_coin::FAUCET_COIN;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    use sui::object;
    use sui::object::UID;
    use sui::transfer;
    use sui::transfer::transfer;
    use sui::tx_context;

    const EInvalidNumber: u64 = 1;
    const PLAYER_WON_STATE: u8 = 1;

    public struct GamingResultEvent has copy, drop {
        is_win: bool,
        your_choice: String,
        croal99_choice: String,
        result: String,
    }

    public struct RewardPool has key {
        id: UID,
        balance: Balance<FAUCET_COIN>,
    }

    fun get_random_choice(clock: &Clock) : u8 {
        ((clock::timestamp_ms(clock) % 3) as u8)
    }

    fun map_choice_to_string(choice: u8) : String {
        if (choice == 0) {
            string::utf8(b"rock")
        } else if (choice == 1) {
            string::utf8(b"paper")
        } else if (choice == 2) {
            string::utf8(b"scissors")
        } else {
            string::utf8(b"Invalid")
        }
    }

    #[allow(lint(self_transfer))]
    public fun play(
        choice: u8,
        clock: &Clock,
        pool: &mut RewardPool,
        ctx: &mut TxContext,
    ) {
        debug::print(&string(b"play"));
        assert!(choice < 3, EInvalidNumber);
        debug::print(&choice);

        // let clock = clock
        let computer_choice = get_random_choice(clock);
        debug::print(&computer_choice);
        let (result, is_win) = if (
            (choice == 0 && computer_choice == 1)
            || (choice == 1 && computer_choice == 2)
            || (choice == 2 && computer_choice == 0)
        ) {
            (string::utf8(b"You win"), true)
        } else if (choice == computer_choice) {
            (string::utf8(b"Draw"), false)
        } else {
            (string::utf8(b"You Lose"), false)
        };

        debug::print(&result);

        if (is_win) {
            // Calculate the fee and transfer it to the house.
            // let stake_amount = balance::value(&pool.balance);
            // let fee_amount = balance::value(&pool.balance);
            let fee_amount = 1;
            let fees = balance::split(&mut pool.balance, fee_amount);
            // balance::join(hd::borrow_fees_mut(house_data), fees);
            transfer::public_transfer(coin::from_balance(fees, ctx), tx_context::sender(ctx));
            PLAYER_WON_STATE;
        };

        event::emit(GamingResultEvent {
            result,
            is_win,
            your_choice: map_choice_to_string(choice),
            croal99_choice: map_choice_to_string(computer_choice),
        });
    }

    public entry fun init_pool(
        coin: Coin<FAUCET_COIN>,
        ctx: &mut TxContext,
    ) {
        debug::print(&string(b"reward"));
        let pool = RewardPool {
            id: object::new(ctx),
            balance: coin::into_balance(coin)
        };

        // 初始化pool并分享
        transfer::share_object(pool);
    }
}
