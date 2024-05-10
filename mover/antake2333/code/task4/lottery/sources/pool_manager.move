module lottery::pool_manager{
    use std::string::String;
    use sui::clock::{Self,Clock};
    use lottery::pool::{Self,Pool,PoolTicket,WinerPoolTicket};
    use sui::table_vec::{Self,TableVec};
    use lottery::drand_lib::{derive_randomness, safe_selection};

    public struct PoolAdminCap has key {id:UID}   


    fun create_pool_admin_cap(ctx:&mut TxContext) : PoolAdminCap {
        PoolAdminCap{
            id:object::new(ctx)
        }
    }


    public(package) fun mint_pool_admin_cap_and_take(ctx:&mut TxContext){
        transfer::transfer(create_pool_admin_cap(ctx),tx_context::sender(ctx));
    }

    public(package) fun create_pool<ReceiveCoin> (
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
            pool::create_pool<ReceiveCoin>(name,ticket_price,interval,max_cap,start_time,option::some(tx_context::sender(ctx)),pool_fee,settle_fee,fee_rate,ctx);
        }


    public(package) fun update_pool_status<ReceiveCoin>(pool:&mut Pool<ReceiveCoin>,status:u8){
        pool::update_pool_status(pool,status);
    }

    public(package) fun settle_pool<ReceiveCoin>(pool:&mut Pool<ReceiveCoin>, drand_sig: vector<u8>,clock: &Clock,ctx:&mut TxContext){
        // 这里要判断池子是否可以结算,结算满足两个条件 第一个 卖出数量=最大容量 第二个,当前时间超过了截止时间
        let sold_cap = pool::get_sold_cap(pool);
        let max_cap = pool::get_max_cap(pool);
        let end_time = pool::get_end_time(pool);
        let now_time = clock::timestamp_ms(clock);
        if( sold_cap ==  max_cap || now_time > end_time ) {
            // 这里要从ticket中随机获取一张中间的彩票,然后再结算
            let tickets: &TableVec<PoolTicket> = pool::get_tickets(pool);
            let ticket_length = table_vec::length(tickets);
            let digest = derive_randomness(drand_sig);
            let random_index = safe_selection(ticket_length, &digest);
            let random_ticket = table_vec::borrow(tickets, random_index);
            let winner_pool_ticket = pool::copy_pool_ticket(random_ticket);
            {
                std::debug::print(tickets);
                std::debug::print(&ticket_length);
                std::debug::print(&winner_pool_ticket);
            };
            distribute_and_reset_pool(pool,winner_pool_ticket,now_time,ctx);
        };
    }

    fun distribute_and_reset_pool<ReceiveCoin>(pool:&mut Pool<ReceiveCoin>,winner_ticket:WinerPoolTicket,start_time:u64,ctx:&mut TxContext){
        pool::distribute_pool(pool,winner_ticket,ctx);
        pool::reset_pool(pool,start_time);
    }
}