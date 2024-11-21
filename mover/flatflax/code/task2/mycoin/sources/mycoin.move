/// Module: task2
module mycoin::my_coin {


    use sui::coin::{Self, Coin, TreasuryCap};


    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MY_COIN>(witness, 2, b"my flatflax coin", b"my flatflax coin", b"", 
            option::none(), ctx);
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
