module my_coin::mason;
use sui::coin::create_currency;
use std::option::{Self,none,some};
use sui::transfer::{public_transfer, public_freeze_object};
use sui::url::{Self,Url};
public struct MASON has drop{

}

fun init(mason: MASON, ctx: &mut TxContext){

    let none = none<Url>();
    let url = url::new_unsafe_from_bytes(b"https://1000logos.net/wp-content/uploads/2022/03/Mason-Logo-Classic.png");
    let yes = some<Url>(url);
     // 创建代币并设置元信息
    let (treasury, coin_metadata) = create_currency(mason,
        8,// 精度，小数点后8位
        b"MC",// 代币名称
        b"Mason coin",// 代币符号
        b"Mason 's coin",// 描述
        yes,//coin币图标
        ctx);
        // 冻结元信息，禁止修改
    public_freeze_object(coin_metadata);

    // 只允许部署coin的用户铸造
    public_transfer(treasury,ctx.sender())
}

