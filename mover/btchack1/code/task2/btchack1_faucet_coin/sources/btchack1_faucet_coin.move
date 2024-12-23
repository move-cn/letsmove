module btchack1_faucet_coin::btchack1_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url:: Url;

    public struct BTCHACK1_FAUCET_COIN has drop {}

    fun init(witness: BTCHACK1_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<BTCHACK1_FAUCET_COIN>(witness, 9, b"ANLIEN7", b"BTCHACK1_FAUCET_COIN", b"BTCHACK1 FAUCET COIN  ", option::none(), ctx);
        transfer::public_freeze_object(metadata);transfer::public_share_object(treasury_cap)
    }
    public entry fun mint(treasury_cap: &mut TreasuryCap<BTCHACK1_FAUCET_COIN>,amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}