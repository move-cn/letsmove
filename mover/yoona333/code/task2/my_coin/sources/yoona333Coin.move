module my_coin::yoona333Coin{   //定义了yoona333Coin模块

//导入依赖
use sui::coin::create_currency;  
use std::option::{none,some};   
use sui::transfer::{ public_transfer,public_freeze_object};   
use sui::url::{Self,Url};    

public struct YOONA333COIN has drop{}

fun init(yoona333Coin:YOONA333COIN, ctx: &mut TxContext) {

    // let no = none<Url>();
    
    let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/167958904?v=4");  
    let yes = some<Url>(url);  
    let (treasury,coin_metadata) =
    create_currency(yoona333Coin,8,b"YOONA333COIN",b"YOONA333COIN",b"This is YOONA333COIN",yes,ctx);
    
    
    public_freeze_object(coin_metadata);   //冻结 coin_metadata 对象，使其不可再被修改。
    
    public_transfer(treasury,ctx.sender())  //将 treasury 对象（初始代币）转移到当前交易的发送者地址。
    
}
}