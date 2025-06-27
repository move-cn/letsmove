module blazeleon_coin::blazeleon_coin;

use sui::coin::{Self, Coin, TreasuryCap};
use sui::url::{Self, Url};

//需要具备 drop 能力，才能实现 Witness 模式。
public struct BLAZELEON_COIN has drop {}

// 当前 init 函数会在上链交易执行时被调用
fun init(blazeleonCoin: BLAZELEON_COIN, ctx: &mut TxContext) {
    // 创建一个新的 BLAZELEON_COIN
    let (mut treasuryCap, coinMetadata) = coin::create_currency<BLAZELEON_COIN>(
        blazeleonCoin,
        9,
        b"BLAZELEON_COIN",
        b"blazeleon_coin",
        b"Let's make SUI great again!",
        option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/48305889?v=4")),
        ctx
    );

    // 设定初始发行量 2100w 个 BLAZELEON_COIN
    let initialAmount = 2100 * 10000 * 1000000000;
    let initialSupply = coin::mint(&mut treasuryCap, initialAmount, ctx);

    // 将初始的发行量转移到当前交易的执行地址上
    transfer::public_transfer(initialSupply, tx_context::sender(ctx));

    // 冻结 Coin 元数据信息
    transfer::public_freeze_object(coinMetadata);

    // 转移权限给当前交易的执行地址
    transfer::public_transfer(treasuryCap, tx_context::sender(ctx));

}

// 发行更多的 BLAZELEON_COIN
public entry fun mint_more(
    treasuryCap: &mut TreasuryCap<BLAZELEON_COIN>,
    amount: u64,
    ctx: &mut TxContext
) {
    let newCoin = coin::mint(treasuryCap, amount, ctx);
    transfer::public_transfer(newCoin, tx_context::sender(ctx));
}

// 销毁 BLAZELEON_COIN
public entry fun burn(
    treasuryCap: &mut TreasuryCap<BLAZELEON_COIN>,
    coins: Coin<BLAZELEON_COIN>,
) {
    coin::burn(treasuryCap, coins);
}