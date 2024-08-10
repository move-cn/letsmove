/// Module: task2
module task2::jerry_token {

	use sui::coin::{Self, TreasuryCap};

    public struct JERRY_TOKEN has drop {}
    
    fun init(witness: JERRY_TOKEN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"JERT", b"JerryWu", b"custom token", option::none(), ctx );        
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }     

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<JERRY_TOKEN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}

