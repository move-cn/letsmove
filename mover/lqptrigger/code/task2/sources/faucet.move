module task2::faucetcoin {
    use sui::coin::{Self, TreasuryCap};

    public struct FAUCETCOIN has drop {}

    fun init(witness: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness,6,b"lqptriggerFaucet",b"lqptriggerFaucet",b"learning sui move",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(treasury_cap:&mut TreasuryCap<FAUCETCOIN>,amount: u64,recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }
}
