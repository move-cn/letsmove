
/// Module: my_coin
module my_coin::my_coin {
    use sui::coin;
    use sui::transfer::{share_object,freeze_object,public_transfer,public_freeze_object};
    use sui::tx_context::sender;
    use sui::url::Url;

    public struct MY_COIN has drop{}

    //one-time-witness 的用法
    fun init(wintness:MY_COIN,ctx:&mut TxContext){
        let icon_url = option::none<Url>();
        //move 没有小数
        let (treasury_cap,coin_metadata) = 
        coin::create_currency(wintness,6,b"somewher1",b"somewher1",b"this is produced bysomewhere1",icon_url,ctx);

        //所有权共享 不可变共享
        public_freeze_object(coin_metadata);
        //把国库的管理权限移交给 ctx 独享所有权
        public_transfer(treasury_cap,sender(ctx));
    }
    //命令行方法调用 sui client --package 0x2   --module  coin   --function mint  --args  
    
}

