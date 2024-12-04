/// Module: move_coin
// rmb is my coin
module move_coin::rmb {
    use sui::coin::{Self, TreasuryCap};

    public struct RMB has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: RMB, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"RMB", b"Sui RMB", b"my coin is RMB", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        // exclusive
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    // mint coin
    public fun mint(
        treasury_cap: &mut TreasuryCap<RMB>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}

// usd is faucet coin
module move_coin::usd {
    use sui::coin::{Self, TreasuryCap};

    public struct USD has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: USD, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"USD", b"Sui USD", b"USD is faucet coin", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        // share
        transfer::public_share_object(treasury);
    }

    // mint coin
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<USD>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }
}
