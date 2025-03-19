/*
/// Module: mihu_coin
module mihu_coin::mihu_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module mihu_coin::mihu_coin{
    // use std::option;
    use sui::coin::{ Self, Coin, TreasuryCap };
    // use sui::tx_context::{ Self, TxContext };
    // use sui::transfer;
    // use sui::object::{ UID };
    // use std::ascii::{ Self, String };
    // use sui::url;

    public struct MIHU_COIN has drop {}

    fun init(witness: MIHU_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MIHU_COIN>(
            witness,
            9,
            b"MIHU_COIN",
            b"MIHU",
            b"mihu's coin,this is good",
            option::none(),
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx)) //
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<MIHU_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coins = coin::mint(treasury_cap, amount, ctx);
        // 完成铸币后的转账操作
        transfer::public_transfer(coins, recipient);
    }
    
    // 添加销毁代币的功能
    public entry fun burn(treasury_cap: &mut TreasuryCap<MIHU_COIN>, coin: Coin<MIHU_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}