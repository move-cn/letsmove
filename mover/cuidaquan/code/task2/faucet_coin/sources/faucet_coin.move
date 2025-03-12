module faucet_coin::faucet_coin{
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct FAUCET_COIN has drop {}

    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"CUIDAQUANFAUCET", b"cuidaquanFaucet", b"faucet_coin", option::none(), ctx );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public fun mint(treasury_cap: &mut TreasuryCap<FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, ctx.sender(), ctx);
    }

}