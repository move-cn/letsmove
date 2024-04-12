/// Module: my_coin
module my_coin::my_coin {
    use sui::coin;
    use sui::tx_context::sender;

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury,metadata) = coin::create_currency(witness,6,b"MYCOIN",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury,sender(ctx));
    }
}
