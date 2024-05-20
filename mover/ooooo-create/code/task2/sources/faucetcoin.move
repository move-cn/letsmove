module hello_coins::faucetcoin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct FAUCETCOIN has drop {}

    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            6, //精度
            b"FAUCETCOIN", // 代币符号
            b"", // 名称
            b"", // 描述
            option::none(), // 图标文件的网址
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<FAUCETCOIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ){
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient)
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<FAUCETCOIN>,
        coin: Coin<FAUCETCOIN>,
    ){
        coin::burn(treasury_cap,coin);
    }
}
