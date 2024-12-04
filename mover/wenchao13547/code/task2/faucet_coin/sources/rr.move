/*
/// Module: uu
module my_coin::my_coin;
*/
module faucet_coin::rr {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    /// Struct: Coin
    public struct RR has drop {}


    fun init(rr: RR, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<RR>(
            rr,
            0,
            b"RR",
            b"RR",
            b"this id my faucet coin",
            option::none(),
            ctx
        );
        // 共享但不可修改
        transfer::public_freeze_object(metadata);
        // 共享所有权，每人人都可铸币
        transfer::public_share_object(treasury_cap)
    }


    // `mint` 函数是一个公开的入口函数，用于增加特定数量的货币到区块链的流通中。
    // 这个函数接受四个参数：
    // - `treasury_cap`: 一个指向 `TreasuryCap<UU>` 类型的可变引用，用于控制货币的铸造上限。
    // - `amount`: 一个 `u64` 类型的无符号整数，表示要铸造的货币数量。
    // - `recipient`: 一个 `address` 类型的值，表示接收新铸造货币的地址。
    // - `ctx`: 一个指向 `TxContext` 类型的可变引用，包含了当前交易的上下文信息。
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<RR>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        // 调用 `coin` 模块中的 `mint_and_transfer` 函数，将新铸造的货币转移到指定的接收者地址。
        // 这个函数会处理货币的铸造和转账逻辑，确保不超过 `treasury_cap` 指定的铸造上限。
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    // `burn` 函数是一个公开的入口函数，用于从区块链的流通中移除特定数量的货币。
    // 这个函数接受两个参数：
    // - `treasury_cap`: 一个指向 `TreasuryCap<UU>` 类型的可变引用，用于控制货币的销毁上限。
    // - `coin`: 一个 `Coin<UU>` 类型的值，表示要销毁的货币。
    public entry fun burn(
        treasury_cap: &mut TreasuryCap<RR>,
        coin: Coin<RR>
    ) {
        // 调用 `coin` 模块中的 `burn` 函数，销毁指定的货币。
        // 这个函数会处理货币的销毁逻辑，确保操作符合 `treasury_cap` 指定的销毁上限。
        coin::burn(treasury_cap, coin);
    }
}
