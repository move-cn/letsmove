
module task2::ridesun_coin {
    use sui::coin::{Self,Coin, TreasuryCap};
    
    public struct RIDESUN_COIN has drop {}
    fun init(witness: RIDESUN_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            2,
            b"RIDESUN_COIN",
            b"RIDESUN",
            b"learning for letsmove, power by ridesun",
            option::none(),
            ctx
    );

    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }
    public fun mint(
        treasury_cap:&mut TreasuryCap<RIDESUN_COIN>,
        amount:u64,
        recipient:address,
        ctx:&mut TxContext
    ){
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(treasury_cap: &mut TreasuryCap<RIDESUN_COIN>, coin: Coin<RIDESUN_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}

