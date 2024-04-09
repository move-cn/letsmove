module faucet_coin::woodwhale {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct WOODWHALE has drop {}

    fun init(witness: WOODWHALE, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency<WOODWHALE>(witness, 6, b"SHEEPBOTANY", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);   // 冻结对象，使其不可变
        transfer::public_transfer(treasury, tx_context::sender(ctx)) // return
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<WOODWHALE>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<WOODWHALE>, coin: Coin<WOODWHALE>) {
        coin::burn(treasury_cap, coin);
    }
}