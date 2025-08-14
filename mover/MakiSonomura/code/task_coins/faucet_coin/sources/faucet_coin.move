
/// Module: faucet_coin
module faucet_coin::faucet_coin {

    public struct FAUCET_COIN has drop {}

    use sui::coin::{Self, TreasuryCap};
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        
        let (treasury, metadata) = coin::create_currency(
            witness,
            8,
            b"MKSNMRF",
            b"Maki Sonomura's Faucet Coin",
            b"Nothing",
            option::none(),
            ctx,
        );
        // transfer::public_transfer(treasury, ctx.sender());
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ){
        let token = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(token, recipient);
    }
}

