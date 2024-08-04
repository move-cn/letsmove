
module task2::faucet_coin{
    use sui::coin::{TreasuryCap, Self};
    use sui::transfer::{ public_share_object, public_freeze_object, share_object};
   // OTW
    public struct FAUCET_COIN has drop{}
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext){
        let (treasuryCap, metadata) = coin::create_currency(
            witness,
            8,
            b"DRACULABO_FAUCET_COIN",
            b"draculabo faucet coin",
            b"shared faucet coin",
            option::none(),
            ctx
        );
        // 共享 treasuryCap
        public_share_object(treasuryCap);
        public_freeze_object(metadata);
    }

    public entry fun mint(cap: &mut TreasuryCap<FAUCET_COIN>, value: u64, recipient: address,  ctx: &mut TxContext){
        coin::mint_and_transfer(cap, value, recipient, ctx);
    }
}
