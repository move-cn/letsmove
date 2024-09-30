module task2::rzx_token {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct RZX_TOKEN has drop {}

    #[allow(unused_function)]
    fun init(witness: RZX_TOKEN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = 
            coin::create_currency<RZX_TOKEN>(witness, 2, b"RZX-sym", b"RZX-name", 
            b"RZX-desp", option::none(), ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<RZX_TOKEN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public fun burn(treasury_cap: &mut TreasuryCap<RZX_TOKEN>, coin: Coin<RZX_TOKEN>) {
        coin::burn(treasury_cap, coin);
    }
}