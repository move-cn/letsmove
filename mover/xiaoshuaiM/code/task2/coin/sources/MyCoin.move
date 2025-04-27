module task2::xscoin;
use sui::coin::{create_currency, TreasuryCap, mint_and_transfer, Coin, burn};
use std::option::{some, none};
use sui::transfer::{public_freeze_object, public_transfer};
use sui::url;
use sui::url::Url;

//一次性见证对象 XSCOIN必须是大写的,强制要求，和模块名一样
public struct XSCOIN has drop {}

fun init(xscoin: XSCOIN, ctx: &mut TxContext) {
    /*
    witness: T,
    decimals: u8,               精度,小数位 如果是4   1块钱就是10000  最小的倍数是0.0001
    symbol: vector<u8>,         代币符号:比如美元是:USD   人民币是:RMB
    name: vector<u8>,           coin 的名字
    description: vector<u8>,    coin 的说明  备注
    icon_url: Option<Url>,      coin 的图标
    ctx: &mut TxContext,        上下文
    */
    let url = url::new_unsafe_from_bytes(
        b"https://avatars.githubusercontent.com/u/200202346?s=400&u=0bf2998d9aa3fbc7db0ef75b0ce17540049dddb1&v=4"
    );
    let _no = none<Url>();              //空 url 对象
    let icon_url = some<Url>(url);
    //conin 的控制权限
    //coin 的信息图片/描述
    let (treasuryCap, coinMetadata) = create_currency(
        xscoin,                          //见证者对象
        8,                      //小数位数
        b"XSCOIN",               //代币符号
        b"XSCOIN",                //代币名称
        b"this is xsCOIn",    //代币描述
        icon_url,                       //代币icon
        ctx);
    //相当于把coinMetadata定义成了当量，不能修改了
    public_freeze_object(coinMetadata);
    //下发权限给ctx.sender()
    public_transfer(treasuryCap, ctx.sender());
}

public entry fun mymint(treasuryCap: &mut TreasuryCap<XSCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
    mint_and_transfer(treasuryCap, amount, recipient, ctx);
}

public fun myburn(treasuryCap: &mut TreasuryCap<XSCOIN>, coin: Coin<XSCOIN>) {
    burn(treasuryCap, coin);
}