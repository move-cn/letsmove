
/// Module: share_coin
module share_coin::share_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct SHARE_COIN has drop{}

    fun init (witness:SHARE_COIN,ctx: &mut TxContext) {
        let (treasury,metadata) = coin::create_currency(
            witness,
            6,
            b"share coin",
            b"share coin",
            b"this is share_coin",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
        
    }
    public fun mint(treasury_cap:&mut coin::TreasuryCap<SHARE_COIN>,account: u64,recipient: address,ctx:&mut TxContext) {
        coin::mint_and_transfer(treasury_cap,account,recipient,ctx);
    }
}

