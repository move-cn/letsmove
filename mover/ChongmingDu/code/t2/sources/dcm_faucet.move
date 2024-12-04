
/// Module: dcm_faucet
module dcm_faucet::dcm_faucet {
    use std::option;
    use sui::coin;
    use sui::transfer::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    public struct DCM_FAUCET has drop{}

    fun init (witness:DCM_FAUCET,ctx: &mut TxContext) {
        let (treasury,metadata) = coin::create_currency(
            witness,
            6,
            b"DCMFA",
            b"DCMFA Coin",
            b"dcm_faucet",
            option::none(),
            ctx
        );
        transfer::public_transfer(treasury,tx_context::sender(ctx));
        transfer::public_freeze_object(metadata);

    }
    public fun mint(treasury_cap:&mut coin::TreasuryCap<DCM_FAUCET>,account: u64,recipient: address,ctx:&mut TxContext) {
        coin::mint_and_transfer(treasury_cap,account,recipient,ctx);
    }
    public fun burn(treasury_cap: &mut coin::TreasuryCap<DCM_FAUCET>, target: coin::Coin<DCM_FAUCET>) {
        coin::burn(treasury_cap, target);
    }
}

