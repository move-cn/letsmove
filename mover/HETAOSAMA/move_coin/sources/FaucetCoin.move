module move_coin::faucet_coin {
    use sui::coin::{Self,TreasuryCap};
    use sui::event::emit;

    public struct FAUCET_COIN has drop {}
    
    public struct MintEvent has copy, drop{
        amount: u64,
        recipient: address
    }

    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency<FAUCET_COIN>(witness, 2, b"FAUCET_COIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);

        emit(MintEvent{
            amount,
            recipient
        })
    }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_faucet_init(ctx: &mut TxContext) {
        init(FAUCET_COIN {}, ctx)
    }
}