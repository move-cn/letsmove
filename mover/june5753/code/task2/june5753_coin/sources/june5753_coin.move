/// Module: task2
module task2::june5753_coin {
    // 依赖
    use sui::tx_context::{sender};
    use sui::coin::{Self,TreasuryCap,Coin};
    // 结构体
    public struct JUNE5753_COIN has drop {}

    // 初始化
    fun init(witness: JUNE5753_COIN, ctx:&mut TxContext){
        let (treasury_cap,metadata) = coin::create_currency(
            witness,
            9,
            b"BR", //代币的名称
            b"june5753Coin",
            b"June5753 Coin is so cool",
            option::none(),ctx);

        //freeze the metadata to share immutabale objects
        transfer::public_freeze_object(metadata);
        // public transfer, everyone can transfer the coin
        transfer::public_transfer(treasury_cap, sender(ctx));
    }

    // 铸造
    public entry fun mint(treasury_cap: &mut TreasuryCap<JUNE5753_COIN>,
                          amount: u64, recipient: address, ctx: &mut TxContext){
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<JUNE5753_COIN>, coin: Coin<JUNE5753_COIN>){
        coin::burn(treasury_cap,coin);
    }
}

