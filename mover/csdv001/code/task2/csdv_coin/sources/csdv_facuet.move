/// Module: facuet
module csdv_coin::facuet_coin {
    use sui::coin;

    public struct FACUET_COIN has drop {}

    fun init(witness: FACUET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness,
            6,                    // decimals
            b"FACUETCOIN",        // symbol
            b"FACUET COIN",       // name
            b"FACUET COIN TEST",  // description
            option::none(),       // icon url
            ctx
        );
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        transfer::public_freeze_object(coin_metadata);
    }

    public entry fun mint(treasury: &mut coin::TreasuryCap<FACUET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }

    public entry fun burn(treasury: &mut coin::TreasuryCap<FACUET_COIN>, coin: coin::Coin<FACUET_COIN>) {
        coin::burn(treasury, coin);
    }
}