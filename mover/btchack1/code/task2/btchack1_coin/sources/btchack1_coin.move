module btchack1_coin::btchack1_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url:: Url;

    public struct BTCHACK1_COIN has drop {}

    fun init(witness: BTCHACK1_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<BTCHACK1_COIN>(witness, 9, b"BTCHACK1", b"BTCHACK1_COIN", b"BTCHACK1 Coin", option::none(), ctx);
        transfer::public_freeze_object(metadata);transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }
    public entry fun mint(treasury_cap: &mut TreasuryCap<BTCHACK1_COIN>,amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}