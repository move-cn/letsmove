module chainrex_faucet_coin::chainrex_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    public struct CHAINREX_FAUCET_COIN has drop {}

    public struct TreasuryCapHolder has key {
        id: UID,
        treasury_cap: TreasuryCap<CHAINREX_FAUCET_COIN>,
    }

    fun init(
        witness: CHAINREX_FAUCET_COIN,
        ctx: &mut TxContext
    ) {
        let (treasury_cap, metadata) = coin::create_currency<CHAINREX_FAUCET_COIN>(
            witness,
            9,
            b"CRF",
            b"CHAINREX_FAUCET_COIN",
            b"ChainRex Faucet Coin",
            option::some<Url>(
                url::new_unsafe_from_bytes(
                    b"https://avatars.githubusercontent.com/u/76983474"
                )
            ),
            ctx
        );
        transfer::public_freeze_object(metadata);

        let treasury_cap_holder = TreasuryCapHolder {
            id: object::new(ctx),
            treasury_cap,
        };
        transfer::share_object(treasury_cap_holder);
    }

    public entry fun mint(
        treasury_cap_holder: &mut TreasuryCapHolder,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let treasury_cap = &mut treasury_cap_holder.treasury_cap;
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(
        treasury_cap: &mut TreasuryCap<CHAINREX_FAUCET_COIN>,
        coin: Coin<CHAINREX_FAUCET_COIN>
    ) {
        coin::burn(treasury_cap, coin);
    }
}
