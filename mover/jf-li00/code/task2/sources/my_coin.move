/// Module: my_coin
module my_coin::my_coin {
    use sui::coin::{Self,TreasuryCap};

    public struct MY_COIN has drop{
    }

    
    fun init(otw:MY_COIN, ctx: &mut sui::tx_context::TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(

            otw,
            8,
            b"MC",
            b"MyCoin",
            b"My Coin",
            option::none(),
            ctx
        );

        // transfer the `TreasuryCap` to the sender, so they can mint and burn
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));

        // metadata is typically frozen after creation
        transfer::public_freeze_object(metadata);
    }

    public entry fun mint_for(
        treasury_cap: &mut TreasuryCap<MY_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    
}
