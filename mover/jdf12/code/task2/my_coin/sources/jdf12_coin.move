//包名my_coin 模块名jdf12_coin
module my_coin::jdf12_coin;
use std::option::{Option, none, some};
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_transfer};
use sui::url;
use sui::url::Url;

public struct JDF12_COIN has drop{}

fun init(jdf12Coin:JDF12_COIN, ctx: &mut TxContext){

    let no:Option<Url> = none<Url>();
    //为代币设置图片连接
    let url  = url::new_unsafe_from_bytes(b"https://img0.baidu.com/it/u=1023821093,4105519612&fm=253&fmt=auto&app=138&f=JPEG?w=359&h=499");
    let yes:Option<Url> = some<Url>(url);
    //创建一个代币
    /*
        treasuryCap : 货币的铸造权限
        coinMetadata : 代币的元数据信息
    */
    let (treasuryCap, coinMetadata) = create_currency(jdf12Coin,8,b"jdf12",b"jdf12",b"this is jdf12_coin",yes,ctx);
    //冻结对象,该对象不能被修改
    public_freeze_object(coinMetadata);
    //转移铸造权限，将铸造权限转移到发送此交易的账户上
    //现在是将铸币的权限发送给我们自己
    public_transfer(treasuryCap,ctx.sender())
}


