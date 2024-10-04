/// Module: faucetcoin
module faucetcoin::faucetcoin {
    use std::option;
    use sui::object;
    use sui::transfer;
    use sui::object::{UID};
    use sui::coin::{Self, TreasuryCap};
    use sui::tx_context::{Self, TxContext};
    use sui::balance::{Self, Balance};

    struct Wallet has key {
        id: UID,
        coin: Balance<FAUCETCOIN>
    }


    struct FAUCETCOIN has drop {}

    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency<FAUCETCOIN>(witness, 6, b"FAUCETCOIN", b"C", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata); 
        transfer::public_transfer(treasury, tx_context::sender(ctx));
        transfer::share_object(Wallet {
            id: object::new(ctx),
            coin: balance::zero()
        })
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCETCOIN>, wallet: &mut Wallet, amount: u64, ctx: &mut TxContext
    ) {
        let c1 = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut wallet.coin, coin::into_balance(c1));
    }

    public entry fun faucet(wallet: &mut Wallet, ctx: &mut TxContext) {
        let c2 = coin::take(&mut wallet.coin, 200, ctx);
        transfer::public_transfer(c2, tx_context::sender(ctx));
    }
}
