#[allow(unused_field,unused_const)]
module lottery::pool {
    use sui::coin::{Self,Coin};
    use sui::clock::{Self,Clock};
    use std::string::String;
    use sui::balance::{Self,Balance};
    use sui::table_vec::{Self,TableVec};
    use sui::event;
    use std::type_name::{Self,TypeName};

    const PoolStatusActive: u8 = 1;

    const PoolStatusInactive: u8 = 0;

    const ErrPoolNotInProcess: u64 = 100;
    const ErrPoolNotEnoughOnetTicket: u64 = 101;
    const ErrPoolNotEnoughtTicket: u64 = 102;
 

    public struct PoolTicket has key, store {
        id: UID,
        pool_id: ID,
        owner_address: address,
        ticket_price: u64,
    }

    public struct WinerPoolTicket has copy, store, drop {
        ticket_id: ID,
        pool_id: ID,
        owner_address: address,
        ticket_price: u64,
    }
    
    public struct Pool<phantom ReceiveCoin> has key, store {
        id: UID,
        name: String,
        ticket_price: u64,
        interval: u64, // ms
        max_cap: u64,
        start_time: u64,// ms
        end_time: u64,
        sold_cap: u64,
        total_bonus: Balance<ReceiveCoin>,
        status: u8,
        tickets: TableVec<PoolTicket>,
        pool_fee_address:Option<address>,
        pool_fee:u64, // 万分之
        settle_fee:u64, // 万分之
        fee_rate:u64 // 10000 就是万分之
    }

    // events

    public struct CreatePoolEvent has copy,drop {
        pool_id:ID,
        name: String,
        ticket_price: u64,
        interval: u64, // ms
        max_cap: u64,
        start_time: u64,// ms
        end_time: u64,
        receive_coin: TypeName,
        pool_fee_address:Option<address>,
        pool_fee:u64, // 万分之
        settle_fee:u64, // 万分之
        fee_rate:u64 ,// 10000 就是万分之
        sender: address
    }

    public struct BuyTicketEvent has copy,drop {
        ticket_ids: vector<ID>,
        pool_id: ID,
        owner_address: address,
        ticket_price: u64,
        ticket_amount: u64,
    }

    public struct SettlePoolEvent has copy,drop {
        pool_id:ID,
        winner_ticket:WinerPoolTicket,
        pool_fee_amount:u64,
        settle_fee_amount:u64,
        bonus:u64,
    }

    public(package) fun create_pool<ReceiveCoin> (
        name:String,
        ticket_price: u64,
        interval:u64,
        max_cap:u64,
        start_time: u64,
        pool_fee_address:Option<address>,
        pool_fee:u64,
        settle_fee:u64,
        fee_rate:u64,
        ctx:&mut TxContext
        ) {
        let end_time = start_time + interval;
        let pool = Pool {
            id: object::new(ctx),
            name: name,
            ticket_price: ticket_price,
            interval: interval, // ms
            max_cap: max_cap,
            start_time: start_time,// ms
            end_time: end_time,
            sold_cap: 0,
            total_bonus: balance::zero<ReceiveCoin>(),
            status: PoolStatusActive,
            tickets: table_vec::empty(ctx),
            pool_fee_address:pool_fee_address,
            pool_fee:pool_fee,
            settle_fee:settle_fee,
            fee_rate:fee_rate
        };
        event::emit(CreatePoolEvent {
                    pool_id:object::uid_to_inner(&pool.id),
                    name: *&pool.name,
                    ticket_price: *&pool.ticket_price,
                    interval: *&pool.interval,
                    max_cap: *&pool.max_cap,
                    start_time: *&pool.start_time,
                    end_time: *&pool.end_time,
                    receive_coin: type_name::get<ReceiveCoin>(),
                    pool_fee_address:*&pool.pool_fee_address,
                    pool_fee:*&pool.pool_fee, 
                    settle_fee:*&pool.settle_fee, 
                    fee_rate:*&pool.fee_rate,
                    sender:tx_context::sender(ctx)
        });
        transfer::public_share_object(pool);
    }

    public(package) fun update_pool_status<ReceiveCoin>(pool:&mut Pool<ReceiveCoin>,status:u8){
        pool.status=status;
    }

    public(package) fun reset_pool<ReceiveCoin>(pool:&mut Pool<ReceiveCoin>,start_time:u64){
        // once pool settle reset pool
        pool.start_time=start_time;
        pool.end_time=start_time+*&pool.interval;
        pool.sold_cap=0;
        // send rest coin to admin address
        // move to distribute_pool
        /* if(option::is_some(&pool.reset_address)){
           let rececive_coin = coin::from_balance(balance::withdraw_all(&mut pool.total_bonus),ctx);
           let reset_address= option::borrow<address>(&pool.reset_address);
           transfer::public_transfer(rececive_coin,*reset_address);
        }; */
        if(!table_vec::is_empty(&pool.tickets)){
            while(!table_vec::is_empty(&pool.tickets)){
               let PoolTicket{id,pool_id:_,owner_address:_,ticket_price:_} = table_vec::pop_back(&mut pool.tickets);
               object::delete(id);
            }
        };
    }
    
    #[allow(lint(self_transfer))]
    public(package) fun distribute_pool<ReceiveCoin>(pool:&mut Pool<ReceiveCoin>,
    winner_ticket:WinerPoolTicket,
    ctx:&mut TxContext){
        // 这里瓜分池子,池子里面还需要一个配置就是,
        // settle_pool的人能分多少,池子手续费多少,然后剩下的全部交给中奖的人
        // 手续费都是万分之 比如 settle_fee = 1 就是万分之1
        if(option::is_some(&pool.pool_fee_address)){
           let mut rececive_coin = coin::from_balance(balance::withdraw_all(&mut pool.total_bonus),ctx);
           let receive_coin_amount= coin::value(&rececive_coin);
           let pool_fee= *&pool.pool_fee as u64;
           let settle_fee =*&pool.settle_fee as u64;
           let fee_rate=*&pool.fee_rate as u64;
           let mut pool_fee_amont:u64 = 0;
           let mut settle_fee_amont:u64 = 0;
           if(pool_fee > 0){
                pool_fee_amont =  receive_coin_amount * pool_fee /  fee_rate;
                if(pool_fee_amont > 0){
                    let pool_fee_coin = coin::split(&mut rececive_coin, 
                    pool_fee_amont
                    ,ctx);
                    let reset_address= option::borrow<address>(&pool.pool_fee_address);
                    transfer::public_transfer(pool_fee_coin,*reset_address);
                };
           };
           if(settle_fee > 0){
                settle_fee_amont=receive_coin_amount * settle_fee /  fee_rate;
                if(settle_fee_amont > 0){
                    let settle_fee_coin = coin::split(&mut rececive_coin, 
                    settle_fee_amont
                    ,ctx);
                    transfer::public_transfer(settle_fee_coin,tx_context::sender(ctx));
                };
           };
           let settle_pool_event = SettlePoolEvent{
                pool_id:object::uid_to_inner(&pool.id),
                winner_ticket:winner_ticket,
                pool_fee_amount:pool_fee_amont,
                settle_fee_amount:settle_fee_amont,
                bonus:coin::value(&rececive_coin),
           };
           std::debug::print(&settle_pool_event);
           event::emit(settle_pool_event);
           transfer::public_transfer(rececive_coin,winner_ticket.owner_address);
        };
    }


    #[allow(lint(self_transfer))]
    public(package) fun buy_ticket<ReceiveCoin>(pool:&mut Pool<ReceiveCoin>,mut payment_coin:Coin<ReceiveCoin>,clock: &Clock,ctx:&mut TxContext){
        assert!(is_inprocess(clock::timestamp_ms(clock),*&pool.start_time,*&pool.end_time,*&pool.status),ErrPoolNotInProcess);
        // 这里总共给了多少coin,除单价就是ticket的张数,剩下的coin返回给购买人
        // 如果coin数量小于单张价格直接返回
        let coin_value=coin::value(&payment_coin);
        let ticket_price=*&pool.ticket_price as u64;
        assert!(coin_value >= ticket_price,ErrPoolNotEnoughOnetTicket);
        let ticket_amount= coin_value / ticket_price;
        std::debug::print(&ticket_amount);
        assert!(ticket_amount + (*&pool.sold_cap) <= *&pool.max_cap,ErrPoolNotEnoughtTicket);
        let cost_coin=coin::split(&mut payment_coin,ticket_amount*ticket_price,ctx);
        std::debug::print(&cost_coin);
        let mut ticket_ids=vector::empty<ID>();
        {
            // 这里先修改pool的数据,然后再创建ticket放到pool中
            *&mut pool.sold_cap = *&pool.sold_cap+ticket_amount;
            balance::join(&mut pool.total_bonus,coin::into_balance(cost_coin));
            let mut i=0;
            while(i < ticket_amount){
                // 这里构造ticket
                let pool_ticket = PoolTicket{
                    id:object::new(ctx),
                    pool_id: object::uid_to_inner(&pool.id),
                    owner_address: tx_context::sender(ctx),
                    ticket_price: *&pool.ticket_price
                };
                vector::push_back<ID>(&mut ticket_ids,object::uid_to_inner(&pool_ticket.id));
                table_vec::push_back(&mut pool.tickets,pool_ticket);
                i = i + 1;
            }
        };
        event::emit(BuyTicketEvent{
            ticket_ids: ticket_ids,
            pool_id: object::uid_to_inner(&pool.id),
            owner_address: tx_context::sender(ctx),
            ticket_price: ticket_price,
            ticket_amount: ticket_amount
        });
        // 这里需要注意一点,如果最后需要返回coin就需要发送回去,如果不需要则需要删除掉
        if(coin::value(&payment_coin) > 0){
            transfer::public_transfer(payment_coin,tx_context::sender(ctx));
        }else{
            coin::destroy_zero(payment_coin);
        };
    }


    /// check the pool is inprocess
    fun is_inprocess(now_time_stamp:u64, start_time:u64, end_time:u64, status:u8 ) : bool{
        if(status == PoolStatusInactive){
            return false
        }else if(now_time_stamp < start_time){
            return false
        }else if(now_time_stamp > end_time){
            return false
        };
        true
    }

    public fun get_start_time<ReceiveCoin>(pool:&Pool<ReceiveCoin>) :u64 {
        pool.start_time
    }

    public fun get_end_time<ReceiveCoin>(pool:&Pool<ReceiveCoin>) :u64 {
        pool.end_time
    }

    public fun get_sold_cap<ReceiveCoin>(pool:&Pool<ReceiveCoin>) :u64 {
        pool.sold_cap
    }
    
    public fun get_max_cap<ReceiveCoin>(pool:&Pool<ReceiveCoin>) :u64 {
        pool.max_cap
    }

    public fun get_tickets<ReceiveCoin>(pool:&Pool<ReceiveCoin>) : &TableVec<PoolTicket> {
        &pool.tickets
    }

    public fun copy_pool_ticket(pool_ticket:&PoolTicket) : WinerPoolTicket {
        WinerPoolTicket {
            ticket_id: object::uid_to_inner(&pool_ticket.id),
            pool_id: *&pool_ticket.pool_id,
            owner_address: *&pool_ticket.owner_address,
            ticket_price: *&pool_ticket.ticket_price,
        }
    }
}