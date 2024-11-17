module task2::jianhawang_faucet_coin {
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::transfer::{ public_share_object, public_freeze_object};

    public struct JIANHAWANG_FAUCET_COIN has drop{}
    fun init(witness: JIANHAWANG_FAUCET_COIN, ctx: &mut TxContext){
        let (treasury, metadata) = coin::create_currency(
            witness,
            8,
            b"JIANHAWANG_PUBLIC",
            b"jianhawang Faucet coin",
            b"test faucet coin",
            option::none(),
            ctx
        );
        public_share_object(treasury);
        public_freeze_object(metadata);
    }

    public entry fun mint(cap: &mut TreasuryCap<JIANHAWANG_FAUCET_COIN>, value: u64, recipient: address,  ctx: &mut TxContext){
        coin::mint_and_transfer(cap, value, recipient, ctx);
    }
}