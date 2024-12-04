
/// Module: mc_coin
module mc_coin::mc_coin {
    use std::option;
    use sui::coin;
    use sui::transfer::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    public struct MC_COIN has drop{}

    fun init (witness:MC_COIN,ctx: &mut TxContext) {
        let (treasury,metadata) = coin::create_currency(
            witness,
            6,
            b"MC",
            b"MC Coin",
            b"mc_coin",
            option::none(),
            ctx
        );
        transfer::public_transfer(treasury,tx_context::sender(ctx));
        transfer::public_freeze_object(metadata);

    }
    public fun mint(treasury_cap:&mut coin::TreasuryCap<MC_COIN>,account: u64,recipient: address,ctx:&mut TxContext) {
        coin::mint_and_transfer(treasury_cap,account,recipient,ctx);
    }
    public fun burn(treasury_cap: &mut coin::TreasuryCap<MC_COIN>, target: coin::Coin<MC_COIN>) {
        coin::burn(treasury_cap, target);
    }
}

