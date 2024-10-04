module task4::mini_game{
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::balance::{Self,Balance};
    use sui::coin::{Self,Coin};
    use task2::ridesun_FAUCET_coin::RIDESUN_FAUCET_COIN;
    const EInvalidNumber:u64=1;
    const EInvalidDeposit:u64=2;
    public struct GameCoinPool<phantom RIDESUN_FAUCET_COIN> has key{
        id:UID,
        owner:address,
        coins:Balance<RIDESUN_FAUCET_COIN>,
        amount:u64
    }
    public struct GamingResultEvent has copy,drop{
        welcome:String,
        is_win:bool,
        your_points:u8,
        computer_points:u8,
        result:String,
        reward:u8
    }
    public entry fun create(
        reward: Coin<RIDESUN_FAUCET_COIN>,
        ctx: &mut TxContext
    ){
        let amount=coin::value(&reward);
        let pool=GameCoinPool<RIDESUN_FAUCET_COIN>{
            id:object::new(ctx),
            owner:tx_context::sender(ctx),
            coins:coin::into_balance(reward),
            amount
        };
        transfer::share_object(pool);
    }
    fun get_random_points(clock:&Clock):u8{
        ((clock::timestamp_ms(clock) % 10) as u8)
    }
    public entry fun play(pool:&mut GameCoinPool<RIDESUN_FAUCET_COIN>,coin:Coin<RIDESUN_FAUCET_COIN>,your_points:u8,clock:&Clock,ctx:&mut TxContext){
        assert!(coin::value(&coin)>0,EInvalidDeposit);
        assert!(your_points < 10, EInvalidNumber);

        let welcome=string::utf8(b"Welcome to ridesun's 14 points game!");
        let computer_points=get_random_points(clock);
        pool.coins.join(coin::into_balance(coin));
        pool.amount=pool.amount+1;
        let (result,is_win)=if(your_points+computer_points==14){
            if (pool.amount>0){
                transfer::public_transfer(coin::take(&mut pool.coins, 1, ctx), tx_context::sender(ctx));
            };
            (string::utf8(b"Win"),true)
        }else{
            (string::utf8(b"Lose"),false)
        };
        event::emit(GamingResultEvent{
            welcome,
            result,
            your_points,
            computer_points,
            is_win,
            reward:1
        });
    }
    public entry fun withdraw(pool:&mut GameCoinPool<RIDESUN_FAUCET_COIN>, ctx: &mut TxContext){
        let full_balance = balance::value(&pool.coins);
        transfer::public_transfer(coin::take(&mut pool.coins, full_balance, ctx), pool.owner);
    }
}
