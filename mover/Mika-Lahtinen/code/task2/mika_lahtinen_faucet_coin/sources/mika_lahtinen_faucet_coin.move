/*
/// Module: faucet_coin
module faucet_coin::faucet_coin {

}
*/
module mika_lahtinen_faucet_coin::mika_lahtinen_faucet_coin {
    use sui::transfer;
    use std::option;
    use sui::object::UID;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, TreasuryCap, Coin};
    use sui::tx_context::{Self, TxContext};

    public struct MIKA_LAHTINEN_FAUCET_COIN has drop {}
    public struct Wallet has key, store {
        id: UID,
        balance: Balance<MIKA_LAHTINEN_FAUCET_COIN>
    }

    fun init(witness: MIKA_LAHTINEN_FAUCET_COIN, ctx:&mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            6,
            b"MLF",
            b"MikaLahtinenFaucet",
            b"Faucet from Mika-Lahtinen",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));

        let wallet = Wallet {
            id: object::new(ctx),
            balance: balance::zero()
        };

        transfer::public_share_object(wallet);
    }

    public entry fun mint(
        treasury_cap:&mut TreasuryCap<MIKA_LAHTINEN_FAUCET_COIN>, 
        amount:u64, 
        wallet: &mut Wallet, 
        ctx:&mut TxContext
        ) {
        let total_coin = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut wallet.balance, coin::into_balance(total_coin));
    }

    // Code that actually works when using the faucet.
    public entry fun flow(wallet: &mut Wallet, ctx:&mut TxContext){
        let stream_coin = coin::take(&mut wallet.balance, 500000, ctx);
        transfer::public_transfer(stream_coin,tx_context::sender(ctx));
    }
}