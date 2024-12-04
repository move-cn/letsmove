
/// Module: rayl_coin
module rayl_coin::rayl_coin {

    use std::option;
    use sui::coin::{Self,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct RAYL_COIN has drop {}

    fun init(witness: RAYL_COIN, ctx: &mut TxContext){
        let(treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"RL",
            b"RayL Coin",
            b"first coin by Ray L",
            option:: none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, ctx.sender());
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<RAYL_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

}

