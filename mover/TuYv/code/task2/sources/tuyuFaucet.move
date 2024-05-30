/// Module: task2
module tuyuFaucet::tuyv_faucet {
    use sui::coin::{Self,Coin,TreasuryCap};
    use std::option::{none};

    public struct TUYV_FAUCET has drop{}

    #[allow(lint(share_owned))]
    fun init(witness: TUYV_FAUCET, ctx: &mut TxContext ) {
        let(treasuryCap, coinMetadata) = coin::create_currency<TUYV_FAUCET>(
            witness,
            2,
            b"TYF",
            b"TuYv Faucet",
            b"god bless you",
            none(),
            ctx
        );
        //freeze_object是不可变的共享对象,这样币的元信息就是可见但不可变的了
        transfer::public_freeze_object(coinMetadata);
        transfer::public_share_object(treasuryCap);
    }

    /**
    * 传入代币的treasuryCap,mint的金额, 接收的地址
    */
    public fun mint(treasury_cap: &mut TreasuryCap<TUYV_FAUCET>,
                    amount: u64,
                    recipient: address,
                    ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public fun burn(treasury_cap: &mut TreasuryCap<TUYV_FAUCET>, coin: Coin<TUYV_FAUCET>) {
        coin::burn(treasury_cap, coin);
    }
}
