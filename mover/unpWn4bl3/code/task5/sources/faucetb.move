module task5::faucetb{
    use std::option;
    use sui::coin::{Self,TreasuryCap,Coin};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;

    struct FAUCETB has drop {}

    fun init(witness:FAUCETB, ctx: &mut TxContext) {
        let (treasury,metadata) = coin::create_currency(witness,6,b"FAUCETB",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        mint(&mut treasury, 100000000, tx_context::sender(ctx), ctx);
        transfer::public_transfer(treasury,tx_context::sender(ctx))
    }

    public fun mint(treasury_cap:&mut TreasuryCap<FAUCETB>,amount:u64,recipient:address,ctx:&mut TxContext) {
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }

    public entry fun burn(cap:&mut TreasuryCap<FAUCETB>, c:Coin<FAUCETB>) {
        coin::burn(cap,c);
    }
}