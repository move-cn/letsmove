/// Module: mycoin
module mycoin1::mycoin1 {
    use sui::coin::{Self, Coin, TreasuryCap};
 
    public struct MYCOIN1 has drop {}
 
    fun init(witness: MYCOIN1, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"singmin",
            b"singmin coin",
            b"singmin coin",
            option::none(),
            ctx
        );
 
        transfer::public_freeze_object(metadata);
 
        transfer::public_transfer(treasury, ctx.sender());
    }
 
    public fun mint(
        treasury_cap: &mut TreasuryCap<MYCOIN1>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }
 
    public fun burn(treasury_cap: &mut TreasuryCap<MYCOIN1>, coin: Coin<MYCOIN1>) {
        coin::burn(treasury_cap, coin);
    }
 
    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(MYCOIN1 {}, ctx)
    }
}
 