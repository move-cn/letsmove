module task2::FCOIN {
    use std::option;
    use sui::coin::{Self, TreasuryCap};
    use sui::tx_context::{Self, TxContext, sender};
    use sui::balance::{Self, Balance};


    public struct FCOIN has drop {}

    public struct Wallet has key {
        id: UID,
        coin: Balance<FCOIN>,
    }

    fun init(witness: FCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6, 
            b"FCOIN", 
            b"FC", 
            b"faucet coin for test", 
            option::none(), 
            ctx
        );
        // freeze the currency
        transfer::public_freeze_object(metadata);
        // transfer the treasury to the sender
        transfer::public_transfer(treasury, tx_context::sender(ctx));
        let wallet = Wallet{
            id: object::new(ctx),
            coin:balance::zero()
        };
        transfer::share_object(wallet);
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<FCOIN>,wallet: &mut Wallet, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, 1000000, ctx);
        balance::join(&mut wallet.coin,coin::into_balance(coin));
    }


    public entry fun faucet(wallet: &mut Wallet, amount: u64, ctx: &mut TxContext) {
        let coin = coin::take(&mut wallet.coin, amount, ctx);
        transfer::public_transfer(coin, sender(ctx));
    }
    
}
