module task2::jiangjinmou_coin {
    use sui::coin;
    use sui::coin::{TreasuryCap};
    use sui::transfer::{public_transfer, public_freeze_object};

    public struct JIANGJINMOU_COIN has drop{}
    fun init(witness: JIANGJINMOU_COIN, ctx: &mut TxContext){
        let (treasuryCap, metadata) = coin::create_currency(
            witness,
            8,
            b"JIANGJINMOU",
            b"JIANGJINMOU Coin",
            b"move coin",
            option::none(),
            ctx
        );
        public_transfer(treasuryCap, tx_context::sender(ctx));
        public_freeze_object(metadata);
    }

    public entry fun mint(cap: &mut TreasuryCap<JIANGJINMOU_COIN>, amount: u64, recipient: address, ctx: &mut TxContext){
        let coin = coin::mint(cap, amount, ctx);
        public_transfer(coin, recipient);
    }
}