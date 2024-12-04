
module task2::ridesun_FAUCET_coin {
    use sui::coin::{Self,Coin, TreasuryCap};
    
    public struct RIDESUN_FAUCET_COIN has drop {}
    fun init(witness: RIDESUN_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            2,
            b"RIDESUN_FAUCET_COIN",
            b"RIDESUN",
            b"ridesun's first faucet coin",
            option::none(),
            ctx
    );

    transfer::public_freeze_object(metadata);
    transfer::public_share_object(treasury_cap);
    }
    public fun mint(
        treasury_cap:&mut TreasuryCap<RIDESUN_FAUCET_COIN>,
        amount:u64,
        recipient:address,
        ctx:&mut TxContext
    ){
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public fun burn(treasury_cap: &mut TreasuryCap<RIDESUN_FAUCET_COIN>, coin: Coin<RIDESUN_FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}
