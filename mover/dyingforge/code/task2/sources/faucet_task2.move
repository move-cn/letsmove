module task2::my_token_faucet{  
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
   
    public struct MY_TOKEN_FAUCET has drop {}
    
    fun init(witness: MY_TOKEN_FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"OVO", b"dyingforgefaucet Coin", b"My_faucet_Coin", option::none(), ctx );        
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }      
    
    public entry fun mint_in_my_module(treasury_cap: &mut TreasuryCap<MY_TOKEN_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) {
           let coin = coin::mint(treasury_cap, amount, ctx);
           transfer::public_transfer(coin, recipient);
    }
}