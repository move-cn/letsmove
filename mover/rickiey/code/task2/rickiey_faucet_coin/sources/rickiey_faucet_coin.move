
module rickiey_faucet_coin::rickiey_faucet_coin {
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::transfer::{ public_share_object, public_freeze_object};

    public struct RICKIEY_FAUCET_COIN has drop{}
    fun init(witness: RICKIEY_FAUCET_COIN, ctx: &mut TxContext){
        let (treasury, metadata) = coin::create_currency(
            witness,
            8,
            b"RICKIEY_PUBLIC",
            b"rickiey Faucet coin",
            b"test faucet coin",
            option::none(),
            ctx
        );
        public_share_object(treasury);
        public_freeze_object(metadata);
    }

    public entry fun mint(cap: &mut TreasuryCap<RICKIEY_FAUCET_COIN>, value: u64,  ctx: &mut TxContext){
        coin::mint_and_transfer(cap, value, tx_context::sender(ctx), ctx);
    }
}

