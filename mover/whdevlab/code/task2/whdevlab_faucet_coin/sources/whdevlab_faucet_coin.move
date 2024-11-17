/// Module: whdevlab_faucet_coin
module whdevlab_faucet_coin::whdevlab_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct WHDEVLAB_FAUCET_COIN has drop {}

    fun init(witness: WHDEVLAB_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<WHDEVLAB_FAUCET_COIN>(
            witness,
            9,
            b"WHDEVLAB_FAUCET",
            b"faucet coin",
            b"faucet coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<WHDEVLAB_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(
        treasury_cap: &mut TreasuryCap<WHDEVLAB_FAUCET_COIN>, 
        coin: Coin<WHDEVLAB_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}

