module faucet_coin::faucet_coin {
    use sui::coin::{Self, TreasuryCap};
    use sui::url::Url;
    use sui::transfer::{public_freeze_object, public_share_object};

    
    public struct FAUCET_COIN has drop {}

    const MAX_MINT_AMOUNT: u64 = 1_000_000_000;
    
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
            
            let icon_url = option::none<Url>();

            
            let (treasury_cap, coin_metadata) = 
            coin::create_currency(witness, 8, b"web3CL+faucet", b"web3CL's faucet", b"this is a test faucet from web3CL", icon_url, ctx);

            public_freeze_object(coin_metadata);

            public_share_object(treasury_cap);

        }
    
    public entry fun mint(treasury_cap: &mut TreasuryCap<FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {
        assert!(amount <= MAX_MINT_AMOUNT, 0);
        coin::mint_and_transfer(treasury_cap, amount, tx_context::sender(ctx), ctx);
    }
}