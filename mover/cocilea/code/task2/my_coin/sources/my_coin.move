module my_coin::cocilea_coin {
    use sui::coin;

    public struct COCILEA_COIN has drop {}

    fun init(witness: COCILEA_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"COCILEA COIN", b"COCILEA COIN", b"COCILEA COIN", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(treasury: &mut coin::TreasuryCap<COCILEA_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }

    public entry fun burn(treasury: &mut coin::TreasuryCap<COCILEA_COIN>, coin: coin::Coin<COCILEA_COIN>) {
        coin::burn(treasury, coin);
    }
}
