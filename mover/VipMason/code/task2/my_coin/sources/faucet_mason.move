module my_coin::faucet_mason;
use sui::coin::create_currency;
use std::option::{Self,none,some};
use sui::transfer::{public_share_object, public_freeze_object};
use sui::url::{Self,Url};
public struct FAUCET_MASON has drop{

}

fun init(faucet_mason: FAUCET_MASON, ctx: &mut TxContext){

    let none = none<Url>();
    let url = url::new_unsafe_from_bytes(b"https://1000logos.net/wp-content/uploads/2022/03/Mason-Logo-Classic.png");
    let yes = some<Url>(url);
    // 创建代币并设置元信息
    let (treasury, coin_metadata) = create_currency(faucet_mason,//目标对象
        8,// 精度，小数点后8位
        b"FMC",// 代币名称
        b"Faucet_Mason_coin",// 代币符号
        b"Mason Faucet_Coin , service for anyone!",// 描述
        yes,//coin币图标
        ctx);
    // 冻结元信息，禁止修改
    public_freeze_object(coin_metadata);

    // 分享代币对象供他人使用
    public_share_object(treasury);
}

