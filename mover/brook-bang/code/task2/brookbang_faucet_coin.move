module task2::brookbang_faucet_coin {

    use std::option;
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::event;
    use sui::object;
    use sui::object::UID;
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    struct BROOKBANG_FAUCET_COIN has drop {}

    struct BrookbangFaucetHolder has key {
        id: UID,
        treasury_cap: TreasuryCap<BROOKBANG_FAUCET_COIN>,
    }

    struct MintEvent has copy, drop {
        amount: u64,
        recipient: address,
    }

    fun init(witness: BROOKBANG_FAUCET_COIN,ctx: &mut TxContext) {
        let (treasury_cap,metadata) = coin::create_currency(
            witness,
            9,
            b"BROOKBANG_FAUCET_COIN",
            b"BROOKBANG_FAUCET_COIN",
            b"",
            option::none(),
            ctx,
        );
        transfer::public_freeze_object(metadata);

        let brookbang_faucet_holder = BrookbangFaucetHolder {
            id: object::new(ctx),
            treasury_cap,
        };
        transfer::share_object(brookbang_faucet_holder);
    }

    public entry fun mint(holder: &mut BrookbangFaucetHolder, amount: u64, recipient: address ,ctx: &mut TxContext) {
        let treasury_cap = &mut holder.treasury_cap;
        coin::mint_and_transfer(treasury_cap, amount, tx_context::sender(ctx), ctx);
        event::emit(MintEvent{
            amount,
            recipient,
        })
    }
}