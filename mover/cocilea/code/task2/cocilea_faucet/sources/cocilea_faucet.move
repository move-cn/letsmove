module cocilea_faucet::cocilea_faucet {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct COCILEA_FAUCET has drop {}

    fun init(witness: COCILEA_FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"COCILEA FAUCET", b"COCILEA FAUCET", b"COCILEA FAUCET", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
    }

    public fun mint(treasury_cap: &mut TreasuryCap<COCILEA_FAUCET>, 
                    amount: u64, 
                    recipient: address, 
                    ctx: &mut TxContext,) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}
