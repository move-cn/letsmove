/*
/// Module: my_coin
module my_coin::my_coin {

}
*/
module my_coin::my_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext){
        let (treasury, metadata) = coin::create_currency(witness, 0, b"My", b"My_Coin", b"This is Mycoin" , option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public fun Mint_My_Coin(treasury_cap: &mut TreasuryCap<MY_COIN>, amount: u64, recipient: address, ctx: &mut TxContext){
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin,recipient);
    }

}