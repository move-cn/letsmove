module task2::lu_coin {
    use sui::coin::{Self,TreasuryCap};
    use sui::transfer::{public_freeze_object,public_transfer};

    public struct LU_COIN has drop{}

    fun init(witness: LU_COIN,ctx: &mut TxContext) {
        let (treasuryCap ,metadata) = coin::create_currency(witness,8,b"LU",b"Lu",b"my coin",option::none(),ctx);
        public_freeze_object(metadata);
        public_transfer(treasuryCap, ctx.sender());
    }

    public entry fun mint(cap: &mut TreasuryCap<LU_COIN>,amout : u64,recipient:address,ctx:&mut TxContext) {
        let coin = coin::mint(cap,amout,ctx);
        public_transfer(coin,recipient);
    }
    
}
