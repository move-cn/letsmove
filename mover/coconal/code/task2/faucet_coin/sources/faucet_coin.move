module faucet_coin::faucet {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::tx_context::{Self, TxContext};

  
    public struct FAUCET has drop {}

   
    fun init(witness: FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 9, b"FAUCET", b"faucetmycoin", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
    }

     public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }


}