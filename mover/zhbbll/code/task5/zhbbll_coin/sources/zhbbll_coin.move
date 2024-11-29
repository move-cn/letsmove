module zhbbll_coin::zhbbll_coin{
    use sui::coin::{Self, Coin, TreasuryCap};
    // create an OTW
    public struct ZHBBLL_COIN has drop {}

    fun init(witness: ZHBBLL_COIN, ctx: &mut TxContext){
        let (treasury_cap, metadata) = coin::create_currency<ZHBBLL_COIN>(
            witness,
            9,
            b"ZHBBLL",
            b"ZHBBLL_COIN",
            b"ChainBabyCoin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap,tx_context::sender(ctx));
    }
    // mint and transfer
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<ZHBBLL_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ){
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<ZHBBLL_COIN>,
        coin: Coin<ZHBBLL_COIN>
    ){
        coin::burn(treasury_cap, coin);
    }
}
