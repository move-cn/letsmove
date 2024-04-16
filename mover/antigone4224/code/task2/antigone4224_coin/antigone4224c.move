module antigone4224_coin::antigone4224c {
    use std::option;
    use sui::coin::{Self,Coin,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};


    public struct ANTIGONE4224C has drop {}

    fun init(witness: ANTIGONE4224C,ctx: &mut TxContext) {
        let (treasury,metadata) = coin::create_currency(witness,6,b"ANTIGONE4224C",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public fun mint(
    treasury_cap: &mut TreasuryCap<ANTIGONE4224C>, 
    amount: u64, 
    recipient: address, 
    ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

}