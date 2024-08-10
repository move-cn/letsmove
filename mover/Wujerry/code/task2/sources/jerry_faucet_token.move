/// Module: task2
module task2::jerry_faucet_token {

	use sui::coin::{Self, TreasuryCap};

    public struct JERRY_FAUCET_TOKEN has drop {}
    
    #[allow(lint(share_owned))]
    fun init(witness: JERRY_FAUCET_TOKEN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"JERT", b"JerryWuFaucet", b"custom token faucet", option::none(), ctx );        
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }     

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<JERRY_FAUCET_TOKEN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}

