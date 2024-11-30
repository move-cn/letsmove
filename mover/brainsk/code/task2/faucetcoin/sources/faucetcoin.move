module faucetcoin::faucetcoin{
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct FAUCETCOIN has drop {}

    fun init(otw: FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<FAUCETCOIN>(otw, 2, b"FAUCETCOIN", b"FaucetCoin", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<FAUCETCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    // burn coins
    public entry fun burn(treasury_cap: &mut TreasuryCap<FAUCETCOIN>, coin: Coin<FAUCETCOIN>) {
        coin::burn(treasury_cap, coin);
    }
}
