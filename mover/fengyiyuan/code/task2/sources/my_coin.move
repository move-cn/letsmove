/// Module: task2
module task2::my_coin {


    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Url,Self};


    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MY_COIN>(witness, 2, b"Feng Yi Yuan", b"FYY", b"", 
        option::some<Url>(url::new_unsafe_from_bytes(b"https://fyy-hk.oss-cn-hongkong.aliyuncs.com/coin-icon/fyy.jpg")), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }


    public fun mint(
            treasury_cap: &mut TreasuryCap<MY_COIN>, 
            amount: u64, 
            recipient: address, 
            ctx: &mut TxContext,
        ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

    public fun burn(treasury_cap: &mut TreasuryCap<MY_COIN>, coin: Coin<MY_COIN>) {
        coin::burn(treasury_cap, coin);
    }


}
