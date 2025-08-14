module web3richer_faucet_coin::web3richer_faucet_coin {

    use sui::coin::{Self, TreasuryCap, Coin};

    public struct WEB3RICHER_FAUCET_COIN has drop{}

    fun init(witness: WEB3RICHER_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) =
            coin::create_currency(
                witness,
                8,
                b"WRCF",
                b"Web3Richer Faucet Coin",
                b"the faucet coin for web3richer",
                option::none(),
                ctx
            );

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);

    }

    public fun mint(treasury_cap: &mut TreasuryCap<WEB3RICHER_FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<WEB3RICHER_FAUCET_COIN>, coin: Coin<WEB3RICHER_FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}
