module mycoin::mycoin {
    use sui::coin::{Self, TreasuryCap};

    public struct MYCOIN has drop {}

		// 初始化函数，witness 用于一次性见证，即保证初始化函数只能调用一次
    fun init(witness: MYCOIN, ctx: &mut TxContext) {
        let (treasury_cap, 
            metadata) = coin::create_currency(
                witness, 
                9, 
                b"HQ", 
                b"MYCOIN", 
                b"Sui blockchain mycoin coin,create by huzm99", 
                option::none(), 
                ctx
        );

				// 冻结元数据，不允许再修改
        transfer::public_freeze_object(metadata);
        // 将 Coin 的管理权限发送给 sender
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

		// 铸造和转移代币
    public entry fun mint_and_transfer(cap: &mut TreasuryCap<MYCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(cap, amount, recipient, ctx);
    }
}