module xdd_object::xdd_object {
    use std::option::none;
    use sui::coin;
    use sui::coin::{create_currency, TreasuryCap};
    use sui::transfer::{public_transfer, public_freeze_object};
    use sui::tx_context::TxContext;
    use sui::url::Url;

    public struct XDD_OBJECT has drop {

    }


    fun init(xddObject: XDD_OBJECT, ctx: &mut TxContext) {
        //创建代币
        let (treasuryCap, coinMetadata) = create_currency(
            xddObject,
        9,
        b"XDD_OBJECT",
            b"XDD_OBJECT",
        b"",
            none<Url>(),
        ctx);

        //冻结货币元数据
        public_freeze_object(coinMetadata);

        //将铸币权限给创建人
        public_transfer(treasuryCap, ctx.sender());
    }

    //铸币方法
    public entry fun mint_xdd_object(cap: &mut TreasuryCap<XDD_OBJECT>, value: u64, ctx: &mut TxContext) {
        //铸币
        let xddCoin = coin::mint(cap, value, ctx);
        //将代币转给某人， 也可以给指定地址
        public_transfer(xddCoin, ctx.sender());
    }



}
