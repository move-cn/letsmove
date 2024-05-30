module lottery::lottery {
    use std::string::String;
    use sui::clock::Clock;
    use sui::coin::Coin;
    use lottery::pool::{Self,Pool};
    use lottery::pool_manager::{Self};
    use lottery::pool_manager::PoolAdminCap;

    public struct LOTTERY has drop{}

    fun init(_otw:LOTTERY,ctx:&mut TxContext){
        // mint PoolAdminCap to sender
        pool_manager::mint_pool_admin_cap_and_take(ctx);
    }

    #[test_only]
    public fun init_test(ctx:&mut TxContext){
        pool_manager::mint_pool_admin_cap_and_take(ctx);
    }

    public entry fun create_pool<ReceiveCoin> (
        _poolAdminCap:&PoolAdminCap,
        name:String,
        ticket_price: u64,
        interval:u64,
        max_cap:u64,
        start_time: u64,
        pool_fee:u64,
        settle_fee:u64,
        fee_rate:u64,
        ctx:&mut TxContext
        ){
            pool_manager::create_pool<ReceiveCoin>(name,ticket_price,interval,max_cap,start_time,pool_fee,settle_fee,fee_rate,ctx);
        }


    public entry fun update_pool_status<ReceiveCoin>(_poolAdminCap:&PoolAdminCap,pool:&mut Pool<ReceiveCoin>,status:u8){
        pool_manager::update_pool_status<ReceiveCoin>(pool,status);
    }


    public entry fun buy_ticket<ReceiveCoin>(pool:&mut Pool<ReceiveCoin>,payment_coin:Coin<ReceiveCoin>,clock: &Clock,ctx:&mut TxContext){
        pool::buy_ticket(pool,payment_coin,clock,ctx);
    }

    public entry fun settle_pool<ReceiveCoin>(pool:&mut Pool<ReceiveCoin>, drand_sig: vector<u8>,clock: &Clock,ctx:&mut TxContext){
        pool_manager::settle_pool(pool,drand_sig,clock,ctx);
    }
}