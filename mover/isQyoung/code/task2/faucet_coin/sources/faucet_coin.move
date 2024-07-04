/// Module: faucet_coin
module faucet_coin::faucet_coin {
    use sui::coin::{Self, TreasuryCap};

    public struct FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"Q_FC", b"Q_FC", b"Move coin by isQyoung", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);

    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>, 
        amount: u64, 
        recipient: address, 
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

}
