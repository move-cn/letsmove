
/// Module: my_coin
module my_coin::supply_coin {
    use sui::coin::Coin;
    use sui::coin;
    use sui::transfer::{share_object,freeze_object,public_transfer,public_freeze_object};
    use sui::tx_context::sender;
    use sui::url::Url;
    use sui::balance::Supply;
    use sui::balance;
    public struct SUPPLY_COIN has drop{}

    public struct SupplyHold<phantom T> has key{
        id:UID,
        supply:Supply<T>
    }
    //one-time-witness 的用法
    fun init(wintness:SUPPLY_COIN,ctx:&mut TxContext){
        let icon_url = option::none<Url>();
        //move 没有小数
        let (treasury_cap,coin_metadata) = 
        coin::create_currency(wintness,6,b"stan",b"meme",b"this is stan meme",icon_url,ctx);

        //所有权共享 不可变共享
        public_freeze_object(coin_metadata);
        
        

        //设置白名单
        let supply = coin::treasury_into_supply(treasury_cap);

        let supply_hold = SupplyHold{
            id: object::new(ctx),
            supply:supply
        };

     //share了所有权
     share_object(supply_hold);
    }

    //命令行方法调用 sui client --package 0x2   --module  coin   --function mint  --args  
    public fun mint(supply_hold:&mut SupplyHold<SUPPLY_COIN>,amt:u64,ctx:&mut TxContext):Coin<SUPPLY_COIN>{
      
        let _call_addres = sender(ctx);
        if (amt < 10000){
            abort 0
        };
        let supply_balance = balance::increase_supply(&mut supply_hold.supply, amt);
        let supply_coin = coin::from_balance(supply_balance,ctx);

        supply_coin
    }
}

