module web3richer_coin::web3richer_faucet_coin {

    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::transfer;

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

    public entry fun mint(treasury: &mut TreasuryCap<WEB3RICHER_FAUCET_COIN>, value: u64,  recipient: address, ctx: &mut TxContext){
        coin::mint_and_transfer(treasury, value, recipient, ctx);
    }
}
