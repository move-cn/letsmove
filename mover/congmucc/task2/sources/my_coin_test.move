module task2::my_coin_test {
    use sui::tx_context::{Self, TxContext, sender};
    use sui::coin;
    use sui::transfer::{public_transfer, public_freeze_object};
    use sui::url::Url;

    public struct MY_COIN_TEST has drop {}

    fun init(witness: MY_COIN_TEST, ctx: &mut TxContext) {

        let icon_url = option::none<Url>();

        let  (treasury_cap,coin_meta_data) =  coin::create_currency(witness, 6,b"NSHARE",b"NSHARE",b"this is a Not NSHARE coin",icon_url, ctx);

        // 所有权共享  不可变共享
        public_freeze_object(coin_meta_data);

        // 独享 控制管理权限
        public_transfer(treasury_cap, sender(ctx));
    }

}