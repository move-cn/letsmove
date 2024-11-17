
/// Module: hackquest
module hackquest::hackquest {
    use sui::coin;
    use sui::coin::TreasuryCap;
   
    public struct HACKQUEST has drop {}
    
    fun init(witness: HACKQUEST, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 9, b"HQ", b"HackQuest", b"this is hackquest coin", option::none(), ctx );        
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }      
    
    public fun mint_in_my_module(treasury_cap: &mut TreasuryCap<HACKQUEST>, amount: u64, recipient: address, ctx: &mut TxContext) {
           let coin = coin::mint(treasury_cap, amount, ctx);
           transfer::public_transfer(coin, recipient);
    }
}

