module my_coin::woodwhale {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // witness设计模式
    struct WOODWHALE has drop {}

    fun init(witness: WOODWHALE, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<WOODWHALE>(witness, 6, b"WOODWHALE", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);   // 冻结对象，使其不可变
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));    // 将管理货币权限交付给发布者
    }

    // 铸币
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<WOODWHALE>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    /// 销币
    public entry fun burn(treasury_cap: &mut TreasuryCap<WOODWHALE>, coin: Coin<WOODWHALE>) {
        coin::burn(treasury_cap, coin);
    }
}
