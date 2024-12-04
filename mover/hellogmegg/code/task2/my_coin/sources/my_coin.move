/// Module: my_coin
module my_coin::tmm_coin {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct TMM_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: TMM_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"TMM_COIN", b"TMM_COIN", b"my coin is TMM_COIN", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    // mint coin
    public fun mint(
        treasury_cap: &mut TreasuryCap<TMM_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

}
