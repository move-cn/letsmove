module task2::faucet_coin {
    use sui::coin::{Self,TreasuryCap};
    use sui::event::emit;

    public struct FAUCET_COIN has drop {}

    public struct MintEvent has copy, drop {
        amount: u64,
        recipient: address
    }

    #[allow(lint(share_owned))]
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6,                // decimals
            b"CHENG2",           // symbol
            b"cheng's faucet coin",       // name
            b"cheng's faucet coin", // description
            option::none(),   // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCET_COIN>,
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
