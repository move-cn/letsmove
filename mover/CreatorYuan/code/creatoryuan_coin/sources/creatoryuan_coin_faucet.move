/// Module: creatoryuan_coin
module creatoryuan_coin::creatoryuan_coin {

    use sui::tx_context::TxContext;
    use sui::coin::{Self, TreasuryCap};

    public struct CREATORYUAN_COIN has drop{}

    fun init(witness: CREATORYUAN_COIN, ctx: &mut TxContext){
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"cyc",
            b"creator yuan coin",
            b"cy build move, create new world",
            option::none(),
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, ctx.sender())
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<CREATORYUAN_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

}
Faucet