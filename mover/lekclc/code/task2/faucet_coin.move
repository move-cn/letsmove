module my_coin::faucet_coin{
    use std::option;
    use sui::coin::{Self,TreasuryCap,Coin};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Url,Self};
    
    struct FAUCET_COIN has drop{}

    fun init(witness: FAUCET_COIN,ctx: &mut TxContext){
        let (treasury_cap,metadata) = coin::create_currency(witness,1,b"FAUCET_COIN",b"FAUCET_COIN",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }
    public entry fun mint(treasury_cap: &mut TreasuryCap<FAUCET_COIN>,amount: u64,recipient: address,ctx: &mut TxContext){
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx);
    }
}