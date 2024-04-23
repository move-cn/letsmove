/// Module: capy_coin
module capy_coin::capy_coin {
    use sui::coin::{Self,Coin,TreasuryCap};
    public struct CAPY_COIN has drop {}
    fun init(witness: CAPY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            8,                // decimals
            b"CAPY COIN",           // symbol
            b"CAPY COIN",       // name
            b"CAPYBARA Coin", // description
            option:: none(),   // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<CAPY_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<CAPY_COIN>, coin: Coin<CAPY_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}

