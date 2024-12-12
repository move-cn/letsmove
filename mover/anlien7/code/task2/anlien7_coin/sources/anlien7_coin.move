module anlien7_coin::anlien7_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url:: Url;

    public struct ANLIEN7_COIN has drop {}

    fun init(witness: ANLIEN7_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<ANLIEN7_COIN>(witness, 9, b"ANLIEN7", b"ANLIEN7_COIN", b"ANLIEN7 Coin", option::none(), ctx);
        transfer::public_freeze_object(metadata);transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(treasury_cap: &mut TreasuryCap<ANLIEN7_COIN>,amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}