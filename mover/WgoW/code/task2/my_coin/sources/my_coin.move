/// Module: my_coin
module my_coin::my_coin {
    use sui::coin;
    use sui::tx_context::sender;
    use sui::coin::TreasuryCap;

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury,metadata) = coin::create_currency(witness,6,b"KUNCOIN",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury,sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}
