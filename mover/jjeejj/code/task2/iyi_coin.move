/// Module: iyi_coin
module iyi_coin::iyi_coin {
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct IYI_COIN has drop {
       
    }

    fun init(witness: IYI_COIN, ctx: &mut TxContext){
        let (treasury, metadata) = coin::create_currency(witness, 6, b"iyi", b"iyi token", b"desc", option::none(), ctx);
        // 冻结 metadata 对象，阻止后续的修改
        transfer::public_freeze_object(metadata);
        // 将铸币的权限凭证转移到合约部署者
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    // 铸造 token
    public fun mint_in_my_module(treasury_cap: &mut TreasuryCap<IYI_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}
