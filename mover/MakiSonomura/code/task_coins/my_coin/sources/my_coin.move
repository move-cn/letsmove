
/// Module: my_coin
module my_coin::my_coin {
    use sui::coin::{Self, TreasuryCap};
    public struct MY_COIN has drop {}
    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        
        let (treasury, metadata) = coin::create_currency(
            witness,
            8,
            b"MKSNMR",
            b"Maki Sonomura's Coin",
            b"Nothing",
            option::none(),
            ctx,
        );
        transfer::public_transfer(treasury, ctx.sender());
        transfer::public_freeze_object(metadata);
    }
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ){
        let token = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(token, recipient);
    }

}

