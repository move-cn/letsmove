/// Module: facuet
module csdv_coin::facuetcoin {
    use sui::coin;

    public struct FACUETCOIN has drop {}

    fun init(witness: FACUETCOIN, ctx: &mut TxContext) {
        let (treasury_cap, coin_metadata) = coin::create_currency(
            witness,
            6,                    // decimals
            b"FACUET",            // symbol
            b"FACUET COIN",       // name
            b"FACUET COIN TEST",  // description
            option::none(),       // icon url
            ctx
        );
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        transfer::public_freeze_object(coin_metadata);
    }

    public entry fun faucet(treasury: &mut coin::TreasuryCap<FACUETCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }
}