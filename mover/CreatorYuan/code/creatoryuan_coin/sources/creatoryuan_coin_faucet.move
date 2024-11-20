/// Module: creatoryuan_coin
module creatoryuan_coin::creatoryuan_coin_faucet {

    use sui::coin::{create_currency};
    use sui::transfer::{public_freeze_object, public_share_object};

    public struct CREATORYUAN_COIN_FAUCET has drop{}

    fun init(witness: CREATORYUAN_COIN_FAUCET, ctx: &mut TxContext){
        let (treasury, metadata) = create_currency(
            witness,
            6,
            b"CYCF",
            b"CreatorYuan Faucet Coin",
            b"this is CreatorYuan Faucet Coin.",
            option::none(),
            ctx);

        public_freeze_object(metadata);
        public_share_object(treasury)
    }

}
