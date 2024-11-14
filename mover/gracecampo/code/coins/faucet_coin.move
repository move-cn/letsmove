module coins::faucet_coin{
	
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct FAUCET_COIN has drop{}

    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
            let (treasury, metadata) = coin::create_currency(witness, 6, b"FAUCET_COIN", b"", b"", option::none(), ctx);
            transfer::public_freeze_object(metadata);
            transfer:: public_share_object(treasury);
    }

    public entry fun get_coin(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>, 
        amount: u64, 
        recipient: address, 
        ctx: &mut TxContext,
    ) {
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx);
    }
}