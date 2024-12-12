module anlien7_faucet_coin::anlien7_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url:: Url;

    public struct ANLIEN7_FAUCET_COIN has drop {}

    fun init(witness: ANLIEN7_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<ANLIEN7_FAUCET_COIN>(witness, 9, b"ANLIEN7", b"ANLIEN7_FAUCET_COIN", b"ANLIEN7 FAUCET Coin", option::none(), ctx);
        transfer::public_freeze_object(metadata);transfer::public_share_object(treasury_cap)
    }
    public entry fun mint(treasury_cap: &mut TreasuryCap<ANLIEN7_FAUCET_COIN>,amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}