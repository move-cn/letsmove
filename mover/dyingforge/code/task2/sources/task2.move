module task2::my_token{  
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
   
    public struct MY_TOKEN has drop {}
    
    fun init(witness: MY_TOKEN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"OVZ", b"dyingforge Coin", b"My_token", option::none(), ctx );        
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }      
    
    public entry fun mint_in_my_module(treasury_cap: &mut TreasuryCap<MY_TOKEN>, amount: u64, recipient: address, ctx: &mut TxContext) {
           let coin = coin::mint(treasury_cap, amount, ctx);
           transfer::public_transfer(coin, recipient);
    }
}