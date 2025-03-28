module testfaucet::testfaucet;
use std::option;
use sui::coin;
use sui::coin::Coin;
use sui::transfer;
use sui::url;
 
// 一次性见证结构体，one-time-witness，要有drop能力
public struct TESTFAUCET has drop {}
 
// 初始化init函数
// witness：一次性证明，用于验证代币的唯一性和创造者的权限。
// ctx：交易上下文，用于处理交易中的各种状态和信息。
fun init(otw: TESTFAUCET, ctx: &mut TxContext) {
    // 使用 coin 模块的 create_currency 函数来创建代币
    // treasuryCap：权限凭证，持有此凭证者有权铸造代币，coinMetadata：代币的元数据，如名称、符号、描述等信息。
    let (treasuryCap, coinMetadata) = coin::create_currency(
        otw, // 一次性证明，用于确认铸币操作的合法性
        6, // 代币的小数位数
        b"public coin", // 代币的符号
        b"public coin", // 代币的名称
        b"this is a public coin", // 代币的信息描述
        option::some(url::new_unsafe_from_bytes(b"https://himg.bdimg.com/sys/portraitn/item/public.1.e9f8c73.BSHSEfneCaeAXqEhmsNv0A")), // 代币的图标
        ctx // 交易上下文对象
    );
    // 冻结代币元数据，阻止后续的修改，把对象变成不可变对象
    transfer::public_freeze_object(coinMetadata);
    // treasury 是一个特殊的对象，它控制着代币的铸造权限。只有拥有 TreasuryCap 的实体才能铸造新的代币
    // 共享铸币权
    transfer::public_share_object(treasuryCap);
}
 
// 铸造代币函数，需要参数：铸币权限、铸币数量、接收代币地址、交易上下文
public entry fun mint(treasuryCap: &mut coin::TreasuryCap<TESTFAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) {
    // 方法一：使用coin::mint()函数铸币，使用transfer::public_transfer()方法转移代币
    let coin = coin::mint(treasuryCap, amount, ctx);
    transfer::public_transfer(coin, recipient);
    // 方法二：使用coin::mint_and_transfer()完成铸币和转移
    // coin::mint_and_transfer(treasuryCap, amount, recipient, ctx)
}
// 销毁代币，使用coin::burn()方法
public entry fun burn(treasuryCap: &mut coin::TreasuryCap<TESTFAUCET>, coin: Coin<TESTFAUCET>) {
    coin::burn(treasuryCap, coin);
}