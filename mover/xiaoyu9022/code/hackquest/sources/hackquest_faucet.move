
/// Module: hackquest_faucet
module hackquest::hackquest_faucet {
    use sui::coin;
    use sui::coin::TreasuryCap;
   
    public struct HACKQUEST_FAUCET has drop {}
    
    fun init(witness: HACKQUEST_FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 9, b"HQF", b"HackQuestFaucet", b"this is hackquest faucet coin", option::none(), ctx );        
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }      
    
    public fun mint_in_my_module(treasury_cap: &mut TreasuryCap<HACKQUEST_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) {
           let coin = coin::mint(treasury_cap, amount, ctx);
           transfer::public_transfer(coin, recipient);
    }
}

