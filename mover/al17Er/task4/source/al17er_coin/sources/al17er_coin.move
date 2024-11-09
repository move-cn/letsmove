module al17er_coin::al17er_coin;

use sui::coin::{Self,TreasuryCap}; //调用sui包下的coin模块

public struct AL17ER_COIN has drop{} //定义一个只有drop能力的结构体，该结构体没有用泛型，没有字段，全部大写，可以作为一次见证标记。

fun init(witness:AL17ER_COIN,ctx: &mut TxContext){
    let (treasury,metadata)=coin::create_currency(witness,6,b"AL",b"AL17ER",b"A",option::none(),ctx);//小数位，货币单位，货币展示，货币图标，货币元数据，交易上下文，会返回2个值一个treasury，一个metadata
    transfer::public_freeze_object(metadata);
    transfer::public_share_object(treasury)
}

public fun mint(
    treasury_cap:&mut TreasuryCap<AL17ER_COIN>,
    amount:u64,
    //recipient:address,
    ctx:&mut TxContext,
){
    let coin = coin::mint(treasury_cap,amount,ctx);
    transfer::public_transfer(coin,ctx.sender())
}
