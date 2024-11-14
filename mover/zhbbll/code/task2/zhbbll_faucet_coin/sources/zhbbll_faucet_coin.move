module zhbbll_faucet_coin::zhbbll_faucet_coin{
    use sui::coin::{Self, Coin, TreasuryCap};
    // create an OTW
    public struct ZHBBLL_FAUCET_COIN has drop {}

    fun init(witness: ZHBBLL_FAUCET_COIN, ctx: &mut TxContext){
        let (treasury_cap, metadata) = coin::create_currency<ZHBBLL_FAUCET_COIN>(
            witness,
            9,
            b"ZHBBLL_FAUCET",
            b"ZHBBLL_FAUCET_COIN",
            b"ChainBabyCoin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        // share object
        transfer::public_share_object(treasury_cap);
    }
    // mint and transfer
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<ZHBBLL_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ){
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<ZHBBLL_FAUCET_COIN>,
        coin: Coin<ZHBBLL_FAUCET_COIN>
    ){
        coin::burn(treasury_cap, coin);
    }
}
