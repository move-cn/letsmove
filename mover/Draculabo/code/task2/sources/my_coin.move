module task2::my_coin{
    use sui::coin::{TreasuryCap, Self};
    use sui::transfer::{public_transfer, public_freeze_object};
    // OTW
    public struct MY_COIN has drop{}
    fun init(witness: MY_COIN, ctx: &mut TxContext){
        let (treasuryCap, denyCap ,metadata) = coin::create_regulated_currency(
            witness,
            8,
            b"DRACULABO_COIN",
            b"draculabo coin",
            b"move coin",
            option::none(),
            ctx
        );
        // 将铸币、销币的能力赋予币的创建者
        public_transfer(treasuryCap, tx_context::sender(ctx));
        // 将管理权限的能力赋予币的创建者
        public_transfer(denyCap, tx_context::sender(ctx));
        public_freeze_object(metadata);
    }

    public entry fun mint(cap: &mut TreasuryCap<MY_COIN>, amount: u64, recipient: address, ctx: &mut TxContext){
        let coin = coin::mint(cap, amount, ctx);
        public_transfer(coin, recipient);
    }
}
