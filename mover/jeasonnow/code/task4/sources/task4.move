module task4::jeasonnow_game {
    use std::string::{Self, String};
    use sui::tx_context::{ sender};
    use sui::coin::{Self, TreasuryCap};
    use sui::balance::{Self, Balance};
    use sui::event;

    use task4::utils;


    public struct JEASONNOW_GAME has drop {}

    // balance pool to store the bonus
    public struct BONUS_POOL has key, store {
        id: UID,
        balance: Balance<JEASONNOW_GAME>,
    }

    public struct GamingResultEvent has copy, drop {
        is_win: bool,
        your_choice: u64,
        banker_choice: u64,
        result: String,
    }

    fun init(otw: JEASONNOW_GAME, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            otw,
            8,
            b"JGC",
            b"JeasonnowGameCoin",
            b"Jeasonnow Game Coin",
            option::none(),
            ctx
        );

        let pool = BONUS_POOL {
            id: object::new(ctx),
            balance: balance::zero(),
        };


        //freeze the metadata to share immutabale objects
        transfer::public_freeze_object(metadata);
        // public transfer, everyone can transfer the coin
        transfer::public_transfer(treasury_cap, sender(ctx));

        transfer::share_object(pool);
    }

    public entry fun play(choice: u64, pool: &mut BONUS_POOL, treasury_cap: &mut TreasuryCap<JEASONNOW_GAME>, ctx: &mut TxContext) {
        let banker_choice = utils::rand_u64_range(1, 10, ctx);
        
        let (result, is_win) = if (banker_choice == choice) {
            (b"Win", true)
        } else {
            (b"Lose", false)
        };

        event::emit(GamingResultEvent {
            result: string::utf8(result),
            is_win,
            your_choice: choice,
            banker_choice: banker_choice,
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

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(JEASONNOW_GAME {}, ctx)
    }
}