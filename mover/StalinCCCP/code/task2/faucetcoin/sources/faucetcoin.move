/// Module: faucetcoin
module faucetcoin::stalincccp_faucet {
    use sui::balance::{Balance};
    use sui::balance;
    use sui::coin::{Self, TreasuryCap};
    use std::string;
    use std::string::String;
    public struct STALINCCCP_FAUCET has drop{}
    public struct PublicWallet has key{
        id:UID,
        coin: Balance<STALINCCCP_FAUCET>,
        amount:u64,
    }
    const AMOUNT: u64=10;
    const EFaucetDry:u64=1;
    fun init(witness:STALINCCCP_FAUCET,ctx:&mut TxContext){
        let (tr,md)=coin::create_currency<STALINCCCP_FAUCET>(
            witness,
            1,
            b"STALINCCCP faucet",
            b"STALINCCCP faucet",
            b"test coin used for faucet service",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(md);
        transfer::public_transfer(tr,tx_context::sender(ctx));
        transfer::share_object(PublicWallet{
            id:object::new(ctx),
            coin:balance::zero(),
            amount:AMOUNT,
        })
    }
    public entry fun mint(
        tr:&mut TreasuryCap<STALINCCCP_FAUCET>,
        amount:u64,
        wallet:&mut PublicWallet,
        ctx:&mut TxContext
    ){
        balance::join(&mut wallet.coin,coin::into_balance(
            coin::mint(tr,amount,ctx)
        ));
    }
    public entry fun faucet(
        wallet:&mut PublicWallet,
        ctx:&mut TxContext
    ){
        assert!(balance::value(&wallet.coin)>=wallet.amount,EFaucetDry);
        transfer::public_transfer(
            coin::from_balance(
                balance::split(&mut wallet.coin,wallet.amount),ctx
            ),
            tx_context::sender(ctx)
        )  
    }
}
