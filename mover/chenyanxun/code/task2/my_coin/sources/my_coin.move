
/// Module: my_coin
module my_coin::my_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    
    public struct MY_COIN has drop{}

    fun init (witness:MY_COIN,ctx: &mut TxContext) {
        let (treasury,metadata) = coin::create_currency(
            witness,
            6,
            b"my_coin",
            b"My Coin",
            b"this is my coin",
            option::none(),
            ctx
        );
        transfer::public_transfer(treasury,tx_context::sender(ctx));
        transfer::public_freeze_object(metadata);

    }
    public fun mint(treasury_cap:&mut coin::TreasuryCap<MY_COIN>,amount: u64,recipient: address,ctx:&mut TxContext) {
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx);
    }
}

