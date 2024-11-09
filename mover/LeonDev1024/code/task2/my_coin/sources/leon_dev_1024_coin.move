module my_coin::leon_dev_1024_coin {
    use sui::coin::{ Self, Coin, TreasuryCap };
    use sui::tx_context::{ Self, TxContext };
    use sui::transfer;
    use std::option;

    public struct LEON_DEV_1024_COIN has drop {}

    // 传入 LEON_DEV_1024_COIN 结构体实例，用于标识代币
    fun init(witness: LEON_DEV_1024_COIN, ctx: &mut TxContext) {
        let (treasury, metaData) = coin::create_currency(
            witness,
            9,  // 小数点后 9 位
            b"LeonDev1024",  // 代币名称
            b"LDC",  // 代币符号
            b"this is a coin minted by LeonDev1024 for community rewards",  // 代币描述
            option::none(),  // 图标 URL
            ctx
        );
        transfer::public_freeze_object(metaData);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    // 铸币
    public entry fun mint(treasury_cap: &mut TreasuryCap<LEON_DEV_1024_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}