
/// Module: my_share_coin
module my_share_coin::my_share_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct MY_SHARE_COIN has drop {}
    fun init(witness: MY_SHARE_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 6, b"silver-x", b"my share coin", b"a share coin by test", option::none(), ctx );
        // // 冻结 metadata 对象，阻止后续的修改
        // transfer::public_share_object(metadata);
        // // 将铸币的权限凭证转移到合约部署者
        // transfer::public_transfer(treasury, tx_context::sender(ctx));
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
    }

    // 铸造代币
    public fun mint_in_my_module(treasury_cap: &mut TreasuryCap<MY_SHARE_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}
