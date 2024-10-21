module web3richer_coin::web3richer_faucet_coin {

    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::transfer;

    public struct WEB3RICHER_FAUCET_COIN has drop{}

    public struct TotalSupply has key, store {
        id: UID,
        supply: balance::Supply<WEB3RICHER_FAUCET_COIN>
    }

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

        let supply = coin::treasury_into_supply(treasury);

        transfer::public_transfer(TotalSupply {
            id: object::new(ctx),
            supply
        }, ctx.sender());

    }

    public entry fun mint(supply: &mut TotalSupply, value: u64, ctx: &mut TxContext) {
        let balance = balance::increase_supply(&mut supply.supply, value);
        let coin = coin::from_balance(balance, ctx);
        transfer::public_transfer(coin, ctx.sender());
    }
}
