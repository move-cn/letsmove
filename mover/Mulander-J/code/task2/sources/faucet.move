module task2::mulander_faucet {
    use sui::coin::{Self,TreasuryCap};
    use sui::event::emit;

    public struct MULANDER_FAUCET has drop {}

    public struct MintEvent has copy, drop {
        amount: u64,
        recipient: address
    }

    fun init(witness: MULANDER_FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6,                // decimals
            b"LANF",           // symbol
            b"Mulander faucet coin",       // name
            b"Faucet in sui move", // description
            option::none(),   // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
        // transfer::public_share_object(treasury_cap);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MULANDER_FAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);

        emit(MintEvent{
            amount,
            recipient
        })
    }
}