
/// Module: tangyuan2323_faucet_coin
module tangyuan2323_faucet_coin::tangyuan2323_faucet_coin {
    use std::option;
    use sui::coin::{Self,Coin,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Url,Self};

    struct Tangyuan2323_Faucet_Coin has drop {}

    fun init(witness: Tangyuan2323_Faucet_Coin, ctx: &mut sui::tx_context::TxContext) {
        let (treasury_cap, meta) = coin::create_currency(witness,2,b"Tangyuan2323_Faucet_Coin", b"T$n", b"", 
        option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/70282618?s=96&v=4")), ctx);

        transfer::public_freeze_object(meta);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<Tangyuan2323_Faucet_Coin>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(
        treasury_cap: &mut TreasuryCap<Tangyuan2323_Faucet_Coin>, coin : Coin<Tangyuan2323_Faucet_Coin>, _ctx: &mut TxContext
    ) {
        coin::burn(treasury_cap, coin);
    }
}

