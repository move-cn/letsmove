module task2::lu_faucet_coin {
    use sui::coin::{Self,TreasuryCap};
    use sui::transfer::{public_freeze_object,public_transfer, public_share_object};

    public struct LU_FAUCET_COIN has drop{}

    fun init(witness: LU_FAUCET_COIN,ctx: &mut TxContext) {
        let (treasuryCap ,metadata) = coin::create_currency(witness,8,b"LU_FAUCET",b"LU_FAUCET",b"my faucet coin",option::none(),ctx);
        public_freeze_object(metadata);
        public_share_object(treasuryCap);
    }

    public entry fun mint(cap: &mut TreasuryCap<LU_FAUCET_COIN>,amout : u64,recipient:address,ctx:&mut TxContext) {
        let coin = coin::mint(cap,amout,ctx);
        public_transfer(coin,recipient);
    }
}
