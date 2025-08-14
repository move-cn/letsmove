/// Module: move_coin
module move_coin::move_coin {
    use sui::coin::{Self, TreasuryCap};

    // 结构体的名字要和报名一致
    public struct MOVE_COIN has drop {}
    
    fun init(witness: MOVE_COIN, ctx: &mut TxContext){
        let (treasury_cap, metadata) = coin::create_currency<MOVE_COIN>(witness, 2, b"MyCoin", b"MYC", b"", option::none(), ctx);
        transfer::public_transfer(metadata, tx_context::sender(ctx));
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<MOVE_COIN>, _amount: u64, ctx: &mut TxContext){
        coin::mint_and_transfer(treasury_cap, _amount, tx_context::sender(ctx), ctx);
    }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(MOVE_COIN {}, ctx)
    }
}

