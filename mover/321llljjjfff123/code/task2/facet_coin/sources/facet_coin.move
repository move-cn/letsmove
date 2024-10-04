module faucet_coin::MY_F_COIN {
    use std::option;
    use sui::object::{UID};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::object;
    use sui::balance::{Self, Balance};

    public struct MY_F_COIN has drop {}
    public struct Wallet has key {
        id: UID,
        coin: Balance<MY_F_COIN>
    }

    fun init(witness: MY_F_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency<MY_F_COIN>(
            witness,
            6,
             b"WOOD",
              b"", 
              b"", 
              option::none(), 
              ctx
            );
        transfer::public_freeze_object(metadata); 
        transfer::public_transfer(treasury, tx_context::sender(ctx));
        let wallet = Wallet {
            id: object::new(ctx),
            coin: balance::zero()
        };
        transfer::share_object(wallet)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MY_F_COIN>, 
        wallet: &mut Wallet, amount: u64, ctx: &mut TxContext
    ) {
        let c1 = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut wallet.coin, coin::into_balance(c1));
    }

    public entry fun faucet(wallet: &mut Wallet, ctx: &mut TxContext) {
        let c2 = coin::take(&mut wallet.coin, 5000, ctx);
        transfer::public_transfer(c2, tx_context::sender(ctx));
    }
}