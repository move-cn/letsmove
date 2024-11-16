/*
/// Module: quantumae_faucet_coin
module quantumae_faucet_coin::quantumae_faucet_coin;
*/
module quantumae_faucet_coin::quantumae_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct QUANTUMAE_FAUCET_COIN has drop {}

    fun init(
        witness: QUANTUMAE_FAUCET_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<QUANTUMAE_FAUCET_COIN>(
            witness,
            9,
            b"CRF",
            b"QUANTUMAE_FAUCET_COIN",
            b"Quantumae Faucet Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://github.com/Quantumae/all/blob/main/my_coin.png"
                )
            ),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<QUANTUMAE_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<QUANTUMAE_FAUCET_COIN>,
        coin: Coin<QUANTUMAE_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);

    }
}


