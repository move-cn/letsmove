module xushizhao_game::xushizhao_game {
    use sui::coin::{Self, TreasuryCap,Coin};
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;
    use std::debug::print;
    use sui::object::{Self, UID};
    use xushizhao_coin::xushizhao_faucet_coin::{Self,XUSHIZHAO_FAUCET_COIN};

    const Small: u64 = 0;
    const Big: u64 = 1;
    const Equal: u64 = 2;

    public struct GamingResultEvent has copy, drop {
        is_win: bool,       
        result: String,
        you_number: u8,
        game_number: u8,
    }

    public entry fun get_random_choice(clock: &Clock) : u8 {    
        let g = clock::timestamp_ms(clock);
        print(&g);   

       
        ((clock::timestamp_ms(clock) % 3) as u8)
    }


    public entry fun play(choice: u8, clock: &Clock , treasury_cap: &mut TreasuryCap<XUSHIZHAO_FAUCET_COIN>, 
                    to: address,  coinobject: Coin<XUSHIZHAO_FAUCET_COIN> , recipient:address , ctx: &mut TxContext) { 

      
        let computer_choice = get_random_choice(clock);
        print(&computer_choice);
        let mut check = false;

        //通过获取的随机数比大小
        let (result, is_win) = if (choice > computer_choice) {
            //如何比大小赢了，就可以得到一个coin
            xushizhao_faucet_coin::mint(treasury_cap, 100, to , ctx);
            (string::utf8(b"Win"), true)
        } else if (choice == computer_choice) {            
            (string::utf8(b"Draw"), false)
        } else {            
            (string::utf8(b"Lose"), false)
        };       

        event::emit(GamingResultEvent {
            result,
            is_win,
            you_number: choice,
            game_number: computer_choice,
        });
        
        //每次游戏，都要消耗一个XUSHIZHAO_FAUCET_COIN
        transfer::public_transfer(coinobject,recipient);

        
    }

        
  


    // #[test]
    // fun creating_a_clock_and_incrementing_it() {

    //     let mut ctx = tx_context::dummy();
    //     let mut clock = clock::create_for_testing(&mut ctx);
    //     clock.increment_for_testing(668);
    //     play(0,&clock);
    //     clock.increment_for_testing(100);
    //     play(1,&clock);
    //     clock.increment_for_testing(44);
    //     play(2,&clock);
    //     clock.increment_for_testing(33);
    //     play(3,&clock);
    //     clock.increment_for_testing(168);
    //     play(2,&clock);
    //     clock.increment_for_testing(1246168);
    //     play(1,&clock);


    //     clock::destroy_for_testing(clock);


    // }

}

