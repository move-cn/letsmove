/*
/// Module: fishing
module fishing::fishing {
}
*/

#[allow(unused_use)]
module fishing::fish_demo{
    use 0x2::random::{Self,Random};
    use sui::coin::{Self,TreasuryCap,Coin};
    use std::string;
    use sui::balance::{Self, Balance};
    use sui::sui::SUI;
    use sui::object::{Self};
    use sui::clock::{Self,Clock};
    // use fishing::managed::{Self, MANAGED};

    const EOutOfIndex: u64 = 0;

    ///Entity
    public struct Fish has key,store{
        id: UID,
        type_fish: string::String,
    }
    
    public struct Pool has key{
        id: UID,
        fishes: vector<Fish>,
        total_amount: u64,
    }

    public struct Treesirop has key,store{
        id: UID,
        store: vector<Fish>
    }

    // public fun player(ctx: &mut TxContext){
    //     let player = Player{
    //         id: object::new(ctx),
    //         store: vector::empty<Fish>()
    //     };
    //     transfer::transfer(player,tx_context::sender(ctx));
    // }

    // public fun make_pool(ctx: &mut TxContext){
    //     let pool = Pool{
    //         id: object::new(ctx),
    //         fishes: vector::empty<Fish>(),
    //         total_amount: 0,
    //     };
    //     transfer::share_object<Pool>(pool);
    // }
    
    fun init(ctx: &mut TxContext){
        let pool = Pool{
            id: object::new(ctx),
            fishes: vector::empty<Fish>(),
            total_amount: 0,
        };
        let player = Treesirop{
            id: object::new(ctx),
            store: vector::empty<Fish>()
        };
        transfer::share_object<Pool>(pool);
        transfer::transfer(player,tx_context::sender(ctx));   
    }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(ctx);
    }
    
    public entry fun add_pool(
        pool: &mut Pool,
        amount: u64,
        type_fish: vector<u8>,
        ctx: &mut TxContext
    ){
        let mut i = 0;
        while (i < amount){
            let fishes = Fish{id: object::new(ctx),type_fish: string::utf8(type_fish)};
            vector::push_back(&mut pool.fishes,fishes);     
            i = i + 1;
        };
        pool.total_amount = vector::length<Fish>(&mut pool.fishes);
    }

    public entry fun fishing_last_one(
        pool: &mut Pool,
        player: &mut Treesirop,
        ctx: &mut TxContext
    ){  
        let fish = vector::pop_back(&mut pool.fishes);
        pool.total_amount = vector::length<Fish>(&mut pool.fishes);
        vector::push_back(&mut player.store,fish);
    }

    public entry fun fishing_random_one(
        pool: &mut Pool,
        player: &mut Treesirop,
        // random: &Random,
        clock: &Clock,
        ctx: &mut TxContext
    ){  
        // let mut rng = random::new_generator(random,ctx);
        // // 定义随机数范围
        // let min = 0;
        // let max = vector::length<Fish>(&mut pool.fishes);
        // 生成随机索引
        let random_index = get_random(pool, clock, ctx);
        // let random_number = 0x8::generate_u64_in_range(0,1);
        //assert!((random_number > vector::length<Fish>(&mut pool.fishes)),EOutOfIndex); 
        let fish = vector::swap_remove(&mut pool.fishes,random_index);
        pool.total_amount = vector::length<Fish>(&mut pool.fishes);
        vector::push_back(&mut player.store,fish);
    }

    // public fun get_random(random: &Random,ctx: &mut TxContext){
    //     let mut rng = random::new_generator(random,ctx);
    //     // 定义随机数范围
    //     let min = 0;
    //     let max = 10;
    //     // 生成随机索引
    //     let random_index = random::generate_u64_in_range(&mut rng, min, max);
    // }
    public fun get_random(pool: &mut Pool,clock: &Clock,ctx: &mut TxContext): u64{
        let current_timestamp = clock::timestamp_ms(clock);
        let random_index = current_timestamp % vector::length<Fish>(&mut pool.fishes);
        random_index
    }
    

}