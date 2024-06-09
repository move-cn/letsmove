/// Module: task2
module task2::laozpgz_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self,Url};

    public struct LAOZPGZ_FAUCET_COIN has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: LAOZPGZ_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<LAOZPGZ_FAUCET_COIN>(
            witness,
            9,
            b"LaozpgzFaucetCoin",
            b"LAOZPGZ FAUCET COIN",
            b"lets_move task2 faucet coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/22661987")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap)
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<LAOZPGZ_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<LAOZPGZ_FAUCET_COIN>, 
        coin: Coin<LAOZPGZ_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}