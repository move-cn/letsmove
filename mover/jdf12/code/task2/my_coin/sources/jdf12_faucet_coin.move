module my_coin::jdf12_faucet_coin {

use std::option::{Option, none, some};
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_transfer, public_share_object};
use sui::url;
use sui::url::Url;

    //水龙头coin
    public struct JDF12_FAUCET_COIN has drop{}

    fun init(jdf12FaucetCoin:JDF12_FAUCET_COIN, ctx: &mut TxContext){

        let no:Option<Url> = none<Url>();
        //为代币设置图片连接
        let url  = url::new_unsafe_from_bytes(b"https://img0.baidu.com/it/u=1023821093,4105519612&fm=253&fmt=auto&app=138&f=JPEG?w=359&h=499");
        let yes:Option<Url> = some<Url>(url);
        //创建一个代币
        /*
            treasuryCap : 货币的铸造权限
            coinMetadata : 代币的元数据信息
        */
        let (treasuryCap, coinMetadata) = create_currency(jdf12FaucetCoin,8,b"jdf12_faucet_coin",b"jdf12_faucet_coin",b"this is jdf12_faucet_coin",yes,ctx);
        //冻结对象,该对象不能被修改
        public_freeze_object(coinMetadata);
        //转移铸造权限，将铸造权限共享出去，任何人都可以使用
        public_share_object(treasuryCap)
    }
}
