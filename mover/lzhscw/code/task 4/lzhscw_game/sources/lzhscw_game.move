module lzhscw_game::lzhscw_game {
    use std::string::{Self, String};
    use std::option;
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::object::{Self, UID};

    public struct LZHSCW_GAME has drop {}
    
    const EInvalidNumber: u64 = 1;

    public struct GamingResultEvent has copy, drop {
        is_win: bool,
        your_choice: String,
        computer_choice0: String,
        computer_choice1: String,
        computer_choice2: String,
        result: String,
    }
    
    fun init(witness: LZHSCW_GAME, ctx: &mut TxContext) {
    

        let (treasury_cap, metadata) = coin::create_currency<LZHSCW_GAME>(
            witness,
            1,
            b"LZHSCW_GAME",
            b"scw",
            b"deploy by lzhscw",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    fun get_random_choice_lzhscw(clock: &Clock) : u8 {
        ((clock::timestamp_ms(clock) % 6) as u8)
    }

    fun map_choice_to_string_lzhscw(choice: u8) : String {
        if (choice == 0) {
            string::utf8(b"small")
        } else if (choice == 1) {
            string::utf8(b"big")
        } else {
            string::utf8(b"Invalid")
        }
    }

    fun map_top_computer_choice_to_string_lzhscw(choice: u8) : String {
        if (choice == 0) {
            string::utf8(b"   ")
        } else if (choice == 1) {
            string::utf8(b"   ")
        } else if (choice == 2) {
            string::utf8(b"o  ")
        } else if (choice == 3) {
            string::utf8(b"o o")
        } else if (choice == 4) {
            string::utf8(b"o o")
        } else if (choice == 5) {
            string::utf8(b"o o")
        } else {
            string::utf8(b"Invalid")
        }
    }

    fun map_middle_computer_choice_to_string_lzhscw(choice: u8) : String {
        if (choice == 0) {
            string::utf8(b" o ")
        } else if (choice == 1) {
            string::utf8(b"o o")
        } else if (choice == 2) {
            string::utf8(b" o ")
        } else if (choice == 3) {
            string::utf8(b"   ")
        } else if (choice == 4) {
            string::utf8(b" o ")
        } else if (choice == 5) {
            string::utf8(b"o o")
        } else {
            string::utf8(b"Invalid")
        }
    }

    fun map_bottom_computer_choice_to_string_lzhscw(choice: u8) : String {
        if (choice == 0) {
            string::utf8(b"   ")
        } else if (choice == 1) {
            string::utf8(b"   ")
        } else if (choice == 2) {
            string::utf8(b"  o")
        } else if (choice == 3) {
            string::utf8(b"o o")
        } else if (choice == 4) {
            string::utf8(b"o o")
        } else if (choice == 5) {
            string::utf8(b"o o")
        } else {
            string::utf8(b"Invalid")
        }
    }

    public fun play_lzhscw(choice: u8, clock: &Clock, treasury_cap: &mut TreasuryCap<LZHSCW_GAME>, ctx: &mut TxContext) {//0 is small, 1 is big
        assert!(choice < 2, EInvalidNumber);

        let computer_choice = get_random_choice_lzhscw(clock);
        let (result, is_win) = if (
            (choice == 0 && computer_choice == 0)
            || (choice == 0 && computer_choice == 1)
            || (choice == 0 && computer_choice == 2)
        ) {
            (string::utf8(b"Win"), true)
        } else {
            (string::utf8(b"Lose"), false)
        };

        event::emit(GamingResultEvent {
            result,
            is_win,
            your_choice: map_choice_to_string_lzhscw(choice),
            computer_choice0: map_top_computer_choice_to_string_lzhscw(computer_choice),
            computer_choice1: map_middle_computer_choice_to_string_lzhscw(computer_choice),
            computer_choice2: map_bottom_computer_choice_to_string_lzhscw(computer_choice),
        });
        if(is_win){
            let value: u64 = 100;
            let sender = tx_context::sender(ctx);
            let coin = coin::mint(treasury_cap, value, ctx);
            transfer::public_transfer(coin, sender);
        }
    }

}


