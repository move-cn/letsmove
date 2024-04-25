module task2::ccw2018_faucet_coin {
    use sui::coin::{Self, TreasuryCap, Coin};

    public struct CCW2018_FAUCET_COIN has drop {}
    #[allow(lint(share_owned))]
    fun init(witness: CCW2018_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness,6,b"ccw2018_faucet_coin",b"ccw2018_faucet_coin name",b"ccw2018_faucet_coin description",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(treasury_cap:&mut TreasuryCap<CCW2018_FAUCET_COIN>,amount: u64,recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<CCW2018_FAUCET_COIN>, coin: Coin<CCW2018_FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}
