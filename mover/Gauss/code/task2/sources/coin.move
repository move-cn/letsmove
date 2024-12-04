
module task2::SHALLWEKISSFOREVERCOIN {

    use sui::coin::{Self, TreasuryCap};

    public struct SHALLWEKISSFOREVERCOIN has drop {}

    fun init(witness: SHALLWEKISSFOREVERCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                
            b"SWKFC",           
            b"ShallWeKissForeve Coin",       
            b"SUI Move task 2 coin", 
            option::none(),   
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, ctx.sender());

    }

    entry public fun mint(
        treasuryCap: &mut TreasuryCap<SHALLWEKISSFOREVERCOIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasuryCap, amount, recipient, ctx);
    }


}

