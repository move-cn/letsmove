module w626w::faucet_coin {
    use std::option;
    use sui::coin::{Self,TreasuryCap};
    use sui::event::emit;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct FAUCET_COIN has drop {}
    
    struct MintEvent has copy, drop{
        amount: u64,
        recipient: address
    }

    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"W626WFAUCET_COIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
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
//0x3751adbdd801021467fc521204a49f1157d984658a6a7627db90add2e6e71b98
// sui client call --package 0x238ffb6b7dae866ae055ef1708c972648f8ff5fb979f77c807bbf8b461feeedf  --module faucet_coin --function mint --args 0x3751adbdd801021467fc521204a49f1157d984658a6a7627db90add2e6e71b98 100  0xccc4a24b8e2a9381d71d10453e645034a1aa0edfdaa71c6d0b64ce0e9d6c850b --gas-budget 5000000000