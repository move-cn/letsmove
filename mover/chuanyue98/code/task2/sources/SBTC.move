module task2::SBTC {
    use sui::coin::{Self,Coin,TreasuryCap};
    use std::option::{Self,some};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use sui::url;
    use std::string;

    struct SBTC has drop {}

    fun init(witness: SBTC, ctx: &mut TxContext) {
        let _url = string::to_ascii(string::utf8(b"https://pixabay.com/zh/vectors/bitcoin-logo-digital-money-910307"));
        let (treasury, metadata) = coin::create_currency(witness, 6, b"SBTC", b"SBTC", b"", some(url::new_unsafe(_url)), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

     public entry fun mint(treasury_cap: &mut TreasuryCap<SBTC>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<SBTC>, coin : Coin<SBTC>, _ctx: &mut TxContext) {
        coin::burn(treasury_cap, coin);
    }
}
