
/// Module: xdd_object_faucet
module xdd_object_faucet::xdd_object_faucet{
    use std::option::none;
    use sui::coin;
    use sui::coin::{create_currency, TreasuryCap};
    use sui::transfer::{public_transfer, public_freeze_object, public_share_object};
    use sui::tx_context::TxContext;
    use sui::url::Url;

    public struct XDD_OBJECT_FAUCET has drop {

    }


    fun init(xddObject: XDD_OBJECT_FAUCET, ctx: &mut TxContext) {
        //创建代币
        let (treasuryCap, coinMetadata) = create_currency(
            xddObject,
            9,
            b"XDD_OBJECT_FAUCET",
            b"XDD_OBJECT_FAUCET",
            b"XDD_OBJECT_FAUCET",
            none<Url>(),
            ctx);

        //冻结货币元数据
        public_freeze_object(coinMetadata);

        //将铸币权限给所有人
        public_share_object(treasuryCap);
    }

    //铸币方法
    public entry fun mint_xdd_object_faucet(cap: &mut TreasuryCap<XDD_OBJECT_FAUCET>, value: u64, recipient: address, ctx: &mut TxContext) {
        //铸币
        let xddCoin = coin::mint(cap, value, ctx);
        //将代币转给某人， 也可以给指定地址
        public_transfer(xddCoin, recipient);
    }

}