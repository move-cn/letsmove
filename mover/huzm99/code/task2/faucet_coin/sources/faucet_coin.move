module faucet_coin::faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<FAUCET_COIN>(
            witness,
            9,
            b"faucet_coin",
            b"faucet_coin",
            b"faucet coin defined by huzm, everyone can access and mutate",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    
}